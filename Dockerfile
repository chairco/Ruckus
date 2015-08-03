FROM ubuntu:12.04

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# Install vnc, xvfb in order to create a 'fake' display and firefox
# RUN apt-get install -y python-pip
RUN apt-get install -y xvfb
# RUN apt-get install -y firefox
RUN apt-get install -y x11vnc
#RUN mkdir ~/.vnc
# Setup a password
#RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
# Autostart firefox (might not be the best way to do it, but it does the trick)
#RUN bash -c 'echo "firefox" >> /.bashrc'

FROM python:2.7
ADD . .

# Install Chrome
#RUN wget http://chromedriver.storage.googleapis.com/2.16/chromedriver_linux64.zip chromedriver_linux64.zip
#RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/local/bin/

RUN pip install -r requirements.txt

# Install firefox version 30
#RUN wget http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/30.0/linux-x86_64/en-US/firefox-30.0.tar.bz2
#RUN tar -xjvf firefox-30.0.tar.bz2
#RUN mv firefox /opt/firefox30.0
#RUN ln -sf /opt/firefox30.0/firefox /usr/bin/firefox



ENV DISPLAY :0
CMD python mockflask.py 
