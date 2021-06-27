import flask
from flask import Flask,jsonify,request
#import pickle
import pickle5 as pickle
import pandas as pd
import numpy as np
import sklearn
fname = 'model.pickle'
file = open(fname, 'rb')
model = pickle.load(file)
file.close()

fname = 'encoder.pickle'
file = open(fname, 'rb')
enc = pickle.load(file)
file.close()

app = flask.Flask(__name__)


@app.route("/", methods=["GET","POST"])
def index():
    data = request.json
    d=np.array(list(data.values()))
    d.reshape(1,-1)
    res = model.predict(enc.transform([d]))
    print(res)
    return jsonify(str(res[0]))

if __name__ == "__main__":
    app.run(debug = True)
