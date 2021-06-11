FROM python:3.7-alpine

COPY hello_there.py /

CMD [ "python", "-c", "print('Hi there')"]

