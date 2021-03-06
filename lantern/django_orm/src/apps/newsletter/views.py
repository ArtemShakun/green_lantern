from django.shortcuts import render
from django.views.generic.edit import FormView
from django.urls import reverse_lazy
from apps.newsletter.form import NewsLetterModelForm
# Create your views here.

class NewsLeterViews(FormView):
    template_name = 'newsletter.html'
    form_class = NewsLetterModelForm
    success_url = reverse_lazy('success')

    def form_valid(self, form):
        form.save()
        return super().form_valid(form)
