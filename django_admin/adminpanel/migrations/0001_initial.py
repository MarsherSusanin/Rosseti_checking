# Generated by Django 3.1.2 on 2020-10-17 19:24

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Role',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('FirstName', models.CharField(max_length=50)),
                ('MiddleName', models.CharField(max_length=50)),
                ('LastName', models.CharField(max_length=50)),
                ('CurrentRole', models.CharField(max_length=50)),
            ],
        ),
    ]
