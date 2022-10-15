FROM  python:alpine

COPY requirements.txt /tmp/requirements.txt
# hadolint ignore=DL3013
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r /tmp/requirements.txt

COPY tests /tmp/tests

WORKDIR /tmp/tests/
ENTRYPOINT [ "robot" ]