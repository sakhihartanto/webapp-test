FROM ubuntu:20.04
MAINTAINER Docker Education Team <education@docker.com>

# Update package lists
RUN apt-get update

# Install Python and pip
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip

# Copy the requirements file
COPY ./webapp/requirements.txt /tmp/requirements.txt

# Upgrade pip
RUN pip3 install -qr /tmp/requirements.txt

# Copy the application code to the container
COPY ./webapp /opt/webapp/

# Set the working directory
WORKDIR /opt/webapp

# Expose the necessary port
EXPOSE 5000

# Start the application
CMD ["python3", "app.py"]
