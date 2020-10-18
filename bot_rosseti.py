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
import uuid
# Подключаем библиотеку для работы с базами данных PostgreSQL:
import psycopg2

##Функция генерации уникальных идентификаторов:
def newidentificator():
    return str(uuid.uuid4()) 
    
def get_type_id_from_type(type_s):
    # Проверяем является ли пользователь администратором:    
    con = psycopg2.connect(dbname='rosseti', user='alex', password='911alex', host='localhost')
    #Применение курсоров
    cur = con.cursor()
    #Установка кодировки
    cur.execute("SET NAMES 'utf8'")
    cur.execute("START TRANSACTION")
    #Выборка из БД:
    cur.execute("SELECT type_id FROM types_rosseti WHERE (type='"+type_s+"')")
    results = cur.fetchall()
    #Закрытие курсора
    cur.close()
    #Фиксация изменений
    #con.commit()
    #Закрытие соединения
    con.close()
    for row in results:
        p0 = str(row[0]).split()
        s = p0[0]
    return s

class UpdateScript:
    @cherrypy.expose
    def login(self, Name, Password):
        #print(Name)
        #a_d = newidentificator()        
        #now = datetime.now()
        type_s  = 'Электромонтер'
        type_id = get_type_id_from_type(type_s)
        
        #con = MySQLdb.connect(host="localhost", user="mr_mamoru", passwd="rsmppass", db="rsmp", charset='utf8', use_unicode = True)
        con = psycopg2.connect(dbname='rosseti', user='alex', password='911alex', host='localhost')
        #Применение курсоров
        cur = con.cursor()
        #Установка кодировки
        cur.execute("SET NAMES 'utf8'")
        cur.execute("START TRANSACTION;")
        #Заполнение данными
        #cur.execute("INSERT INTO users(surname, name, middlename, login, password, typeuser, user_id) VALUES('"+surname+"','"+name+"','"+middlename+"','"+login+"','"+passw+"','"+type_id+"','"+a_d+"')")
        cur.execute("SELECT user_id FROM users_rosseti WHERE (login='"+Name+"' AND password='"+Password+"')")
        results = cur.fetchall()        
        #Закрытие курсора
        cur.close()
        #Фиксация изменений
        con.commit()
        #Закрытие соединения
        con.close()
        s = ''
        for row in results:
            p0 = str(row[0]).split()
            s = p0[0]
        return s
    
    @cherrypy.expose
    def get_fio_from_user_id(self, user_id):
        # Проверяем является ли пользователь администратором:    
        con = psycopg2.connect(dbname='rosseti', user='alex', password='911alex', host='localhost')
        #Применение курсоров
        cur = con.cursor()
        #Установка кодировки
        cur.execute("SET NAMES 'utf8'")
        cur.execute("START TRANSACTION")
        #Выборка из БД:
        cur.execute("SELECT surname,name,middlename FROM users_rosseti WHERE (user_id='"+user_id+"')")
        results = cur.fetchall()
        #Закрытие курсора
        cur.close()
        #Фиксация изменений
        #con.commit()
        #Закрытие соединения
        con.close()
        s = ''
        for row in results:
            p0 = str(row[0]).split()
            p1 = str(row[1]).split()
            p2 = str(row[2]).split()
            s = p0[0] + ' ' + p1[0] + ' ' + p2[0]
        return s
    
    @cherrypy.expose
    def get_type_from_user_id(self, user_id):
        # Проверяем является ли пользователь администратором:    
        con = psycopg2.connect(dbname='rosseti', user='alex', password='911alex', host='localhost')
        #Применение курсоров
        cur = con.cursor()
        #Установка кодировки
        cur.execute("SET NAMES 'utf8'")
        cur.execute("START TRANSACTION")
        #Выборка из БД:
        cur.execute("SELECT type_id FROM users_rosseti WHERE (user_id='"+user_id+"')")
        results = cur.fetchall()
        for row in results:
            p0 = str(row[0]).split()
            st = ' '.join(p0)
        cur.execute("SELECT type FROM types_rosseti WHERE (type_id='"+st+"')")
        results = cur.fetchall()    
        #Закрытие курсора
        cur.close()
        #Фиксация изменений
        #con.commit()
        #Закрытие соединения
        con.close()
        s = ''
        for row in results:
            p0 = str(row[0]).split()
            s = ' '.join(p0)
        return s
        
    @cherrypy.expose
    def get_all_users_from_type(self, itype):
        # Проверяем является ли пользователь администратором:    
        con = psycopg2.connect(dbname='rosseti', user='alex', password='911alex', host='localhost')
        #Применение курсоров
        cur = con.cursor()
        #Установка кодировки
        cur.execute("SET NAMES 'utf8'")
        cur.execute("START TRANSACTION")
        #Выборка из БД:
        cur.execute("SELECT type_id FROM types_rosseti WHERE (type='"+itype+"')")
        results = cur.fetchall()
        for row in results:
            p0 = str(row[0]).split()
            type_id = ' '.join(p0)
        cur.execute("SELECT surname,name,middlename FROM users_rosseti WHERE (type_id='"+type_id+"')")
        results = cur.fetchall()    
        #Закрытие курсора
        cur.close()
        #Фиксация изменений
        #con.commit()
        #Закрытие соединения
        con.close()
        users = []
        s = ''
        for row in results:
            p0 = str(row[0]).split()
            surname = p0[0]
            p1 = str(row[1]).split()
            name = p1[0]
            p2 = str(row[2]).split()
            middlename = p2[0]
            user = {
                'surname' : surname,
                'name' : name,
                'middlename' : middlename
            }
            users.append(user)
            #print(user)
        s = json.dumps(users, ensure_ascii=False).encode('utf8')    
        return s.decode()
    
    @cherrypy.expose    
    def get_new_workorders(self, user_id):
        # Проверяем является ли пользователь администратором:    
        con = psycopg2.connect(dbname='rosseti', user='alex', password='911alex', host='localhost')
        #Применение курсоров
        cur = con.cursor()
        #Установка кодировки
        cur.execute("SET NAMES 'utf8'")
        cur.execute("START TRANSACTION")
        #Выборка из БД:
        cur.execute("SELECT workorder_id, name, workplace_id FROM work_orders WHERE (worker_id='"+user_id+"')")
        results = cur.fetchall()
        workorders = []
        for row in results:
            p0 = str(row[0]).split()
            workorder_id = ' '.join(p0)
            p0 = str(row[1]).split()
            nameworkorder = ' '.join(p0)
            p0 = str(row[2]).split()
            workplace_id = ' '.join(p0)
            cur.execute("SELECT name FROM work_places WHERE (workplace_id='"+workplace_id+"')")
            results2 = cur.fetchall()
            for row in results2:
                p0 = str(row[0]).split()
                nameworkplace = ' '.join(p0)
            workorder = {
                'workorder_id' : workorder_id,
                'nameworkorder' : nameworkorder,
                'nameworkplace' : nameworkplace
            }
            workorders.append(workorder)    
        #Закрытие курсора
        cur.close()
        #Фиксация изменений
        #con.commit()
        #Закрытие соединения
        con.close()
        s = json.dumps(workorders, ensure_ascii=False).encode('utf8')    
        return s.decode()   
        
    @cherrypy.expose    
    def get_workorder_details(self, workorder_id):
        # Проверяем является ли пользователь администратором:    
        con = psycopg2.connect(dbname='rosseti', user='alex', password='911alex', host='localhost')
        #Применение курсоров
        cur = con.cursor()
        #Установка кодировки
        cur.execute("SET NAMES 'utf8'")
        cur.execute("START TRANSACTION")
        #Выборка из БД:
        cur.execute("SELECT workevents, worker_id, workplace_id, createuser_id FROM work_orders WHERE (workorder_id='"+workorder_id+"')")
        results = cur.fetchall()
        workorders = []
        for row in results:
            p0 = str(row[0]).split()
            workevents = ' '.join(p0)
            p0 = str(row[1]).split()
            worker_id = ' '.join(p0)
            p0 = str(row[2]).split()
            workplace_id = ' '.join(p0)
            p0 = str(row[3]).split()
            createuser_id = ' '.join(p0)
            cur.execute("SELECT address FROM work_places WHERE (workplace_id='"+workplace_id+"')")
            results2 = cur.fetchall()
            for row in results2:
                p0 = str(row[0]).split()
                address = ' '.join(p0)
            cur.execute("SELECT surname,name,middlename FROM users_rosseti WHERE (user_id='"+worker_id+"')")
            results2 = cur.fetchall()
            for row in results2:
                p0 = str(row[0]).split()
                p1 = str(row[1]).split()
                p2 = str(row[2]).split()
                workerfio = p0[0]+' '+p1[0]+' '+p2[0]
            cur.execute("SELECT surname,name,middlename FROM users_rosseti WHERE (user_id='"+createuser_id+"')")
            results2 = cur.fetchall()
            for row in results2:
                p0 = str(row[0]).split()
                p1 = str(row[1]).split()
                p2 = str(row[2]).split()
                createuserfio = p0[0]+' '+p1[0]+' '+p2[0]        
            workorder = {
                'workevents' : workevents,
                'workerfio' : workerfio,
                'createuserfio' : createuserfio,
                'addressworkplace' : address
            }
            workorders.append(workorder)    
        #Закрытие курсора
        cur.close()
        #Фиксация изменений
        #con.commit()
        #Закрытие соединения
        con.close()
        s = json.dumps(workorders, ensure_ascii=False).encode('utf8')    
        return s.decode() 
           
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