from django.http import HttpResponse
from django.template import loader


def exam1(request):
    template = loader.get_template('exam1.html')
    return HttpResponse(template.render(None, request))


def exam2(request):
    template = loader.get_template('exam2.html')
    if request.method == 'GET':
        msg = "GET 방식으로 했군요 ㅎ"
    else:
        msg = "POST 방식으로 했군요 ㅎ"
    context = {'result': msg}
    return HttpResponse(template.render(context, request))
