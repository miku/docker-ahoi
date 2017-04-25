# Use python:2.7.13-alpine
# FROM python:2.7.13-alpine
FROM python:3.6.1-alpine

# More: https://hub.docker.com/_/python/

# Other: debian, ubuntu
# Each command creates a layer.

# testapp folder has to be at /usr/local/opt/testapp
COPY testapp /usr/local/opt/testapp

# Go to /usr/local/opt/testapp and run pip install --editable .
RUN cd /usr/local/opt/testapp && pip install --editable .

# Best practice: Try to combine as many deps in a single
# Layer: each command is a new layer with a sha.

# We need to set 2 environment variables: FLASK_APP=testapp, FLASK_DEBUG=true
ENV FLASK_APP=testapp FLASK_DEBUG=true

# Expose port 5000
EXPOSE 5000

# Run command on startup: flask run --host=0.0.0.0 --port=5000
# ENTRYPOINT flask run --host=0.0.0.0 --port=5000

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
# More things can be added on call.

# Base image has CMD. New images overwrite previous CMD.
# ENTRYPOINT script cannot be overwritten.

# $ docker images
# REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
# r1                  latest              9987ad9490a9        8 minutes ago       84.5 MB
# python              2.7.13-alpine       b63d02d8829b        7 weeks ago         71.5 MB
# alpine              latest              4a415e366388        7 weeks ago         3.99 MB

# Important: version pinning, not python:latest, but python:2.7.13-alpine.

# Usually you do not use Dockerfiles in production: docker-compose is not production ready.
# Shortcuts for calling and running.
# For production use: swarm or kubernetes.
