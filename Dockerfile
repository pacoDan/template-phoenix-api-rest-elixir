# Usa una imagen oficial de Elixir como base
FROM elixir:latest

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Instala las dependencias de sistema necesarias para compilar el proyecto
RUN apt-get update && \
    apt-get install -y \
    postgresql-client

# Copia el resto de los archivos
COPY . .
# Copia los archivos necesarios para compilar el proyecto
COPY mix.exs mix.lock ./
COPY config config
COPY lib lib

# Instala las dependencias del proyecto
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get && mix deps.update --all

# Compila el proyecto
RUN mix compile

# Expone el puerto 4000 en el contenedor
EXPOSE 4000

# Ejecuta el servidor Phoenix en modo de producción
CMD ["mix", "phx.server"]
