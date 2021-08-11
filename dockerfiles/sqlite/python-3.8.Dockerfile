FROM jfloff/alpine-python:3.8

RUN pip install pipenv

COPY Pipfile /app/Pipfile
COPY Pipfile.lock /app/Pipfile.lock

WORKDIR /app

RUN pipenv install

ENV WORKON_HOME=/venvs

# Force environment creation
RUN pipenv run python3 -c "print('hey')"
