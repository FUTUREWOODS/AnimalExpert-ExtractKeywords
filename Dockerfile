FROM python:2
MAINTAINER yukiyamada

RUN mkdir /tmp/work

ADD extractKeyWordsByJuman.py /tmp/work

ADD run.sh /tmp/work

WORKDIR /tmp/work

RUN pip install pip --upgrade

# Install Juman
#ADD juman.tar.bz2 /tmp/work
RUN wget -O - http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/juman/juman-7.01.tar.bz2 | tar xjvf -

RUN cd juman-7.01 &&\
    ./configure &&\
    make &&\
    make install
    
RUN echo "include /usr/local/lib" >> /etc/ld.so.conf && ldconfig

RUN git clone https://github.com/chezou/cJuman-installer.git

RUN cd cJuman-installer && python setup.py install

RUN pip install flask

EXPOSE 5000

CMD python extractKeyWordsByJuman.py