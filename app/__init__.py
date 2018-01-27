from flask import Flask, request
import os
import json

app = Flask(__name__)

@app.route('/', methods=['POST'])
def webhook():
	# 'message' is an object that represents a single GroupMe message.
	message = request.get_json()

	# TODO: Your bot's logic here
	print(message)

	return "ok", 200

@app.route('/hello', methods=['GET'])
def hello():

	return "<html><body>Hello</body></html>"
