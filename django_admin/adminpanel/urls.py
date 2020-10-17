from django.conf.urls import url
from django.urls import path, include

app_name = 'adminpanel'

urlpatterns = [
    path('', admin.site.urls),
]