# Pawn Simulator - Ruby Terminal Application

The Pawn Simulator is a Ruby terminal application that simulates the movement of a pawn on a chess board. The pawn can move on an 8x8 chess board, and the application follows specific rules for its movement.


## Installation

To install and set up the Pawn Simulator application, follow these steps:

### Clone the repository:

```bash
git clone https://github.com/your-username/pawn-simulator.git
```
### Change directory to the application folder:
```bash
cd pawn-simulator
```
### Install Gem
```bash
bundle install
```

### Sample To Run
```bash
pawn_simulator = PawnSimulator.new

pawn_simulator.place(0, 0, 'NORTH', 'WHITE')
pawn_simulator.move
puts pawn_simulator.report # Output: 0,1,NORTH,WHITE

pawn_simulator.place(0, 0, 'NORTH', 'BLACK')
pawn_simulator.left
puts pawn_simulator.report # Output: 0,0,WEST,BLACK

pawn_simulator.place(1, 2, 'EAST', 'BLACK')
pawn_simulator.move
pawn_simulator.move
pawn_simulator.left
pawn_simulator.move
puts pawn_simulator.report # Output: 3,3,NORTH,BLACK
```

## Usage

The Pawn Simulator application can read commands to move the pawn on the chess board and report its position. The following commands are supported:

- `PLACE X,Y,F,C`: Places the pawn on the board in position X, Y, facing NORTH, SOUTH, EAST, or WEST, and Color (WHITE or BLACK).
- `MOVE`: Moves the pawn one unit forward in the direction it is currently facing.
- `LEFT`: Rotates the pawn 90 degrees to the left.
- `RIGHT`: Rotates the pawn 90 degrees to the right.
- `REPORT`: Announces the X, Y, F, and C of the pawn.

**Note**: The application will discard all commands until a valid `PLACE` command has been executed.

## Running the Application

To run the Pawn Simulator application, follow these steps:

1. Open a terminal and navigate to the application folder.

2. Run the main Ruby script:

```bash
ruby pawn_simulator.rb
```
### Running the Application

The application will prompt you to enter commands. Use the supported commands mentioned in the "Usage" section to move the pawn on the chess board.

### Running RSpec Tests

The Pawn Simulator application comes with RSpec tests to ensure its functionality and behavior. To run the RSpec tests, follow these steps:

1. Open a terminal and navigate to the application folder.

2. Run the RSpec command:

```bash
rspec spec/pawn_simulator_spec.rb
```
The RSpec tests will be executed, and the results will be displayed in the terminal.

Please note that this README assumes you have a `pawn_simulator.rb` file as the main script and a corresponding `pawn_simulator_spec.rb` file for RSpec tests. Modify the README file based on your actual file structure and code implementation. Ensure that users understand how to install, use, and test the Pawn Simulator application in the terminal.

Copy and paste this content into your README.md file, and it should look great with proper styling and formatting. Feel free to customize the content based on your specific application and adjust the formatting as needed.
