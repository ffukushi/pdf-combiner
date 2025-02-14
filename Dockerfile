FROM python:3.12

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

ENV APP_HOME=/usr/src/app

RUN mkdir -p $APP_HOME
WORKDIR ${APP_HOME}
COPY . ${APP_HOME}/

RUN apt-get -q update && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT [ "python", "main.py" ]
