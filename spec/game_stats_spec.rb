# frozen_string_literal: true

require_relative '../lib/models/game'
require_relative '../lib/models/game_stats'

RSpec.describe GameStats do
  let(:game_stats) { GameStats.new }

  it 'adds a game' do
    game = Game.new
    game_stats.add_game(game)
    expect(game_stats.games).to include(game)
  end

  it 'generates correct JSON' do
    game1 = Game.new
    game1.register_player(1, 'Player1')
    game1.register_player(2, 'Player2')
    game1.handle_kill(1, 2, 'shotgun')
    game_stats.add_game(game1)

    game2 = Game.new
    game2.register_player(1, 'Player1')
    game2.register_player(3, 'Player3')
    game2.handle_kill(1, 3, 'rocket')
    game_stats.add_game(game2)

    json = game_stats.generate_json
    expect(json['game_1'][:total_kills]).to eq(1)
    expect(json['game_1'][:players]).to eq(%w[Player1 Player2])
    expect(json['game_1'][:kills]).to eq({ 'Player1' => 1, 'Player2' => 0 })
    expect(json['game_1'][:kills_by_means]).to eq({ 'shotgun' => 1 })

    expect(json['game_2'][:total_kills]).to eq(1)
    expect(json['game_2'][:players]).to eq(%w[Player1 Player3])
    expect(json['game_2'][:kills]).to eq({ 'Player1' => 1, 'Player3' => 0 })
    expect(json['game_2'][:kills_by_means]).to eq({ 'rocket' => 1 })
  end
end
