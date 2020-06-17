from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.urls import reverse, reverse_lazy
from django.shortcuts import render, get_object_or_404
# Create your views here.
from django.views import View
from django.views.generic import (
            ListView,
            DetailView,
            CreateView,
            UpdateView,
            DeleteView,
)

from apps.articles.models import Article


class ArticleListView(ListView):
    model = Article
    template_name = 'article_list_detail.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['article-list'] = Article.objects.all()
        return context


class ArticleDetailView(DetailView):
    model = Article
    template_name = 'article_detail.html'
    pk_url_kwarg = 'id'


class ArticleCreateView(CreateView):
    model = Article
    template_name = 'article_create.html'
    fields = ['title', 'body', 'tags', 'author', 'image']


class ArticleUpdateView(UpdateView):
    model = Article
    template_name = 'article_update.html'
    fields = ['title', 'body']
    pk_url_kwarg = 'id'


class ArticleDeleteView(DeleteView):
    model = Article
    template_name = 'article_delete.html'
    pk_url_kwarg = 'id'
    success_url = reverse_lazy('articles:list_detail')
