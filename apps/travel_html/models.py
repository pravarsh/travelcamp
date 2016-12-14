from __future__ import unicode_literals

from django.db import models

class User(models.Model):
    name = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class Trip(models.Model):
    start = models.CharField(max_length=255)
    destination = models.CharField(max_length=255)
    description = models.TextField()
    date = models.DateField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    User = models.ForeignKey('User', related_name = 'owner')
    Guest = models.ManyToManyField('User', related_name='guest')
