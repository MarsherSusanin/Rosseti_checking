#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import logging
# Подключаем библиотеки с функциями обработки запросов:
import urllib.request as r
import json
import time
import datetime
# Подкл.чаем библиотеку для работы с сервером CherryPy:
import cherrypy
# Подключаем библиотеку с функциями работы с ботами:
import requests

from http.client import HTTPConnection 

class UpdateScript:
    @cherrypy.expose
    def login(self, Name, Password):
        print(Name)
        return 'ok'
   
if __name__ == '__main__':
    s = "https://ipecho.net/plain"
    response = r.urlopen(s);
    html = response.read().decode("utf-8") # utf-8 чтобы принять русские буквы
    print(html)
    
    # Основные настройки сервера CherryPy: 
    WEBHOOK_HOST = html; 
    WEBHOOK_PORT = 80;  
    WEBHOOK_LISTEN = '0.0.0.0'      
    cherrypy.config.update({
        'server.socket_host': WEBHOOK_LISTEN,
        'server.socket_port': WEBHOOK_PORT,
        'engine.autoreload.on': True
    })
    cherrypy.quickstart(UpdateScript(), '/', {'/': {}})