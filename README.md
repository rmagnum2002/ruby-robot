# Toy Robot Simulator

## Table of contents:

* [Description](./README.md#description)
* [Example Input and Output](./README.md#example-input-and-output)
* [Setup](./README.md#setup)
* [Running the app](./README.md#running-the-app)
* [Running the tests](./README.md#running-the-tests)

## Description

* The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.

* There are no other obstructions on the table surface.

* The robot is free to roam around the surface of the table, but must be prevented from going out of area. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

Create an application that can read in commands of the following form:
```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```

* `PLACE` puts the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.

* The origin (0,0) can be considered to be the SOUTH WEST most corner.

* The application should discard all commands in the sequence until a valid `PLACE` command has been executed

* `MOVE` moves the toy robot one unit forward in the direction it is currently facing.

* `LEFT` and `RIGHT` rotates the robot 90 degrees in the given direction without changing the position of the robot.

* `REPORT` announces the X,Y and F of the robot.

### Example Input and Output:

#### Example a

    PLACE 0,0,NORTH
    MOVE
    REPORT

Expected output:

    0,1,NORTH

#### Example b

    PLACE 0,0,NORTH
    LEFT
    REPORT

Expected output:

    0,0,WEST

#### Example c

    PLACE 1,2,NORTH
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT

Expected output

    0,4,WEST

## Setup

1. `Ruby >= 2.2.3` required.

2. Install the [bundler gem](http://bundler.io/) by running:

    ```gem install bundler```

3. Clone this repo:

    ```git clone git@github.com:rmagnum2002/ruby-robot.git```

4. Change to the app directory:

    ```cd ruby-robot```

5. Install dependencies:

    ```bundle install```

### Running the app:

    ruby run.rb

### Running the tests:

    bundle exec rspec
