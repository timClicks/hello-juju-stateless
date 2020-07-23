from flask import Flask

app = Flask("hello-juju")


@app.route("/")
def hello():
    return "Hello, Juju"
