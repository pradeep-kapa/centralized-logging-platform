from flask import Flask, jsonify
import json
import logging
import os
import random
import sys
import time

app = Flask(__name__)
handler = logging.StreamHandler(sys.stdout)
handler.setFormatter(logging.Formatter('%(message)s'))
app.logger.handlers = [handler]
app.logger.setLevel(logging.INFO)

@app.route('/')
def home():
    payload = {
        "service": "sample-service",
        "level": "INFO",
        "message": "request processed",
        "path": "/",
        "latency_ms": random.randint(5, 250),
        "env": os.getenv("APP_ENV", "dev"),
        "timestamp": int(time.time())
    }
    app.logger.info(json.dumps(payload))
    return jsonify({"status": "ok", "service": "sample-service"})

@app.route('/health')
def health():
    return jsonify({"status": "healthy"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
