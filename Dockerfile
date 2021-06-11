FROM python:3.6.8-alpine3.8

COPY hello_there.py /

CMD [ "python", "hello_there.py"]

