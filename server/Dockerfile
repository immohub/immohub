# Extend from the official Elixir image
FROM elixir:alpine

# Install postgresql-client
RUN apk update && \
    apk add postgresql-client

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY . /app
WORKDIR /app

# Install hex package manager
# By using --force, we don’t need to type “Y” to confirm the installation
RUN mix local.hex --force
RUN mix local.rebar --force

# Fetch the dependencies
RUN mix deps.get

# Compile the project
RUN mix do compile

# Command to start
CMD ["/app/entrypoints/start.sh"]
