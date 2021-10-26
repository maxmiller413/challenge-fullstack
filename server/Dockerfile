FROM elixir:latest

RUN apt-get update && \
  apt-get install -y postgresql-client

RUN mkdir /app
COPY . /app
WORKDIR /app

# Install hex package manager
RUN mix local.hex --force

# Compile the project
RUN mix deps.get --force
RUN mix local.rebar --force
RUN mix do compile

RUN chmod +x /app/entrypoint.sh
CMD ["/app/entrypoint.sh"]
