FROM ubuntu:20.04

MAINTAINER Tim McNamara "tsm@canonical.com"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
            python3 \
            python3-setuptools \
            python3-pip

COPY ./requirements.txt /app/requirements.txt

RUN python3 -m pip install --no-cache-dir \
                   -r /app/requirements.txt
RUN apt-get purge -y --auto-remove \
           python3-pip

COPY . /app

WORKDIR /app

#ENV FLASK_APP app.py
#CMD ["flask", "run"]

CMD ["gunicorn", "--bind=0.0.0.0", "hello_juju:app"]
