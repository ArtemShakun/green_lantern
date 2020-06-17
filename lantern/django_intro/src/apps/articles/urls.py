from django.urls import path
from django.views.generic import TemplateView
from apps.articles.models import Article

from apps.articles.views import (
        ArticleDetailView,
        ArticleCreateView,
        ArticleListView,
        ArticleUpdateView,
        ArticleDeleteView
)

app_name = 'articles'

urlpatterns = [
    path('<int:id>/delete', ArticleDeleteView.as_view(), name='delete-article'),
    path('<int:id>/edit/', ArticleUpdateView.as_view(), name='post_update'),
    path('create_article/', ArticleCreateView.as_view(model=Article), name='create-article'),
    path('<int:id>/', ArticleDetailView.as_view(), name='post_detail'),
    path('', ArticleListView.as_view(), name='list_detail'),


]
