from flask import Flask, jsonify, request
import mysql.connector
from flask_cors import CORS

app = Flask(__name__)
CORS(app) # Enables React to talk to Python

# Database Connection Configuration
db_config = {
    'user': 'root',
    'password': '', # XAMPP default is empty
    'host': 'localhost',
    'database': 'dashboard_db'
}

# Helper function to get DB connection
def get_db_connection():
    return mysql.connector.connect(**db_config)

# --- Routes ---

#  VIEW: Get all records
@app.route('/api/records', methods=['GET'])
def get_records():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM records ORDER BY id ASC")
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(results)

#  INPUT: Add a new record
@app.route('/api/records', methods=['POST'])
def add_record():
    data = request.json
    conn = get_db_connection()
    cursor = conn.cursor()
    
    query = "INSERT INTO records (name, email, role) VALUES (%s, %s, %s)"
    values = (data['name'], data['email'], data['role'])
    
    cursor.execute(query, values)
    conn.commit()
    
    new_id = cursor.lastrowid
    cursor.close()
    conn.close()
    
    return jsonify({'message': 'Consolidated successfully', 'id': new_id}), 201

#  UPDATE: Modify an existing record
@app.route('/api/records/<int:id>', methods=['PUT'])
def update_record(id):
    data = request.json
    conn = get_db_connection()
    cursor = conn.cursor()
    
    query = "UPDATE records SET name = %s, email = %s, role = %s WHERE id = %s"
    values = (data['name'], data['email'], data['role'], id)
    
    cursor.execute(query, values)
    conn.commit()
    cursor.close()
    conn.close()
    
    return jsonify({'message': 'Record updated successfully'})

#  DELETE: Remove a record
@app.route('/api/records/<int:id>', methods=['DELETE'])
def delete_record(id):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    cursor.execute("DELETE FROM records WHERE id = %s", (id,))
    conn.commit()
    cursor.close()
    conn.close()
    
    return jsonify({'message': 'Record deleted successfully'})

if __name__ == '__main__':
    app.run(debug=True, port=5000)