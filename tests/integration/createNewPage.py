import requests
import dotenv
import os, sys
from essential_generators import DocumentGenerator
gen = DocumentGenerator()


# Load environment variables
if os.path.isfile(".env"):
    dotenv.load_dotenv(".env")
else:
    dotenv.load_dotenv(".example.env")


# Define the endpoint
web_port = os.getenv("WEB_PORT", "8280")
endpoint = "http://localhost:{webport}/api.php".format(webport=web_port)


# Define your login parameters
login_payload = {
    "action": "login",
    "lgname": os.getenv("USER_1", "wikiuser1"),
    "lgpassword": os.getenv("DB_PASSWORD_1", "3409vnq3v2039!vpaj4"),
    "format": "json"
}

session = requests.Session()

# 'POST' request to log in
r_login = session.post(endpoint, data=login_payload)

# Get login token received from the login result
login_token = r_login.json()['login']['token']

# Define a second login payload including the login token
login_payload2 = {
    "action": "clientlogin",
    'loginreturnurl': 'http://localhost:8280/',
    "username": os.getenv("MW_ADMIN", "AdminUser"),
    "password": os.getenv("MW_PASS", 'a4320fvadf?"!'),
    "logintoken": login_token,
    "format": "json"
}

# login_payload = {
#     'action': 'clientlogin',
#     'username': 'your_username',
#     'password': 'your_password',
#     'loginreturnurl': 'http://localhost:8280/',
#     'format': 'json'
# }

# 'POST' request to confirm and log in
r_login_confirm = session.post(endpoint, data=login_payload2)

print(r_login_confirm.status_code)
print(r_login_confirm.json())

# check whether I have been successfully logged in
CHECK_LOGIN_QUERY = {
    "action": "query",
    "meta": "userinfo",
    "format": "json"
}

response = session.get(url=endpoint, params=CHECK_LOGIN_QUERY)
data = response.json()


print(data)

# Get edit token2
# params3 = 'format=json&action=query&meta=tokens&continue='

# Parameters for the GET request
params = {
    "action": "query",
    "meta": "tokens",
    "type": "csrf",
    "format": "json"
}

response3 = session.get(url=endpoint, params=params)
edit_token = response3.json()['query']['tokens']['csrftoken']

print(edit_token)
# sys.exit()

# check how many args were supplied

createOnlyLakatPage = True
title = "Lakat"
text = "Lakat is a multi-branched continuous integration framework for academic research."
summary_base = "Created new page called "
summary = summary_base + title
if len(sys.argv) >= 2:
    firstArg = sys.argv[1]
    if firstArg == "False":
        title = gen.word()
        summary = summary_base + title
        text = gen.sentence()
    elif firstArg == "True":
        title = title
    else:
        title = firstArg
        summary = summary_base + title
        text = gen.sentence()


    if len(sys.argv) >= 3:
        text = sys.argv[2]
    else:
        text = gen.sentence()

edit_payload={
        "action":"edit",
        "assert":"user",
        "format":"json",
        "text":text,
        "summary":summary,
        "title":title,
        "token":edit_token,
        "createonly": True  # This makes sure you don't overwrite an existing page
    }

r_edit=session.post(endpoint, data=edit_payload)

print(r_edit.status_code)
print(r_edit.json())

print(title)
