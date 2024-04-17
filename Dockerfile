FROM python:3.8

ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y default-libmysqlclient-dev gcc && \
    rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /usr/src/requirements.txt

WORKDIR /usr/src

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

ADD ./src /usr/src

#EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]