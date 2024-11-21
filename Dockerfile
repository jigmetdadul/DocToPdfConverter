FROM python:3.9-slim
 
ENV PYTHONUNBUFFERED 1
 
WORKDIR /app
 
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt
 
COPY . /app/
 
RUN apt-get update && apt-get install -y libreoffice
 
EXPOSE 5000

CMD ["python", "app.py", "runserver", "0.0.0.0:5001"]
