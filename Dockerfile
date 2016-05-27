FROM python:latest
MAINTAINER yukiyamada

RUN mkdir /tmp/work

ADD extractKeyWordsByJuman.py /tmp/work

WORKDIR /tmp/work

RUN pip install pip --upgrade

RUN wget -O juman.tar.bz2 http://nlp.ist.i.kyoto-u.ac.jp/DLcounter/lime.cgi?down=http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/juman/juman-7.01.tar.bz2&name=juman-7.01.tar.bz2

RUN ls
RUN bzip2 -dc juman.tar.bz2

RUN pip install flask

RUN python extractKeyWordsByJuman.py
