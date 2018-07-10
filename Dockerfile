FROM danielguerra/ubuntu-xrdp

RUN apt update && apt install -y swig gcc python python-pip curl portaudio19-dev

RUN mkdir /download
WORKDIR /download

RUN curl -LO https://repo.continuum.io/miniconda/Miniconda3-4.5.4-Linux-x86_64.sh
RUN bash Miniconda3-4.5.4-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda3-4.5.4-Linux-x86_64.sh

ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda

RUN wget http://neurodebian.ovgu.de/debian/pool/contrib/p/pycharm-community-sloppy/pycharm-community-sloppy_2017.2.3-1~ndall+nd18.04+1_amd64.deb
RUN apt install -y -f ./pycharm-community-sloppy_2017.2.3-1~ndall+nd18.04+1_amd64.deb

ADD . /src
WORKDIR /src

RUN apt install -y libpulse-dev
RUN pip install -r requirements.txt