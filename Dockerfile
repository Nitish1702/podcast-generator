# Use the latest Ubuntu base image
FROM ubuntu:latest

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3 -pip \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install the PyYAML package using pip3
RUN pip3 install PyYAML

# Copy the application code and entrypoint script into the container
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint script is executable
RUN chmod +x /entrypoint.sh

# Define the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
