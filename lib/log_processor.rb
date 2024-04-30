# frozen_string_literal: true

require './lib/models/game'
require './lib/models/game_stats'

class LogProcessor
  def initialize(file_path, output_file)
    @file_path = file_path
    @output_file = output_file
    @game_stats = GameStats.new
  end

  def process_log_file
    logs = File.read(@file_path)
    current_game = nil

    logs.each_line do |line|
      case line
      when /InitGame/
        current_game = Game.new
        @game_stats.add_game(current_game)
      when /ClientUserinfoChanged: (\d+) n\\([^\\]+)/
        current_game.register_player(Regexp.last_match(1).to_i, Regexp.last_match(2))
      when /Kill: (\d+) (\d+) (\d+): <world> killed (.+) by (.+)/
        current_game.handle_kill(
          Regexp.last_match(2).to_i,
          Regexp.last_match(2).to_i,
          Regexp.last_match(5)
        )
      when /Kill: (\d+) (\d+) (\d+): (.+) killed (.+) by (.+)/
        current_game.handle_kill(
          Regexp.last_match(1).to_i,
          Regexp.last_match(2).to_i,
          Regexp.last_match(6)
        )
      end
    end

    output = @game_stats.generate_json
    File.write(@output_file, JSON.pretty_generate(output))
  end
end
