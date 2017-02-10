FROM phusion/baseimage:0.9.19
MAINTAINER Dmitry @nscyclone

ENV REFRESHED_AT 2017-02-10

# Set `HOME`.
RUN echo /root > /etc/container_environment/HOME

# Set locale.
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Regenerate SSH host keys.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Initialize `base-image`.
CMD ["/sbin/my_init"]

# Set `DEBIAN_FRONTEND` to `noninteractive`.
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install latest Erlang.
WORKDIR /tmp
RUN echo "deb http://packages.erlang-solutions.com/ubuntu $(lsb_release -cs) contrib" >> /etc/apt/sources.list && \
    apt-key adv --fetch-keys http://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc && \
    apt-get -qq update && apt-get install -y \
    esl-erlang \
    build-essential \
    unzip \
    curl \
    jq && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download and install latest Elixir.
WORKDIR /elixir
RUN curl -sL https://api.github.com/repos/elixir-lang/elixir/releases/latest | \
    jq -r ".assets[] | select(.name | test(\"Precompiled.zip\")) | .browser_download_url" | \
    xargs curl -sOL && \
    unzip Precompiled.zip && \
    rm -f Precompiled.zip && \
    ln -s /elixir/bin/elixirc /usr/local/bin/elixirc && \
    ln -s /elixir/bin/elixir /usr/local/bin/elixir && \
    ln -s /elixir/bin/mix /usr/local/bin/mix && \
    ln -s /elixir/bin/iex /usr/local/bin/iex

# Install hex and rebar.
RUN /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force

WORKDIR /

CMD ["iex"]