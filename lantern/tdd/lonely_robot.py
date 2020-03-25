import random

class Asteroid:
    '''Создает Астероид'''
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def create_obstacles(self):
        '''Создает преграду, в диапазоне астероида"'''
        self.cor_x = 25 #random.randit(1, self.x)
        self.cor_y = 13 #random.randit(1, self.y)
        return self.cor_x, self.cor_y

class Robot:
    '''Создает робота, принимает координаты астероида, проверяет попал ли робот на астероид'''
    def __init__(self, x, y, asteroid, direction):
        self.x = x
        self.y = y
        self.asteroid = asteroid
        self.obsrtacle = asteroid.create_obstacles()
        self.direction = direction
        if self.x > self.asteroid.x or self.y > self.asteroid.y:
            raise MissAsteroidError()

    def turn_left(self):
        '''Поворачивает в лево'''
        turn = {'N':'W', 'W':'S', 'S':'E', 'E':'N' }
        self.direction = turn[self.direction]

    def turn_right(self):
        '''Поворачивает в право'''
        turn = {'N':'E', 'E':'S', 'S':'W', 'W':'N' }
        self.direction = turn[self.direction]

    def move_forward(self):
        '''Едит вперед'''
        if self.direction == 'W':
            self.x = self.x - 1
        elif self.direction == 'N':
            self.y = self.y + 1
        elif self.direction == 'E':
            self.x = self.x + 1
        elif self.direction == 'S':
            self.y = self.y - 1

    def move_backward(self):
        '''Едит назад'''
        if self.direction == 'W':
            self.x = self.x + 1
        elif self.direction == 'N':
            self.y = self.y - 1
        elif self.direction == 'E':
            self.x = self.x - 1
        elif self.direction == 'S':
            self.y = self.y + 1

    def check_moove_robots(self, x, y):
        '''Проверяет упал ли робот с астероида, наткнулся ли на приграду'''
        cordinates_asteroid = self.asteroid.x, self.asteroid.y
        cordinates_move_robots = x, y
        if cordinates_move_robots > cordinates_asteroid:
            raise FallsFromAsteroidError()
        elif cordinates_move_robots == self.obsrtacle:
            raise RestAgainstAnObstacleError()
        return x, y

class MissAsteroidError(Exception):
    pass

class FallsFromAsteroidError(Exception):
    pass

class RestAgainstAnObstacleError(Exception):
    pass
