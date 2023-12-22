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
code = 'select * from `quanlynhasach`.`book`;'
sys.stdout.reconfigure(encoding='utf-8')

logging.basicConfig(filename='flask_logs.txt', level=logging.DEBUG)

cursor = connection.cursor()

@app.route('/')
def index():
    # Xử lý nội dung trang chủ nếu cần
    return 'Welcome to the home page!'

@app.route('/insert-book', methods=['GET', 'POST'])
def get_date():
    current_date = datetime.now().strftime("%Y-%m-%d")
    print(f"Sending books: {current_date}")

    return jsonify({"date":current_date})

@app.route('/invoice', methods=['GET', 'POST'])
def get_category():
    try:
        query_get_category = 'SELECT `id`, `name` FROM `book`'
        cursor.execute(query_get_category)
        rows = cursor.fetchall()

        data = {
            'books': [{'id': row[0], 'name': row[1]} for row in rows]
        }

        return jsonify(data)

    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        return jsonify({'error': 'Internal Server Error'}), 500


@app.route('/submit', methods=['POST'])
def submit_data():
        try:
            data_from_frontend = request.json.get('data')
            
            for row in data_from_frontend:
                name = row.get('name')
                category = row.get('category')
                author = row.get('author')
                quantity = row.get('quantity')

                # Thực hiện câu truy vấn INSERT
                query = "INSERT INTO book(name, category, author, quantity) VALUES (%s, %s, %s, %s)"
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
        


if __name__ == '__main__':
    app.run(debug=True)
