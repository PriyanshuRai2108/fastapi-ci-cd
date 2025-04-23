# Use Ubuntu as the base image
FROM ubuntu:20.04

# Avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY main.py .

# Expose the port on which the app will run
EXPOSE 8000

# Run the application using uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
