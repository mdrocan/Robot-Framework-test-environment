FROM  python:alpine3.8

COPY requirements.txt /tmp/requirements.txt
RUN  pip install -r /tmp/requirements.txt

COPY tests /tmp/tests

WORKDIR /tmp/tests/
ENTRYPOINT [ "robot" ]