# frozen_string_literal: true

class GameStats
  attr_accessor :games

  def initialize
    @games = []
  end

  def add_game(game)
    @games << game
  end

  def generate_json
    game_json = {}
    @games.each_with_index do |game, index|
      game_json["game_#{index + 1}"] = {
        total_kills: game.total_kills,
        players: game.players.values.map(&:name),
        kills: game.players.map { |_, player| [player.name, player.kills] }.sort_by { |_, kills| -kills }.to_h,
        kills_by_means: game.kills_by_means
      }
    end
    game_json
  end
end
