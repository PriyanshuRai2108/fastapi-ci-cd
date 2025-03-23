# Start from an Ubuntu base image
FROM ubuntu:latest

# Set working directory inside the container
WORKDIR /app

# Install required system dependencies
RUN apt update && apt install -y python3 python3-pip python3-venv

# Create a virtual environment
RUN python3 -m venv /venv

# Activate the virtual environment and install Python dependencies
RUN /venv/bin/pip install --upgrade pip
COPY requirements.txt .
RUN /venv/bin/pip install -r requirements.txt

# Set the virtual environment as the default for Python and pip commands
ENV PATH="/venv/bin:$PATH"

# Copy the rest of your application code
COPY . .

# Command to run your FastAPI app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
