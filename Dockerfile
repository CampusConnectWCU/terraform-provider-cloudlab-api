FROM python:3.12-slim
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

COPY . /app

EXPOSE 8080
CMD ["gunicorn", "-b", "0.0.0.0:8080", "--timeout", "120", "server:app"]
