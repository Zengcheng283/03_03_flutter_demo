import flask
import random
from flask import request
from fastapi.responses import JSONResponse
from fastapi import FastAPI,Response
import yaml
from flask_cors import cross_origin
import json

app = flask.Flask(__name__)

@app.route('/') #打开服务器后看见的主页
def helloWorld():
    randomNumber = random.random() * 100
    return flask.render_template("index.html", randomNumber=randomNumber)

@app.route('/login', methods=["OPTIONS", "POST"]) #登陆，使用POST方法
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
        if i["userId"] == jsonStream["userId"]:
            success = True
            break
    if success:
        headers = {"Access-Control-Allow-Origin": "*"}
        return {"response":"success"}
    else:
        headers = {"Access-Control-Allow-Origin": "*"}
        return {"response":"failed"}

@app.route('/test', methods=["GET"]) #测试
def test():
    with open("db/user.yaml") as file:
        stream = yaml.load(file, Loader=yaml.FullLoader)
        
        str1 = "person"
        str2 = 1
        while True:
            ans = str1 + str(str2)
            if ans not in stream:
                break
            str2 += 1
        res = {ans: {"userid":"", "pwd":""}}
    return res

@app.route('/register', methods=["POST"]) #注册，使用POST方法，密码和用户名保存在db里
@cross_origin()
def register():
    str1 = "person"
    str2 = 1
    try:
        with open("db/user.yaml") as file:
            stream = yaml.load(file, Loader=yaml.FullLoader)
            insertJson = stream if stream else {}
            # print(stream)
            jsonStream = json.loads(request.data.decode())
            while True:
                insertCondition = str1 + str(str2)
                # print(insertCondition)
                if not stream:
                    break
                keysList = stream.keys()
                if insertCondition not in keysList:
                    break
                str2 += 1
        
        with open("db/user.yaml", mode="w+") as file:
            # print("write")
            stream = yaml.load(file, Loader=yaml.FullLoader)
            # print("write1")
            insertJson[insertCondition] = {"userId": jsonStream["userId"], "pwd": jsonStream["pwd"]}
            # print("write2")
            yaml.dump(insertJson, file)
            # print("write3")
            headers = {"Access-Control-Allow-Origin": "*"}
            return {"response":"success"}
    except Exception as e:
        # print(e)
        headers = {"Access-Control-Allow-Origin": "*"}
        return {"response":"failed"}
        
@app.route('/save', methods=["POST", "OPTION"]) #保存数据，使用POST方法
@cross_origin()
def saveData():
    try:
        insertJson = {}
        jsonStream = json.loads(request.data.decode())
        with open("db/data.yaml", mode="w+") as file:
            # print("write")
            stream = yaml.load(file, Loader=yaml.FullLoader)
            # print("write1")
            insertJson["times"] = jsonStream["times"]
            insertJson["gongde"] = jsonStream["gongde"]
            # print("write2")
            yaml.dump(insertJson, file)
            # print("write3")
            headers = {"Access-Control-Allow-Origin": "*"}
            return {"response":"保存成功"}
    except Exception as e:
        # print(e)
        headers = {"Access-Control-Allow-Origin": "*"}
        return {"response":"保存失败"}

@app.route('/get', methods=["GET", "OPTION"]) #获取保存的数据
@cross_origin()
def getData():
    try:
        with open("db/data.yaml") as file:
            # print("write")
            stream = yaml.load(file, Loader=yaml.FullLoader)
            return stream
    except Exception as e:
        # print(e)
        headers = {"Access-Control-Allow-Origin": "*"}
        return {"response":"failed"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=60000) #设置服务器运行地址为0.0.0.0和端口为60000