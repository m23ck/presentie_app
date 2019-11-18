from flask import Flask, render_template, request, url_for, redirect
from flask_mysqldb import MySQLdb
from flask_mysqldb import MySQL
import pandas as DataFrame
import pdfkit

app = Flask(__name__)


app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'presentie_app'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)


# code



# ROUTES

@app.route("/", methods=['GET', 'POST'])
def home():
    cur = mysql.connection.cursor()
    resultValue = cur.execute("SELECT presentie.status, presentie.datum, vak.vaknaam, vak.vakcode, student.studentcode, student.voornaam, student.achternaam, student.studierichting FROM presentie INNER JOIN vak ON presentie.vakid = vak.id INNER JOIN student ON presentie.studentid = student.id")
    if resultValue > 0:
        presentie = cur.fetchall() 
    return render_template("index.html", presentie=presentie, title='presentie')


@app.route("/new_presentie", methods=["POST"])
def new_presentie():
    studentcode = request.form['studentcode']
    vakcode = request.form['vakcode']
    datum = request.form['datum']
    periode = request.form['periode']
    status = request.form['status']
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO presentie ( studentcode, vakcode, status, datum) VALUES (%s, %s, %s, %s)",(studentcode, vakcode, status, datumg))
    mysql.connection.commit()
    return redirect("/")


@app.route("/verwijder_presentie/<string:id>", methods=["GET"])
def verwijder_presentie(id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM presentie WHERE id=%s", ([id]))
    mysql.connection.commit()
    return redirect("/")

 
@app.route("/student", methods=['GET', 'POST'])
def student():
    cur = mysql.connection.cursor()
    resultValue = cur.execute("SELECT * FROM student")
    if resultValue > 0:
        student = cur.fetchall() 
    return render_template("student.html", student=student, title='student')



@app.route("/new_student", methods=["POST"])
def new_student():
    studentnummer = request.form['studentnummer']
    studentcode = request.form['studentcode']
    voornaam = request.form['voornaam']
    achternaam = request.form['achternaam']
    cohort = request.form['cohort']
    studierichting = request.form['studierichting']
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO student ( studentnummer, studentcode, voornaam, achternaam, cohort, studierichting) VALUES (%s, %s, %s, %s, %s, %s)",(studentnummer, studentcode, voornaam, achternaam, cohort, studierichting))
    mysql.connection.commit()
    return redirect(url_for('student'))


@app.route("/verwijder_student/<string:studentcode>", methods=["GET"])
def verwijder_student(studentcode):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM student WHERE studentcode=%s", ([studentcode]))
    mysql.connection.commit()
    return redirect(url_for('student'))


# @app.route("/export_student", methods=['GET', 'POST'])
# def export_student():
#     cur = mysql.connection.cursor()
#     resultValue = cur.execute("SELECT studentnummer, achternaam, voornaam, cohort FROM student")
#     if resultValue > 0:
#         export_student = cur.fetchall() 
#     data = DataFrame(export_student)
#     data.to_csv('student.csv', index = False)
    



@app.route("/vak", methods=['GET', 'POST'])
def vak():
    cur = mysql.connection.cursor()
    resultValue = cur.execute("SELECT * FROM vak")
    if resultValue > 0:
        vak = cur.fetchall() 
    return render_template("vak.html", vak=vak, title='vak')


@app.route("/new_vak", methods=["POST"])
def new_vak():
    vaknaam = request.form['vaknaam']
    vakcode = request.form['vakcode']
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO vak (vaknaam, vakcode) VALUES (%s, %s)",(vaknaam, vakcode,))
    mysql.connection.commit()
    return redirect(url_for('vak'))


@app.route("/verwijder_vak/<string:vakcode>", methods=["GET"])
def verwijder_vak(vakcode):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM vak WHERE vakcode=%s", ([vakcode]))
    mysql.connection.commit()
    return redirect(url_for('vak'))



@app.route('/export_pdf')
def export_pdf():
    cur = mysql.connection.cursor()
    resultValue = cur.execute("SELECT * FROM presentie")
    if resultValue > 0:
        presentie = cur.fetchall() 
    rendered = render_template('export_pdf.html', presentie=presentie)
    pdf = pdfkit.from_tostring(rendered, False)
    response = make_response(pdf)
    response.headers['Content-Type'] = 'application/pdf'
    response.headers['Content-Disposition'] = 'inline; filename= output.pdf'
    return response

if __name__ == "__main__":
    app.run(debug=True)



