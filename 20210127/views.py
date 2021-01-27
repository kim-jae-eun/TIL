from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader


def exercise1(request):
    template = loader.get_template('exercise1.html')
    return HttpResponse(template.render(None, request))


def exercise2(request):
    if request.method == 'POST':
        name = request.POST['name']
        text = request.POST['text']
        context = {'name': name, 'text': text}
    else:
        context = None
    return render(request, 'exercise2.html', context)