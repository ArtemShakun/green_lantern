from typing import List

import psycopg2

def task_1_add_new_record_to_db(con) -> None:
    """
    Add a record for a new customer from Singapore
    {
        'customername': 'Thomas',
        'contactname': 'David',
        'address': 'Some Address',
        'city': 'London',
        'postalcode': '774',
        'country': 'Singapore',
    }

    Args:
        con: psycopg connection

    Returns: 92 records

    """
    try:
        cur = con.cursor()
        cur.execute('''INSERT INTO customers (customername, contactname, address, city, postalcode, country)
            VALUES (%s, %s, %s, %s, %s, %s)''', ('Thomas', 'David', 'Some Address', 'London','774', 'Singapore'))
    except:
        print('Data Error')


def task_2_list_all_customers(cur) -> list:
    """
    Get all records from table Customers

    Args:
        cur: psycopg cursor

    Returns: 91 records

    """
    try:
        cur.execute("SELECT * FROM customers;")
        return cur.fetchall()
    except:
        print('Data Error')



def task_3_list_customers_in_germany(cur) -> list:
    """
    List the customers in Germany

    Args:
        cur: psycopg cursor

    Returns: 11 records
    """
    try:
        cur.execute("SELECT * FROM customers WHERE country = 'Germany';")
        return cur.fetchall()
    except:
        print('Data Error')


def task_4_update_customer(con):
    """
    Update first customer's name (Set customername equal to  'Johnny Depp')
    Args:
        cur: psycopg cursor

    Returns: 91 records with updated customer

    """
    try:
        cur = con.cursor()
        cur.execute("UPDATE customers SET customername = 'Johnny Depp' WHERE customerid= 1;")
    except:
        print('Data Error')


def task_5_delete_the_last_customer(con) -> None:
    """
    Delete the last customer

    Args:
        con: psycopg connection
    """
    try:
        cur = con.cursor()
        cur.execute('DELETE FROM customers WHERE customerid = (SELECT customerid FROM customers ORDER BY customerid DESC LIMIT 1)');
    except:
        print('DataError')

def task_6_list_all_supplier_countries(cur) -> list:
    """
    List all supplier countries

    Args:
        cur: psycopg cursor

    Returns: 29 records

    """
    query_all = []
    try:
        cur.execute("SELECT country FROM suppliers;")
        cur.fetchall()
        for i in cur:
            query_all.append(i)
        return query_all
    except:
        print('DataError')

def task_7_list_supplier_countries_in_desc_order(cur) -> list:
    """
    List all supplier countries in descending order

    Args:
        cur: psycopg cursor

    Returns: 29 records in descending order

    """
    query_all = []
    try:
        cur.execute("SELECT country FROM suppliers ORDER BY country DESC;")
        cur.fetchall()
        for i in cur:
            query_all.append(i)
        return query_all
    except:
        print('DataError')


def task_8_count_customers_by_city(cur):
    """
    List the number of customers in each city

    Args:
        cur: psycopg cursor

    Returns: 69 records in descending order

    """
    query_all = []
    try:
        cur.execute("SELECT city, count(city) from customers GROUP BY city ORDER BY COUNT(city) DESC;")
        cur.fetchall()
        for i in cur:
            query_all.append(i)
        return query_all
    except:
        print('DataError')

def task_9_count_customers_by_country_with_than_10_customers(cur):
    """
    List the number of customers in each country. Only include countries with more than 10 customers.

    Args:
        cur: psycopg cursor

    Returns: 3 records
    """
    try:
        cur.execute("SELECT COUNT (city) FROM customers GROUP BY city HAVING COUNT(city)>10;")
        return cur.fetchall()
    except:
        print('DataError')

def task_10_list_first_10_customers(cur):
    """
    List first 10 customers from the table

    Results: 10 records
    """
    try:
        cur.execute("SELECT * FROM customers WHERE customerid<10;")
        return cur.fetchall()
    except:
        print('DataError')

def task_11_list_customers_starting_from_11th(cur):
    """
    List all customers starting from 11th record

    Args:
        cur: psycopg cursor

    Returns: 11 records
    """
    try:
        cur.execute("SELECT * FROM customers WHERE customerid>11;")
        return cur.fetchall()
    except:
        print('DataError')


def task_12_list_suppliers_from_specified_countries(cur):
    """
    List all suppliers from the USA, UK, OR Japan

    Args:
        cur: psycopg cursor

    Returns: 8 records
    """
    try:
        cur.execute("SELECT * FROM suppliers WHERE country = 'USA' AND country = 'UK' AND country = 'Japan';")
        return cur.fetchall()
    except:
        print('DataError')

def task_13_list_products_from_sweden_suppliers(cur):
    """
    List products with suppliers from Sweden.

    Args:
        cur: psycopg cursor

    Returns: 3 records
    """
    try:
        cur.execute('''
            SELECT products.productname FROM products
            INNER JOIN suppliers ON products.supplierid = suppliers.supplierid
            WHERE suppliers.country='Sweden';
        ''')
        return cur.fetchall()
    except:
        print('DataError')


def task_14_list_products_with_supplier_information(cur):
    """
    List all products with supplier information

    Args:
        cur: psycopg cursor

    Returns: 77 records
    """
    try:
        query_all = []
        cur.execute('''
            SELECT products.productid, products.productname, products.unit, products.price, suppliers.country, suppliers.city, suppliers.suppliername
            FROM products
            INNER JOIN suppliers ON products.supplierid = suppliers.supplierid;
            ''')
        cur.fetchall()
        for i in cur:
            query_all.append(i)
        return query_all
    except:
        print('DataError')



def task_15_list_customers_with_any_order_or_not(cur):
    """
    List all customers, whether they placed any order or not.

    Args:
        cur: psycopg cursor

    Returns: 213 records
    """

    try:
        query_all = []
        cur.execute('''
            SELECT customername, contactname, country, orders.orderid
            FROM customers
            LEFT OUTER JOIN orders ON orders.customerid = customers.customerid;
            ''')
        cur.fetchall()
        for i in cur:
            query_all.append(i)
        return query_all
    except:
        print('DataError')



def task_16_match_all_customers_and_suppliers_by_country(cur):
    """
    Match all customers and suppliers by country

    Args:
        cur: psycopg cursor

    Returns: 194 records
    """
    try:
        query_all = []
        cur.execute('''
            SELECT customers.customername, customers.address AS address, customers.country AS customercountry, suppliers.country AS suppliercountry, suppliers.suppliername
            FROM customers
            FULL OUTER JOIN suppliers ON suppliers.country = customers.country;
            ''')
        cur.fetchall()
        for i in cur:
            query_all.append(i)
        return query_all
    except:
        print('DataError')
