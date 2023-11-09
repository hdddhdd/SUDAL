from flask import Flask
app = Flask(__name__)

@app.route("/")
# def home():
#     return "Hello, Flask!"
def home():
    return render_template('main.html')
if __name__ == "__main__":
    app.run()