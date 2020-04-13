from app import app
from fake_storage import FakeStorage
import inject
from data_base import GOODS, GOODS_UPPDATE

def configure_test(binder):
    db = FakeStorage()
    binder.bind('DB', db)


class Initializer:
    def setup(self):
        inject.clear_and_configure(configure_test)
        app.config['TESTING'] = True
        with app.test_client() as client:
            self.client = client


class TestUsers(Initializer):
    def test_create_new_user(self):
        self.resp = self.client.post('/users', json={'name': 'John Doe'})
        assert self.resp.status_code == 200
        assert self.resp.json == {'user_id': 1 }

    def test_get_user(self):
        resp = self.client.post('/users', json = {'name' : 'Duny Kulakova'})
        resp = self.client.get(f'/users/{1}')
        assert resp.status_code == 200
        assert resp.json == {'name' : 'Duny Kulakova'}

    def test_get_user_error(self):
        resp = self.client.get(f'/users/{1}')
        assert resp.status_code == 404
        assert resp.json == {'error':'No such user_id 1'}

    def test_uppdate_user(self):
        resp = self.client.post('/users', json = {'name' : 'John Doe'})
        resp = self.client.put(f'/users/{1}', json = {'name': 'Johna Doe'})
        assert resp.status_code == 200
        assert resp.json == {'status': 'success'}

    def test_update_user_error(self):
        resp = self.client.put('/users/3', json = {'name': 'Johna Doe'})
        assert resp.status_code == 404
        assert resp.json == {'error':'No such user_id 3'}

class TestGoods(Initializer):
    def test_create_new_products(self):
        resp = self.client.post('/goods', json = GOODS)
        assert resp.status_code == 200
        assert resp.json == {'numbers of items created': 4}

    def test_get_products(self):
        resp = self.client.post('/goods', json = GOODS)
        resp = self.client.get('/goods', json = {'id':1})
        assert resp.status_code == 200
        assert resp.json == {'id': 1, 'name': 'Chocolate_bar', 'price': 34}


    def test_uppdate_products_error(self):
        resp = self.client.post('/goods',  json = GOODS)
        resp = self.client.put('/goods', json = GOODS_UPPDATE)
        assert resp.status_code == 200
        assert resp.json == {'successfully_updated': 3, 'error': {'no such id in goods': [7]}}

class TestStore(Initializer):
    def test_create_new_store(self):
        resp = self.client.post('/users', json = {'name' : 'Olha Bukina'})
        resp = self.client.post('/users', json = {'name' : 'Duny Kulakova'})
        resp = self.client.post('/store', json = {'name':'Mad Cow', 'Location':'Lviv', 'manager_id': 2 })
        assert resp.status_code == 200
        assert resp.json == {'stores_id': 1}

    def test_create_user_error(self):
        resp = self.client.post('/users', json = {'name' : 'Olha Bukina'})
        resp = self.client.post('/store', json = {'name':'Mad Cow', 'Location':'Lviv', 'manager_id': 2 })
        assert resp.status_code == 404
        assert resp.json == {'error':'No such user_id 2'}

    def test_get_stores(self):
        resp = self.client.post('/users', json = {'name' : 'Olha Bukina'})
        resp = self.client.post('/store', json = {'name':'Mad Cow', 'Location':'Lviv', 'manager_id': 1 })
        store_id = resp.json['stores_id']
        resp = self.client.get(f'/store/{store_id}')
        assert resp.status_code == 200
        assert resp.json == {'name':'Mad Cow', 'Location':'Lviv', 'manager_id': 1 }

    def test_get_store_id_error(self):
        resp = self.client.get(f'/store/{2}')
        assert resp.status_code == 404
        assert resp.json == {'error':'No such store_id 2'}

    def test_uppdate_store(self):
        resp = self.client.post('/users', json = {'name' : 'Olha Bukina'})   
        resp = self.client.post('/store', json = {'name':'Mad Cow', 'Location':'Lviv', 'manager_id': 1 })
        resp = self.client.put(f'/store/{1}', json = {'name':'Mad Cow', 'Location':'Kiev', 'manager_id': 1})
        assert resp.status_code == 200
        assert resp.json == {'status': 'success'}

    def test_uppdate_error_user(self):
        resp = self.client.post('/users', json = {'name' : 'Olha Bukina'})
        resp = self.client.post('/store', json = {'name':'Mad Cow', 'Location':'Lviv', 'manager_id': 1 })
        resp = self.client.put(f'/store/{1}', json = {'name':'Mad Cow', 'Location':'Kiev', 'manager_id': 3})
        assert resp.status_code == 404
        assert resp.json == {'error':'No such user_id 3'}

    def test_uppdate_error_store(self):
        resp = self.client.post('/users', json = {'name' : 'Olha Bukina'})
        resp = self.client.post('/store', json = {'name':'Mad Cow', 'Location':'Lviv', 'manager_id': 1 })
        resp = self.client.put(f'/store/{2}', json = {'name':'Mad Cow', 'Location':'Kiev', 'manager_id': 1})
        assert resp.status_code == 404
        assert resp.json == {'error':'No such store_id 2'}
