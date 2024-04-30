# frozen_string_literal: true

require './lib/models/player'

class Game
  attr_accessor :total_kills, :players, :kills_by_means

  def initialize
    @total_kills = 0
    @players = {}
    @kills_by_means = Hash.new(0)
  end

  def register_player(player_id, player_name)
    if @players.key?(player_id)
      @players[player_id].name = player_name
    else
      @players[player_id] = Player.new(player_name) unless @players.key?(player_id)
    end
  end

  def handle_kill(killer_id, victim_id, means_of_death)
    @total_kills += 1

    if victim_id == killer_id
      decrease_kill(victim_id)
    else
      increase_kill(killer_id)
    end

    @kills_by_means[means_of_death] += 1
  end

  def decrease_kill(player_id)
    @players[player_id].kills -= 1 if @players.key?(player_id)
  end

  def increase_kill(player_id)
    @players[player_id].kills += 1 if @players.key?(player_id)
  end
end
