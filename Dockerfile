# Base image
FROM python:3.13-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    postgresql-client \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install uv CLI
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Copy dependency file first for caching
COPY pyproject.toml .

# Install app dependencies and dev tools in system Python
RUN python3 -m pip install --no-cache-dir -e . ruff mypy pytest

# Copy source code
COPY . .

# Expose FastAPI port
EXPOSE 8000

# Default command
CMD ["fastapi", "run", "app/main.py", "--port", "8000"]
