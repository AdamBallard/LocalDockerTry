#!/usr/bin/env python3

import requests

x = requests.get('www.google.se')

if(x.status_code == 200):
 print('Status code is 200')
else:
 print('Status code is not 200')
