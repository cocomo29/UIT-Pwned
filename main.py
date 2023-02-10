from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)
data = open("pwned.txt", 'r').readlines()


@app.route('/')
def index():
    return render_template("index.html")

@app.route('/search', methods=['POST','GET'])
def search():
    if request.method == 'POST':
        search = request.form['search']
        if search=='': return render_template("index.html", search='Please Enter a roll number',color='none')
        for i in data:
            if search.lower() == i.strip().split(",")[0].lower():
                print(i.strip().split(",")[0].lower())
                return render_template("index.html", search=f'You have been pwned, {i.strip().split(",")[1]}',color='red', peppo='sad')
    
    return render_template("index.html", search='Your accound is secure!',color='green', peppo='happy')
    
if __name__ == "__main__":
    app.run(debug=True)
