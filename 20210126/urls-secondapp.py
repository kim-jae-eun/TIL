from django.urls import path
from . import views
urlpatterns = [
    path('', views.exam1, name='exam1'),
    path('exam2/', views.exam2, name='exam2'),
]