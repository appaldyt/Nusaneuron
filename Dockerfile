# Gunakan Python base image
FROM python:3.11-slim

# Tentukan working directory
WORKDIR /app

# Salin semua file project ke container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Jalankan Gunicorn untuk production
CMD ["bash", "-c", "python manage.py collectstatic --noinput && gunicorn nusaneuron.wsgi:application --bind 0.0.0.0:8000"]

