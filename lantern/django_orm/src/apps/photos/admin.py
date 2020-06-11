from django.contrib import admin
from apps.photos.models import Photo
# Register your models here.


@admin.register(Photo)
class PhotoModelAdmin(admin.ModelAdmin):
    pass
