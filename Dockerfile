FROM python:3.11.1-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN useradd appuser \
    && mkdir /home/appuser \
    && chown appuser /home/appuser

WORKDIR /app
RUN chown appuser ./

COPY --chown=appuser pyproject.toml poetry.lock /app/

RUN pip install --upgrade pip \
    && pip install poetry

USER appuser

RUN poetry install --no-root

COPY --chown=appuser . /app/
