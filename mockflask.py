# -*- coding: utf-8 -*-
import logging
from flask import Flask, jsonify
from robot import run as robotrun
from robot.libraries.BuiltIn import BuiltIn

logger= logging.getLogger(__name__)
builtins = BuiltIn()

app = Flask(__name__)

tasks = [
    {
        'id': 1,
        'title': u'Buy groceries',
        'description': u'Milk, Cheese, Pizza, Fruit, Tylenol', 
        'done': False
    },
    {
        'id': 2,
        'title': u'Learn Python',
        'description': u'Need to find a good Python tutorial on the web', 
        'done': False
    }
]
retpass = [
    {
        'Output': "Output.xml",
        'Log': "log.html",
        'Report': "report.html"
    }
]

@app.route('/')
def index():
    return "Hello, World! server is running"

@app.route('/todo/api/v1.0/tasks', methods=['GET'])
def get_tasks():
    return jsonify({'tasks': tasks})

@app.route('/todo/api/v1.0/robot', methods=['GET'])
def run_robot():
    ret = robotrun('GoogleDemo/google_search.txt', variable=['BROWSER:Chrome'])
    if ret == 0: 
        return jsonify({'retpass': retpass})
    else:
        return jsonify({'retfaill': [{"fail": ret}]})

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)