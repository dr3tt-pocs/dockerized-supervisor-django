from datetime import datetime
from celery import shared_task


@shared_task()
def task_test():
    return f"task_test {datetime.now()}"
