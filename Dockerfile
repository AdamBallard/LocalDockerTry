FROM python:3.7-alpine

RUN pip install requests

RUN pip install pytz

COPY hello_there.py /

COPY dateConverter.py /

CMD [ "python", "hello_there.py"]

CMD [ "python", "dateConverter.py"]


