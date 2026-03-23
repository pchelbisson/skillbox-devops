from flask import Flask
from redis import Redis
import socket

app = Flask(__name__)
redis = Redis(host='redis', port=6379)

@app.route('/')
def hello():
    count = redis.incr('hits')
    return f'Skillbox rules. <p> Hostname is: {socket.gethostname()} <br> Number of visits: {count}'

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
