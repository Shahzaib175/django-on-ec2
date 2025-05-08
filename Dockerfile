# Use an official Python runtime as a parent image
#FROM python:3.9
FROM python:3.10-slim
# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app/

# Install dependencies
RUN apt-get update && apt-get install -y libpq-dev && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on
EXPOSE 8000

# Set the environment variable to indicate that we are in production
ENV PYTHONUNBUFFERED=1

# Run the Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
