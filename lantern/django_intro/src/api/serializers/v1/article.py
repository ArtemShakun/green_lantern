from rest_framework import serializers

from apps.articles.models import Article


class ArticleModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = ['title', 'body', 'author']
