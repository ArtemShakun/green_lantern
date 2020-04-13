from itertools import count
from app import NoSuchUserError, NoSuchStoreError


class FakeStorage:
    def __init__(self):
        self._users = FakeUsers()
        self._users_goods = FakeGoods()
        self._users_store = FakeStore()

    @property
    def users(self):
        return self._users

    @property
    def users_goods(self):
        return self._users_goods

    @property
    def users_store(self):
        return self._users_store

class FakeUsers:
    def __init__(self):
        self._users = {}
        self._id_user = count(1)

    def add_user(self, user):
        self.user_id = next(self._id_user)
        self._users[self.user_id] = user
        return self.user_id

    def get_user_by_id(self, user_id):
        try:
            return self._users[user_id]
        except KeyError:
            raise NoSuchUserError(user_id)

    def uppdate_user_id(self, user_id, user):
        if user_id in self._users:
            self._users[user_id] = user
        else:
            raise NoSuchUserError(user_id)


class FakeGoods:
    def __init__(self):
        self.users_goods = {}

    def add_goods(self, user):
        self.users_goods = user
        summa = []
        for i in self.users_goods:
            summa.append(i['id'])
        return len(summa)

    def get_goods(self, goods_id):
        id = goods_id['id']
        summa = []
        for i in self.users_goods:
            if id == i.get('id'):
                return i

    def update_goods(self, goods):
        no_such_id = []
        successfully_updated = []
        id = []
        for i in self.users_goods:
            id.append(i['id'])
        for good in goods:
            if good['id'] in id:
                successfully_updated.append(good.get('id'))
            else:
                no_such_id.append(good.get('id'))
        return len(successfully_updated), no_such_id



class FakeStore(FakeUsers):
    def __init__(self):
        self._users_store = {}
        self._id_store = count(1)

    def add_stores(self, store, id_user):
        store_id = next(self._id_store)
        self.user_id = id_user
        if self.user_id > store['manager_id']:
            self._users_store[store_id] = store
            return store_id
        else:
            raise NoSuchUserError(store['manager_id'])

    def get_stores(self, store_id ):
        if store_id in self._users_store:
            return self._users_store[store_id]
        else:
            raise NoSuchStoreError(store_id)

    def update_store(self, store_id, store):
        if self.user_id < store['manager_id']:
            raise NoSuchUserError(store['manager_id'])
        elif store_id not in self._users_store:
            raise NoSuchStoreError(store_id)
        else:
            self._users_store[store_id] = store
            return self._users_store
