from django.urls import path, include

from api.views.articles import ArticleApiDetailView, ArtickeApiList

app_name = 'api'

urlpatterns = [
    path('articles/', ArtickeApiList.as_view()),
    path('articles/<int:pk>/', ArticleApiDetailView.as_view()),
    
]
