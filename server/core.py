import flask
import random
from flask import request
from fastapi.responses import JSONResponse
from fastapi import FastAPI,Response

app = flask.Flask(__name__)

@app.route('/')
def helloWorld():
    randomNumber = random.random() * 100
    return flask.render_template("index.html", randomNumber=randomNumber)

@app.route('/login', methods=["POST"])
def login():
    print (request.form)
    content =  [ ' content' ]
    headers = {"Access-Control-Allow-Origin": "*"}
    return JSONResponse(content=content, headers=headers)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=60000)