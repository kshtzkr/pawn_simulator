# spec/pawn_simulator_spec.rb
require_relative '../pawn_simulator'

RSpec.describe PawnSimulator do
  let(:pawn_simulator) { PawnSimulator.new }

  describe '#place' do
    context 'with valid coordinates and facing direction' do
      it 'places the pawn on the board' do
        pawn_simulator.place(0, 0, 'NORTH', 'WHITE')
        expect(pawn_simulator.instance_variable_get(:@x)).to eq(0)
        expect(pawn_simulator.instance_variable_get(:@y)).to eq(0)
        expect(pawn_simulator.instance_variable_get(:@facing)).to eq('NORTH')
        expect(pawn_simulator.instance_variable_get(:@colour)).to eq('WHITE')
      end
    end

    context 'with invalid coordinates or facing direction' do
      it 'does not place the pawn on the board' do
        pawn_simulator.place(10, 0, 'INVALID', 'BLACK')
        expect(pawn_simulator.instance_variable_get(:@x)).to be_nil
        expect(pawn_simulator.instance_variable_get(:@y)).to be_nil
        expect(pawn_simulator.instance_variable_get(:@facing)).to be_nil
        expect(pawn_simulator.instance_variable_get(:@colour)).to be_nil
      end
    end
  end

  describe '#move' do
    context 'when the pawn is placed on the board' do
      it 'moves the pawn one unit forward in the current facing direction' do
        pawn_simulator.place(0, 0, 'NORTH', 'WHITE')
        pawn_simulator.move
        expect(pawn_simulator.report).to eq('0,1,NORTH,WHITE')
      end
    end

    context 'when the pawn is not placed on the board' do
      it 'does not move the pawn' do
        pawn_simulator.move
        expect(pawn_simulator.report).to be_nil
      end
    end

    context 'when the move would cause the pawn to fall off the board' do
      it 'does not move the pawn' do
        pawn_simulator.place(7, 7, 'NORTH', 'WHITE')
        pawn_simulator.move
        expect(pawn_simulator.report).to eq('7,7,NORTH,WHITE')
      end
    end
  end

  describe '#left' do
    it 'rotates the pawn 90 degrees to the left' do
      pawn_simulator.place(0, 0, 'NORTH', 'WHITE')
      pawn_simulator.left
      expect(pawn_simulator.report).to eq('0,0,WEST,WHITE')
    end
  end

  describe '#right' do
    it 'rotates the pawn 90 degrees to the right' do
      pawn_simulator.place(0, 0, 'NORTH', 'WHITE')
      pawn_simulator.right
      expect(pawn_simulator.report).to eq('0,0,EAST,WHITE')
    end
  end

  describe '#report' do
    context 'when the pawn is placed on the board' do
      it 'returns the current position and direction of the pawn' do
        pawn_simulator.place(2, 3, 'EAST', 'BLACK')
        expect(pawn_simulator.report).to eq('2,3,EAST,BLACK')
      end
    end

    context 'when the pawn is not placed on the board' do
      it 'returns nil' do
        expect(pawn_simulator.report).to be_nil
      end
    end
  end
end
