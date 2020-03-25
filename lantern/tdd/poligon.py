import random
'''
+1. Создаем робота с позицией и направлением;
+2. Проверить не пропустил ли робот астероид при призимлении(не промазал ли?)
+3. Создать функцию поворота в лево в право
+4. Создать функцию движение вперед назад
+5. Проверка на падение с астероида
+6. Создание преграды
+7. Проверка робота на преграду.
'''
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
        self.obsrtacl = asteroid.create_obstacles()
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
        '''Едет вперед, и проверяет нет ли преграды'''
        if self.direction == 'W':
            self.x = self.x - 1
        elif self.direction == 'N':
            self.y = self.y + 1
        elif self.direction == 'E':
            self.x = self.x + 1
        elif self.direction == 'S':
            self.y = self.y - 1
        check = check(self.x, self.y)
        return check

    def move_backward(self):
        '''Едет вперед, и проверяет нет ли преграды'''
        if self.direction == 'W':
            self.x = self.x + 1
        elif self.direction == 'N':
            self.y = self.y - 1
        elif self.direction == 'E':
            self.x = self.x - 1
        elif self.direction == 'S':
            self.y = self.y + 1
        check = check(self.x, self.y)
        return check

    def check(self, self.x, self.y):
        '''Делает проверку не упал ли робот при движении и нет ли преграды'''
        move_robot = self.x, self.y
        if move_robot > self.asteroid:
            raise FallsFromAsteroidError()
        elif move_robot == self.obsrtacl:
            raise False_robot_obstacles_Error()
        return self.x, self.y

class False_create_obstacles_Error(Exception):
    pass

class MissAsteroidError(Exception):
    pass

class FallsFromAsteroidError(Exception):
    pass

class False_robot_obstacles_Error(Exception):
    pass
