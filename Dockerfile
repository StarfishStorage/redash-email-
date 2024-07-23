FROM node:18-bookworm

RUN apt-get -y update
RUN apt-get -y install python3-requests python3-yaml python3-jinja2
RUN apt-get -y install chromium

RUN groupadd -r automation
RUN useradd -m -r -g automation -G audio,video automation

USER automation

WORKDIR /home/automation
RUN npm -d install puppeteer@22.4.1

COPY --chown=automation:automation src/* /home/automation/

ENTRYPOINT ["/home/automation/send-report.py"]
