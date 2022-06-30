FROM python:3.7.4-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV WORKDIR /app/

WORKDIR ${WORKDIR}

COPY Pipfile Pipfile.lock ${WORKDIR}

RUN pip install pipenv --no-cache-dir && \
    pipenv install --system --deploy && \
    pip uninstall -y pipenv virtualenv-clone virtualenv

COPY . $WORKDIR

CMD ["python", "main.py"]

#ADD  fim.sh /usr/local/bin/fim.sh
#RUN chmod +x /usr/local/bin/fim.sh
#CMD  ["/usr/local/bin/fim.sh"]

#bashのために追加してみたやつ
RUN apt-get install -y sqlite
RUN apt-get install -y libsqlite3-dev

# ビルドツール

RUN apt-get install -y software-properties-common
RUN apt-get install -y gcc
RUN apt-get install -y g++
RUN apt-get install -y build-essential
RUN apt-get install -y autoconf
RUN apt-get install -y pkg-config
RUN apt-get install -y libtool
RUN apt-get install -y make
RUN apt-get install -y llvm

RUN apt-get install -y curl
RUN apt-get install -y aptitude
RUN apt-get install -y git
RUN apt-get install -y mercurial

RUN apt-get install -y ntp
RUN apt-get install -y unzip
RUN apt-get install -y zsh
RUN apt-get install -y vim
RUN apt-get install -y procps
RUN apt-get install -y net-tools
RUN apt-get install -y xserver-xephyr