FROM ubuntu:14.04

MAINTAINER  Trumpet <zh19970205@126.com>

RUN apt-get upadte && apt-get install -y python python-flask gcc git
RUN cd ~ && git clone git@github.com:zh19970205/little_tools.git

WORKDIR ~/

CMD "python" "~/little_tools/run.py"

EXPOSE 80