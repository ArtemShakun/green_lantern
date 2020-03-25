import pytest
from lonely_robot import *

class TestRobotCreation:
    def test_parameters(self):
        x, y = 10, 15
        asteroid = Asteroid(x+5, y+5)
        direction = 'E'
        robot = Robot(x, y, asteroid, direction)
        assert robot.x == 10
        assert robot.y == 15
        assert robot.direction == direction
        assert robot.asteroid == asteroid

    @pytest.mark.parametrize(
        "asteroid_size, robot_coordinates",
        (
                ((15, 25), (26, 30)),
                ((15, 25), (26, 24)),
                ((15, 25), (15, 27)),
        )
    )
    def test_check_if_robot_on_asteroid(self, asteroid_size, robot_coordinates):
        with pytest.raises(MissAsteroidError):
            asteroid = Asteroid(*asteroid_size)
            Robot(*robot_coordinates, asteroid, 'W')

class Test_Move:
    def setup(self):
        self.x, self.y = 10, 15
        self.asteroid = Asteroid(self.x+5, self.y+5)

    @pytest.mark.parametrize('curent_direction, result',
           [("N", "W"),("W", "S"),
            ("S", "E"),("E", "N")])

    def test_turn_left(self, curent_direction, result):
        robot = Robot(self.x, self.y, self.asteroid, curent_direction)
        robot.turn_left()
        assert robot.direction == result

    @pytest.mark.parametrize('curent_direction, result',
            [("N", "E"),("E", "S"),
             ("S", "W"),("W", "N")])

    def test_turn_right(self, curent_direction, result):
        robot = Robot(self.x, self.y, self.asteroid, curent_direction)
        robot.turn_right()
        assert robot.direction == result

    @pytest.mark.parametrize('direction, move_x, move_y',
            [('W', 9, 15), ('N', 10, 16),
             ('E', 11, 15), ('S', 10, 14)
            ])

    def test_move_forward(self, direction, move_x, move_y):
        robot = Robot(self.x, self.y, self.asteroid, direction)
        robot.move_forward()
        assert robot.x == move_x and robot.y == move_y

    @pytest.mark.parametrize('direction, move_x, move_y',
            [('W', 11, 15), ('N', 10, 14),
             ('E', 9, 15), ('S', 10, 16)
             ])

    def test_move_backward(self, direction, move_x, move_y):
        robot = Robot(self.x, self.y, self.asteroid, direction)
        robot.move_backward()
        assert robot.x == move_x and robot.y == move_y

    def test_miss_asteroidError(self):
        with pytest.raises(FallsFromAsteroidError):
            asteroid = Asteroid(self.x, self.y)
            robot = Robot(self.x, self.y, asteroid, 'W')
            robot.move_backward()
            robot.check_moove_robots(robot.x, robot.y)


    def test_check_if_robot_in_front_obstacle_forward(self):
        with pytest.raises(RestAgainstAnObstacleError):
            asteroid = Asteroid(50, 50)
            robot = Robot(26, 13, asteroid, 'W')
            robot.move_forward()
            robot.check_moove_robots(robot.x, robot.y)

    def test_check_if_robot_in_front_obstacles_backward(self):
        with pytest.raises(RestAgainstAnObstacleError):
            asteroid = Asteroid(50, 50)
            robot = Robot(24, 13, asteroid, 'W')
            robot.move_backward()
            robot.check_moove_robots(robot.x, robot.y)
