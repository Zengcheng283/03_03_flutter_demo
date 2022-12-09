import flask
import random
from flask import request
from fastapi.responses import JSONResponse
from fastapi import FastAPI,Response
import yaml
from flask_cors import cross_origin
import json

app = flask.Flask(__name__)

@app.route('/')
def helloWorld():
    randomNumber = random.random() * 100
    return flask.render_template("index.html", randomNumber=randomNumber)

@app.route('/login', methods=["OPTIONS", "POST"])
@cross_origin()
def login():
    success = False
    with open("db/user.yaml") as file:
        stream = yaml.load(file, Loader=yaml.FullLoader)
        # print(stream)
    jsonStream = json.loads(request.data.decode())
    # int(request.data.decode()["userId"])
    # int(i["userId"])
    for i in stream.values():
        if int(i["userId"]) == int(jsonStream["userId"]):
            success = True
            break
    if success:
        headers = {"Access-Control-Allow-Origin": "*"}
        return {"response":"success"}
    else:
        headers = {"Access-Control-Allow-Origin": "*"}
        return {"response":"failed"}

@app.route('/test', methods=["GET"])
def test():
    with open("db/user.yaml") as file:

        stream = yaml.load(file, Loader=yaml.FullLoader)
        res = {}
        for i in stream.values():
            for k, v in i.items():
                res[k] = v
    return res

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=60000)