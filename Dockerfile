# Gunakan Python base image
FROM python:3.11-slim

# Tentukan working directory
WORKDIR /app

# Salin semua file project ke container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Kumpulkan static files (jika nanti ada)
RUN python manage.py collectstatic --noinput

# Jalankan Gunicorn untuk production
CMD ["gunicorn", "nusaneuron.wsgi:application", "--bind", "0.0.0.0:8000"]
