FROM python:3.9-slim as builder
 
ENV PYTHONUNBUFFERED=1
 
WORKDIR /app
 
RUN apt-get update && apt-get install -y libreoffice
 
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

FROM gcr.io/distroless/python3
 
WORKDIR /app
 
COPY --from=builder /app /app

EXPOSE 5001
CMD ["/usr/local/bin/python", "app.py"]
