FROM ubuntu:latest 
MAINTAINER impks raj.ratedr001@gmail.com
RUN apt-get update
RUN apt-get install -y python python-pip wget
RUN pip install Flask
ADD hello.py /home/hello.py  
WORKDIR /home
