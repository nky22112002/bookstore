from flask import Flask, jsonify, request, url_for, redirect
from datetime import datetime
from flask_cors import CORS
import mysql.connector
import logging
import sys

connection = mysql.connector.connect(host='localhost',port='3306',
                                     database='quanlynhasach', user='root')

app = Flask(__name__)
CORS(app)
sys.stdout.reconfigure(encoding='utf-8')

logging.basicConfig(filename='flask_logs.txt', level=logging.DEBUG)

cursor = connection.cursor()

@app.route('/admin')
def index():
    # Xử lý nội dung trang chủ nếu cần
    return 'Welcome to the admin page!'

@app.route('/insert-book', methods=['GET', 'POST'])
def get_date():
    current_date = datetime.now().strftime("%Y-%m-%d")
    print(f"Sending books: {current_date}")

    return jsonify({"date":current_date})

def get_categories():
    try:
        query_get_category = 'select * from category'
        cursor.execute(query_get_category)
        return cursor.fetchall()

    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        return jsonify({'error': 'Internal Server Error'}), 500

@app.route('/invoice', methods=['GET', 'POST'])
def get_books():
    try:
        query_get_book = 'SELECT `id`, `name` FROM `book`'
        cursor.execute(query_get_book)
        rows = cursor.fetchall()
        categories_name = get_categories()
        data = {
            'books': [{'id': row[0], 'name': row[1], } for row in rows],
            'category': [{'id': row[0],'name': row[1]} for row in categories_name],
        }

        return jsonify(data)

    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        return jsonify({'error': 'Internal Server Error'}), 500


@app.route('/submit-books', methods=['POST'])
def submit_data_books():
        try:
            data_from_frontend = request.json.get('data')
            for row in data_from_frontend:
                name = row.get('name')
                category = row.get('category')
                author = row.get('author')
                quantity = row.get('quantity')

                # Thực hiện câu truy vấn INSERT
                query = "INSERT INTO book(name, category_id , author, quantity) VALUES (%s, %s, %s, %s)"
                values = (name, category, author, quantity)
                cursor.execute(query, values)
            
            # Lưu thay đổi vào cơ sở dữ liệu
            connection.commit()

            # Trả về phản hồi nếu cần
            return jsonify("Data inserted!!!")
        except Exception as e:
            print('Error processing data:', str(e))
            # Rollback nếu có lỗi xảy ra
            connection.rollback()
            return jsonify({'error': 'Error processing data'}), 500

def get_id_bill():
    query = 'SELECT MAX(CAST(id AS SIGNED)) AS latest_id FROM bill;'
    cursor.execute(query)
    result = cursor.fetchone()
    if result:
        id_bill = result[0]
        return id_bill
    else:
        return None

@app.route('/submit-invoice', methods=['POST'])
def submit_data_invoice():
    try:
        data = request.json.get('data')
        print(data)
        employee = request.json.get('employeeName')
        customer = request.json.get('customerName')
        
        query_insert_bill = 'INSERT INTO `bill`(`emp_name`, `customer_name`) VALUES (%s, %s)'
        values = (employee, customer)
        cursor.execute(query_insert_bill, values)
        connection.commit()
        id_bill = get_id_bill()
        for row in data:
            id_book = row.get('name')
            quantity = row.get('quantity')
            price = row.get('price')

            query_insert_bill_info = "INSERT INTO bill_info(id_book, id_bill, quantity, price) VALUES (%s, %s, %s, %s)"
            values = (id_book, id_bill, quantity, price)
            cursor.execute(query_insert_bill_info, values)
            
            # Lưu thay đổi vào cơ sở dữ liệu
        connection.commit()
            # Trả về phản hồi nếu cần
        return jsonify("Data inserted!!!")
    except Exception as e:
        print('Error processing data:', str(e))
            # Rollback nếu có lỗi xảy ra
        connection.rollback()
        return jsonify({'error': 'Error processing data'}), 500
        
@app.route('/get_category', methods=['GET', 'POST'])
def get_category_name():
    try:        
        
        query_get_category_name = 'select `id`,`category_name` from `category`'
        cursor.execute(query_get_category_name)
        rows_category = cursor.fetchall()
        value = 1
        data = {
            'category': [{'id': row[0], 'name': row[1]} for row in rows_category],
            }
        return jsonify(data)
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        return jsonify({'error': 'Internal Server Error'}), 500

@app.route('/get_revenue', methods=['POST', 'GET'])
def get_revenue():
    try:  
        category_id = request.json.get('category_id')
        value = [category_id]
        print('value:',value)
        query_get_revenue = 'call GetMonthlyStatistics(%s)'
        cursor.execute(query_get_revenue, value)
        rows = cursor.fetchall()
        data = {
            'labels': [{'month': row[0]} for row in rows],
            'values': [{'id': row[0], 'revenue': row[1], 'quantity': row[2]} for row in rows]
        }
        return jsonify(data)
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        return jsonify({'error': 'Internal Server Error'}), 500
    


if __name__ == '__main__':
    app.run(debug=True)
