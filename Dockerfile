FROM ubuntu:16.04

MAINTAINER "Andrzej Karwacki" <andrzej.karwacki@nomasolutions.pl>

LABEL name="Docker build for acceptance testing using the robot framework"

RUN apt update; \
    apt install -y build-essential libssl-dev libffi-dev python-dev; \
    apt install -y python3-pip python3-dev gcc phantomjs firefox; \
    apt install -y xvfb zip wget; \
    apt install -y ca-certificates; \
    apt install -y ntpdate; \
    apt install -y sudo vim; \
    apt install -y libnss3-dev libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation; \
    pip3 install robotframework; \
    pip3 install robotframework-sshlibrary; \
    pip3 install robotframework-selenium2library; \
    pip3 install -U robotframework-httplibrary; \
    pip3 install -U requests[security] && pip install -U robotframework-requests; \
    pip3 install robotframework-xvfb; \
    pip3 install certifi; \
    pip3 install urllib3[secure]; \
    pip3 install openpyxl; \
    pip3 install pyyaml; \
    pip3 install Pillow; \
    pip3 install ndg-httpsclient; \
    pip3 install pyopenssl; \
    pip3 install pyasn1; \
    pip3 install robotframework-testrail; \
    pip3 install --upgrade RESTinstance; \
    pip3 install pika; \
    pip3 install robotframework-rabbitmq; \
    cd; \
    wget https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-linux64.tar.gz; \
    tar xvzf geckodriver-v0.11.1-linux64.tar.gz; \
    rm geckodriver-v0.11.1-linux64.tar.gz; \
    mv geckodriver /usr/local/bin && chmod +x /usr/local/bin/geckodriver; \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb; \
    dpkg -i google-chrome*.deb; \
    rm google-chrome*.deb; \
    wget https://chromedriver.storage.googleapis.com/2.42/chromedriver_linux64.zip && unzip chromedriver_linux64.zip; \
    mv chromedriver /usr/local/bin && chmod +x /usr/local/bin/chromedriver; \
    rm chromedriver_linux64.zip; \
    mkdir /robot


