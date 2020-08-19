FROM python:3.8.3-alpine

RUN adduser -D themightyuser

WORKDIR /home/themightyuser

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn

COPY src src
COPY web_application.py boot.sh ./
RUN chmod a+x boot.sh

ENV FLASK_APP web_application.py

RUN chown -R themightyuser:themightyuser ./
USER themightyuser

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
