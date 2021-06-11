FROM python:3.7-alpine

RUN pip install requests

RUN pip install pytz

COPY hello_there.py /

COPY date_converter.py /

CMD [ "python", "hello_there.py"]

CMD [ "python", "date_converter.py"]


