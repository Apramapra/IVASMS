FROM python:3.11-slim
WORKDIR /app
RUN apt-get update && apt-get install -y chromium && ln -sf /usr/bin/chromium /usr/bin/google-chrome-stable && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
ENV PORT=10000
ENV PYTHONUNBUFFERED=1
EXPOSE 10000
CMD ["python", "index.py"]
