FROM python:3.7-alpine

RUN pip install requests

COPY hello_there.py /

CMD [ "python", "hello_there.py"]

RUN pip install pytz

COPY date_converter.py /

CMD [ "python", "date_converter.py"]


