from datetime import datetime
from django.http import HttpResponse

from core.tasks import task_test


def index(request):
    task_test.delay()
    now = datetime.now()
    html = f"<html><body>Right here, right now: {now}.</body></html>"
    return HttpResponse(html)
