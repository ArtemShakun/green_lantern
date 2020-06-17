from django.contrib.auth import get_user_model
from django.test import TestCase, Client
from django.urls import reverse

from .models import Article

class ArticleTest(TestCase):
    def setUp(self):
        self.user = get_user_model().objects.create_user(
        username='testuser',
        email='test@gmail.com',
        password='secret12345'
        )

        self.article = Article.objects.create(
            id = 1,
            title = 'New Test Article',
            body = 'Test text in my post',
            author=self.user,
        )
        self.client = Client()


    def test_absolute_url(self):
        self.assertEqual(self.article.get_absolute_url(), '/articles/1/')

    def test_article_content(self):
        self.assertEqual(f'{self.article.title}', 'New Test Article')
        self.assertEqual(f'{self.article.author}', 'testuser')
        self.assertEqual(f'{self.article.body}', 'Test text in my post')
        self.assertEqual(f'{self.article.id}', '1')

    def test_article_list_view(self):
        response = self.client.get(reverse('articles:list_detail'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Test text in my post')
        self.assertTemplateUsed(response, 'article_list_detail.html')


    def test_article_create_view(self):
        response = self.client.post(reverse('articles:create-article'), {
            'title': 'Two Test post',
            'body': 'Hello world',
            'author':self.user,
        })
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Two Test post')
        self.assertContains(response, 'Hello world')


    def test_article_detail_view(self):
        response = self.client.get('/articles/1/')

        no_response = self.client.get('/articles/100/')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(no_response.status_code, 404)
        self.assertTemplateUsed(response, 'article_detail.html')


    def test_post_update_view(self):
        response = self.client.post(reverse('articles:post_update', args='1'), {
            'title': 'Updated title',
            'body': 'Updated text',
        })
        self.assertEqual(response.status_code, 302)


    def test_artigle_delete_view(self):
        response = self.client.post(reverse('articles:delete-article', args='1'))
        self.assertEqual(response.status_code, 302)
