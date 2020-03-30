FROM python:3.7

ARG build-dir

WORKDIR /app

COPY ${build-dir}/. /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

ENTRYPOINT ["python"]

CMD ["application.py"]