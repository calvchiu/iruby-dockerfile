FROM ruby:2.5

RUN apt-get update && \
    apt-get install -y python3-pip \
                       libzmq3-dev \
                       libczmq-dev
RUN pip3 install jupyter
RUN gem install cztop iruby
RUN iruby register --force

RUN mkdir notebooks
WORKDIR notebooks

ENTRYPOINT ["sh", "-c", "jupyter notebook --no-browser --allow-root --ip=0.0.0.0"]
