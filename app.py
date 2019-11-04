from flask import Flask, render_template, request, url_for, redirect
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'presentie_app'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)

@app.route("/", methods=['POST', 'GET'])

def index():
    cur = mysql.connection.cursor()
       
    if request.method == 'POST':
        pass
    else:
        return render_template("index.html")

if __name__ == "__main__":
    app.run(debug=True)