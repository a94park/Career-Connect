from flask import Flask
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from config import Config, register_models, register_routes
from flask_jwt_extended import JWTManager

app = Flask(__name__)
CORS(app)
bcrypt = Bcrypt(app)

app.config.from_object(Config)

db = SQLAlchemy(app)
jwt = JWTManager(app)

register_routes(app)
register_models(app)

from routes import job_post_routes
from routes import job_seeker_create_profile

# Apply CORS headers to all responses
@app.after_request
def apply_cors(response):
    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Access-Control-Allow-Headers"] = "Content-Type,Authorization"
    response.headers["Access-Control-Allow-Methods"] = "GET,POST,OPTIONS,PUT,DELETE"
    return response

if __name__ == "__main__":
    app.run(debug=True)
