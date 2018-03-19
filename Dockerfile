FROM jupyter/base-notebook

USER root

RUN apt-get update && \
    apt-get install -y ruby-dev \
                       libtool \
                       libffi-dev \
                       ruby \
                       ruby-dev \
                       make \
                       libzmq3-dev \
                       libczmq-dev
RUN gem install cztop iruby
RUN iruby register --force
RUN mkdir /notebooks

USER $NB_UID

WORKDIR /notebooks

ENTRYPOINT ["sh", "-c", "jupyter notebook --no-browser --allow-root --ip=0.0.0.0"]
