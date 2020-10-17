from django.db import models, connection
from time import sleep

class Role(models.Model):
    FirstName = models.CharField(max_length=50)
    MiddleName = models.CharField(max_length=50)
    LastName = models.CharField(max_length=50)
    CurrentRole = models.CharField(max_length=50)

    def __str__(self):
        return self.CurrentRole

    # def update():
    #     cursor = connection.cursor()

    #     url = ''
    #     while True:
    #         r = requests.get(url)
    #         for i in range(56):
    #             sleep(1)
                


    class Meta:
        verbose_name = "Роль"
        verbose_name_plural = "Роли"

class Task(models.Model):
    Title = models.CharField('Заявка', max_length=50)
    Description = models.CharField('Описание', max_length=250)
    Doer = models.ForeignKey(Role, 'on_delete=models.CASCADE') # 
    def __str__(self):
        return self.Title

    class Meta:
        verbose_name = "Заявка"
        verbose_name_plural = "Заявки"
