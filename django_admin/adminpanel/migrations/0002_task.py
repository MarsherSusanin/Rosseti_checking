# Generated by Django 3.1.2 on 2020-10-17 20:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('adminpanel', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Task',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Title', models.CharField(max_length=50, verbose_name='Заявка')),
                ('Description', models.CharField(max_length=250, verbose_name='Описание')),
                ('Doer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='adminpanel.role')),
            ],
        ),
    ]
