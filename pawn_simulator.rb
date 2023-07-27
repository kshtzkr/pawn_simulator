class PawnSimulator
  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  def initialize
    @x = nil
    @y = nil
    @facing = nil
    @colour = nil
  end

  def place(x, y, facing, colour)
    return unless valid_coordinates?(x, y) && DIRECTIONS.include?(facing)

    @x = x
    @y = y
    @facing = facing
    @colour = colour
  end

  def move
    return unless placed?

    new_x, new_y = new_coordinates(@x, @y, @facing)
    return unless valid_coordinates?(new_x, new_y)

    @x = new_x
    @y = new_y
  end

  def left
    return unless placed?

    current_direction_index = DIRECTIONS.index(@facing)
    @facing = DIRECTIONS.rotate(-1)[current_direction_index]
  end

  def right
    return unless placed?

    current_direction_index = DIRECTIONS.index(@facing)
    @facing = DIRECTIONS.rotate(1)[current_direction_index]
  end

  def report
    return unless placed?

    "#{@x},#{@y},#{@facing},#{@colour}"
  end

  private

  def valid_coordinates?(x, y)
    x.between?(0, 7) && y.between?(0, 7)
  end

  def placed?
    !@x.nil? && !@y.nil? && !@facing.nil?
  end

  def new_coordinates(x, y, facing)
    case facing
    when 'NORTH'
      [x, y + 1]
    when 'EAST'
      [x + 1, y]
    when 'SOUTH'
      [x, y - 1]
    when 'WEST'
      [x - 1, y]
    end
  end
end

# pawn_simulator = PawnSimulator.new

# pawn_simulator.place(0, 0, 'NoRTH', 'WHITE')
# pawn_simulator.move
# puts pawn_simulator.report # Output: 0,1,NORTH,WHITE

# pawn_simulator.place(0, 0, 'NORTH', 'BLaCK')
# pawn_simulator.left
# puts pawn_simulator.report # Output: 0,0,WEST,BLACK

# pawn_simulator.place(1, 2, 'EAST', 'BLACK')
# pawn_simulator.move
# pawn_simulator.move
# pawn_simulator.left
# pawn_simulator.move
# puts pawn_simulator.report # Output: 3,3,NORTH,BLACK
