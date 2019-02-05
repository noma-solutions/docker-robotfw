FROM ubuntu:16.04

MAINTAINER "Andrzej Karwacki" <andrzej.karwacki@nomasolutions.pl>

LABEL name="Docker build for acceptance testing using the robot framework"

RUN apt update
RUN apt install -y build-essential libssl-dev libffi-dev python-dev
RUN apt install -y python3-pip python3-dev gcc phantomjs firefox
RUN apt install -y xvfb zip wget
RUN apt install -y ca-certificates
RUN apt install -y ntpdate
RUN apt install -y sudo vim

RUN apt install -y libnss3-dev libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation
RUN pip3 install --upgrade pip
RUN pip3 install robotframework
RUN pip3 install robotframework-sshlibrary
RUN pip3 install robotframework-selenium2library
RUN pip3 install -U robotframework-httplibrary
RUN pip3 install -U requests[security] && pip install -U robotframework-requests
RUN pip3 install robotframework-xvfb
RUN pip3 install certifi
RUN pip3 install urllib3[secure]
RUN pip3 install openpyxl
RUN pip3 install pyyaml
RUN pip3 install Pillow
RUN pip3 install ndg-httpsclient
RUN pip3 install pyopenssl
RUN pip3 install pyasn1
RUN pip3 install robotframework-testrail
RUN pip3 install --upgrade RESTinstance
RUN pip3 install pika
RUN pip3 install robotframework-rabbitmq

RUN cd
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-linux64.tar.gz
RUN tar xvzf geckodriver-v0.11.1-linux64.tar.gz
RUN rm geckodriver-v0.11.1-linux64.tar.gz
RUN mv geckodriver /usr/local/bin && chmod +x /usr/local/bin/geckodriver
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb
RUN rm google-chrome*.deb
RUN wget https://chromedriver.storage.googleapis.com/2.42/chromedriver_linux64.zip && unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/local/bin && chmod +x /usr/local/bin/chromedriver
RUN rm chromedriver_linux64.zip
RUN mkdir /robot



