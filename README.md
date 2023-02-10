Hey everyone, this was my semester project for DCCN. For the project, I had to use shell and Python in a security-related project so heres what I came up with:

# UIT Pwned 🔒
This project replicates the functionality of [haveibeenpwned.com](https://haveibeenpwned.com) by checking if a student's roll number has been breached or not (breached in this context is having used a weak password for your UIT portal i.e 12345678 or 123456789). It uses a Flask web server to check the status of a student's roll number and tells if password was breached by [uitPortalLogin.py](uitPortalLogin.py).

# Walkthrough 🚶‍♀️
After running the local server ([main.py](main.py)), this home page is displayed. You can enter your roll number and press search to check if your account has been breached or not.

<p align="center"><img src="https://i.imgur.com/HSGPryh.png"></p> </br>

If your roll number was breached, the screen turns red and the web app displays a sad gif and your name, **which was never provided**.
<p align="center"><img src="https://i.imgur.com/5sbP5xr.png"></p> </br>

Otherwise, the screen turns green and displays a happy gif, indicating your account is secure.
<p align="center"><img src="https://i.imgur.com/BLXPuyK.png"></p> </br>

<!-- <h1 align="center">Setup</h1> -->
# Getting Started 🚀
These instructions will help you get a copy of the project and run it on your local machine for development and testing purposes.

## Prerequisites 📋
Before you get started with this project, make sure that you have the followings installed on your machine:

* Python 3: The project is written in Python 3 and requires this version to run properly. You can download the latest version from the official Python website [here](https://www.python.org/downloads/).

* pip: This is the package installer for Python. It is used to install the required libraries for this project. If you have Python 3 installed, you should have pip as well. You can check if pip is installed by running `pip -v` in your terminal/cmd.

* Shell: You will need a shell environment to run the shell scripts in this project. Most commonly used shells are Bash (MacOS, Linux), and CMD (Windows). Make sure you have one installed on your machine.

## Installing 💾

1. Download/Clone the repository to your local machine.
 `git clone https://github.com/cocomo29/UIT-Pwned.git`
2. Open terminal in the root directory of the cloned folder.
3. Run the following command to install the required libraries:
`pip install -r requirements.txt`

## Running the project 💻

1. Run the main.py file in the root directory of the folder.
2. Visit http://localhost:5000 in your web browser to access the home page of the project.
3. Enter your Roll Number and press Search.

# How it works 🤔
[main.sh](main.sh) file is run first, it checks if the `rollNumbers` directory exists or not. If not, it creates the directory structure like this:
```
- rollNumbers
    - 19b
        -cs
        -ce
        -ee
        -se
    - 20b
    - 21b
    - 21f
    - 21sp
```
every batch has the following files "cs, ce, ee, se".
After creating the directories and files, `main.sh` goes ahead and enters roll number ranging from 001 to 130 to every file, in every batch directory.
</br></br>
Next up [uitPortalLogin.py](uitPortalLogin.py) is run to extract the roll numbers from the directory structure and check if the roll number has been breached or not. If the roll number has been breached, the roll number and password are added to the [pwned.txt](pwned.txt) file along with the student's name that is scraped from the site. Otherwise, the roll number is added to the [secured.txt](secured.txt) file.
</br></br>
Then finally [main.py](main.py) is run to start the Flask web server. The web server renders the [index.html](templates/index.html) file and modifies it based on whether the entered roll number is present in [pwned.txt](pwned.txt) or not.

# Limitations ❌
Please note that due to time constraints during the project deadline, the scripts used in this project may not be fully optimized and can be improved upon in terms of code quality. Additionally, The code is only applicable for UIT students.

# Improvement 🛠️
* Instead of having a text file with passwords, you can check the login status on the go.
* You can also take in a wordlist instead of simple passwords.
* You can ask for some words from the user and make passwords out of them. by using python's itertools module.

All these changes can easily be modified but I had an assignment deadline so I leave it to you guys to experiment on.

# Warning/Attention ⚠️
The author of this script will not be responsible for any harm caused by this script. The use of this script is at your own risk. So, use it wisely.

Note: Since personal details on the UIT portal cannot be altered, this script only allows one to view attendance and sessional marks. This is the reason why the code has been freely uploaded for educational purposes, for people to learn and experiment.

</br>

If you have any queries/complaints, feel free to contact me on [discord](https://discordapp.com/users/558261366776004648/).


[![License: MIT](https://img.shields.io/badge/License-MIT-purple.svg)](https://opensource.org/licenses/MIT)
