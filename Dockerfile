# Use a lightweight Python image
FROM python:3.11-slim

# Install system dependencies (needed for some Vanna database connectors)
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# IMPORTANT: Copy everything so README.md is present
COPY . .

# Install Vanna
RUN pip install --no-cache-dir --upgrade pip setuptools
RUN pip install --no-cache-dir .

# Vanna's default CLI entry point
EXPOSE 8084
CMD ["python", "-m", "vanna"]
