# frozen_string_literal: true

require_relative '../lib/models/game'

RSpec.describe Game do
  let(:game) { Game.new }

  it 'registers a new player' do
    game.register_player(1, 'Player1')
    expect(game.players[1].name).to eq('Player1')
  end

  it 'handles kills correctly' do
    game.register_player(1, 'Player1')
    game.register_player(2, 'Player2')

    game.handle_kill(1, 2, 'shotgun')
    expect(game.players[1].kills).to eq(1)
    expect(game.players[2].kills).to eq(0)

    game.handle_kill(2, 1, 'rocket')
    expect(game.players[2].kills).to eq(1)
    expect(game.players[1].kills).to eq(1)
  end

  it 'decreases kills correctly' do
    game.register_player(1, 'Player1')
    game.register_player(2, 'Player2')

    game.handle_kill(1, 1, 'shotgun')
    expect(game.players[1].kills).to eq(-1)
  end

  it 'change the player name correctly' do
    game.register_player(1, 'Player1')
    game.register_player(1, 'Player1New')

    expect(game.players[1].name).to eq('Player1New')
  end
end
