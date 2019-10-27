from flask import Flask, render_template, request, url_for, redirect
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'presentie_app'

mysql = MySQL(app)


@app.route("/", methods=['GET', 'POST'])
def index():
    return render_template("index.html")
if __name__ == "__main__":
    app.run(debug=True)

        CREATE TABLE 'presentie' (
    'id' int NOT NULL AUTOINCREMENT,
    'studentid' int NOT NULL,
    'vakid' int NOT NULL,
    'datum' date NOT NULL,
    'periode' int NOT NULL
    );


# ALTER TABLE 'presentie'
#   ADD CONSTRAINT FOREIGN KEY (`klant_id`) REFERENCES `klant` (`klant_id`),
#   ADD CONSTRAINT FOREIGN KEY (`freelancer_id`) REFERENCES `freelancers` (`freelancer_id`),