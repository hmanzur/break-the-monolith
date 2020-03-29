import json
import socket


from flask import Flask, request, Response

app = Flask(__name__)

@app.route("/hello")
def hello():
    return "Hello! I am the container: {}\n".format(socket.gethostname())

@app.route("/user")
def user():
    return "Hello User! You are in the container: {}\n".format(socket.gethostname())

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=5050)
