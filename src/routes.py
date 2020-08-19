from src import app


@app.route('/')
def anonymous_greeting():
    return 'Welcome to WebApplication!'


@app.route('/<name>')
def personalized_greeting(name):
    return f'Welcome to WebApplication, {name}!'


# if __name__ == '__main__':
#     app.run()
