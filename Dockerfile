# Use a standard Python image
FROM python:3.11-slim

# Install system dependencies needed for some Vanna integrations
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the entire project directory into the container
# This ensures README.md, pyproject.toml, and src/ are all present
COPY . .

# Upgrade pip and install the package in editable mode or normally
RUN pip install --no-cache-dir --upgrade pip setuptools
RUN pip install --no-cache-dir .

# Expose the port (Vanna usually uses 8084 or similar, adjust if needed)
EXPOSE 8084

# Start Vanna
CMD ["python", "-m", "vanna"]
