from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello():
    return 'Hello, World!'



# Opdracht DA periode 13
# Voor periode 13 moet de student een CRUD (Create, Read, Update, Delete) applicatie bouwen. De applicatie heeft als doel om de presentie per vak, per student, die lesvolgen bij NATIN-ICT, bij te houden per periode (8 weken). De applicatie moet gebouwd worden met Python en voor de onderliggende database dient MySQL gebruikt te worden. 
# Het volgende moet mogelijk zijn binnen de applicatie:
# -	De gebruiker moet een student kunnen opzoeken, invoeren, aanpassen en verwijderen. Informatie die bijgehouden moet worden per student:
# o	Studenten Nummer
# o	Voornaam
# o	Achternaam
# o	Cohort
# o	Studierichting
# -	De gebruiker moet een vak kunnen opzoeken, invoeren, aanpassen en verwijderen. Informatie die bijgehouden moet worden per vak 
# o	vakCode
# o	VakNaam
# -	De gebruiker moet per vak de presentie van de ingevoerde studenten voor 8 weken kunnen opzoeken, invoeren, aanpassen en verwijderen.
