import json
import requests
from bottle import Bottle, route, template, run, static_file, request, response
from bottle.ext import auth

@app.route('/login')
def login(auth):
    return auth.redirect(request.environ)

@login(auth)
@route('/create_ticket', method=['GET', 'POST'])
def handle_form():
    if 'verified_email' in request.cookies:
        ask_email = False
    else:
        ask_email = True
    status = ''
    if request.POST:
        # Get the form data
        subject = request.forms.get('subject')
        description = request.forms.get('description')
        country = request.forms.get('country')
        category = request.forms.get('category')
        if 'verified_email' in request.cookies:
            email = request.get_cookie('verified_email')
        else:
            email = request.forms.get('email')
                    
            
        # Package the data for the API
        data = {'request': {'subject': subject, 'comment': {'body': description},'custom_fields': [{'id': 360004554977, 'value': category},{'id': 360026187078, 'value':country}]}}
            
        ticket = json.dumps(data)
        # Make the API request
        user = email + '/token'
            
        api_token = 'mUdV0u17U5YaQ5kS09feZiUm9YyNGM3SKnf4mpSp'
        url = 'https://oneacrefundglobalhr.zendesk.com/api/v2/requests.json'
        headers = {'content-type': 'application/json'}
        r = requests.post(url, data=ticket, auth=(user, api_token), headers=headers)
            
        if r.status_code != 201:
            if r.status_code == 401 or 422:
                status = 'Could not authenticate you. Check your email address or register.'
                ask_email = True
            else:
                status = 'Problem with the request. Status ' + str(r.status_code)
        else:
                
            status = 'Ticket was created. Look for an email notification.'
                
            if 'verified_email' not in request.cookies:
                response.set_cookie('verified_email', email, max_age=364*24*3600)
                ask_email = False

    return template('ticket_form', feedback=status, no_email=ask_email)

@route('/css/<filename>')
def send_css(filename):
    return static_file(filename, root='static/css')

app = Bottle()

## add auth plugin for openid here

run(app=app, host='0.0.0.0',  debug=True, reloader=True)



