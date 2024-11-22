FROM python:3.9-slim as builder

ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --no-cache-dir --target=/app/dependencies -r requirements.txt

FROM python:3.9-slim

ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends libreoffice && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/dependencies /usr/local/lib/python3.9/site-packages/

COPY . /app/

EXPOSE 5001
ENV HOSTNAME="0.0.0.0"
CMD ["python", "app.py"]