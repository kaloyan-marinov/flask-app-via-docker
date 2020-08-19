from flask import Flask


app = Flask(__name__)


from src import routes  # Done intentionally, to avoid a circular dependency.
