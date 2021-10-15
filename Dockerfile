# this is an official Python runtime, used as the parent image
FROM python:3

# set the working directory in the container to /app
WORKDIR /app

# copy the current directory to the container as /app
COPY . .

# execute 
RUN pip3 install --trusted-host pypi.python.org requests bottle BottleOIDC BottleSessions

# unblock port 8080 for the Bottle app to run on
EXPOSE 8080   

# execute 
CMD ["python", "app.py"]