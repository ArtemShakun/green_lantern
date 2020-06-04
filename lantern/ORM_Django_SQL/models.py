from django.db import models


class Country(models.Model):
    name = models.CharField(unique=True, max_length=50)


class City(models.Model):
    name = models.CharField(unique=True, max_length=50)
    id_country = models.ForeignKey('RestoranCountry', models.CASCADE)

class Restoran(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    street = models.CharField(unique=True, max_length=100)
    id_city = models.ForeignKey(RestoranCity, models.CASCADE)
    id_menu = models.ForeignKey(RestoranMenu, models.CASCADE)


class Menu(models.Model):
    category = models.CharField(unique=True, max_length=50)
    dish = models.ManyToManyField('Dishes', blank=True, related_name='menu')

class Dishes(models.Model):
    name = models.CharField(unique=True, max_length=50)
    price = models.DecimalField(max_digits=9, decimal_places=2, blank=True, null=True)


class Personnel(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    phone = models.IntegerField(unique=True, blank=True, null=True)
    position = models.CharField(max_length=50, blank=True, null=True)
    id_restoran = models.ForeignKey('RestoranRestoran', models.CASCADE)
