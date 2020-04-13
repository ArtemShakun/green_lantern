from flask import Flask
from flask import jsonify
from flask import request
import inject


class NoSuchUserError(Exception):
    def __init__(self, user_id):
        self.message = f'No such user_id {user_id}'


class NoSuchStoreError(Exception):
    def __init__(self, stores_id):
        self.message = f'No such store_id {stores_id}'


app = Flask(__name__)


@app.errorhandler(NoSuchUserError)
def my_errror_handler(e):
    return jsonify({'error': e.message}), 404


@app.errorhandler(NoSuchStoreError)
def my_errror_handler(e):
    return jsonify({'error': e.message}), 404


@app.route('/users', methods = ['POST'])
def user_create():
    db = inject.instance('DB')
    user_id = db.users.add_user(request.json)
    return jsonify({'user_id': user_id})


@app.route('/users/<int:user_id>')
def get_usere(user_id):
    db = inject.instance('DB')
    user = db.users.get_user_by_id(user_id)
    return jsonify(user)

@app.route('/users/<int:user_id>', methods = ['PUT'])
def put_usere(user_id):
    db = inject.instance('DB')
    update_user = db.users.uppdate_user_id(user_id, request.json)
    return jsonify({'status': 'success'})

@app.route('/goods', methods = ['POST'])
def goods_create():
    db = inject.instance('DB')
    goods_id = db.users_goods.add_goods(request.json)
    return jsonify({'numbers of items created': goods_id})

@app.route('/goods')
def get_goods():
    db = inject.instance('DB')
    goods = db.users_goods.get_goods(request.json)
    return jsonify(goods)

@app.route('/goods', methods = ['PUT'])
def put_goods():
    db = inject.instance('DB')
    goods = db.users_goods.update_goods(request.json)
    return jsonify({'successfully_updated': goods[0], 'error': {'no such id in goods': goods[1]}})

@app.route('/store', methods=['POST'])
def create_store():
    db = inject.instance('DB')
    user_id = user_create()
    stores_id = db.users_store.add_stores(request.json, user_id.json['user_id'])
    return jsonify({'stores_id':stores_id})

@app.route('/store/<int:store_id>')
def get_stores(store_id):
    db = inject.instance('DB')
    store = db.users_store.get_stores(store_id)
    return jsonify(store)

@app.route('/store/<int:store_id>', methods = ['PUT'])
def update_store(store_id):
    db = inject.instance('DB')
    store = db.users_store.update_store(store_id, request.json)
    return jsonify({'status': 'success'})
