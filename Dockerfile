FROM continuumio/miniconda3

RUN apt update && apt install -y swig gcc

ADD . /src

WORKDIR /src
RUN pip install -r requirements.txt
