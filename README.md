Esto generará un nuevo proyecto Phoenix sin las configuraciones y dependencias relacionadas con Ecto:
```sh
mix phx.new nombre_del_proyecto --no-ecto
```
Once we have Elixir and Erlang, we are ready to install the Phoenix application generator:
```sh
mix archive.install hex phx_new
```
```sh
mix phx.new file_sync --no-ecto
cd file_sync
mix deps.get # instalo dependencias
mix phx.server # inicio el servidor / ejecutar la aplicacion
```
actualizar proyecto
```sh
mix deps.clean --all
mix deps.get
```
mostrar proyecto:
```sh
tree -I '_build|deps'
```
mostra PID del container
```sh
docker inspect -f '{{.State.Pid}}' postgres_prod # postgres_prod es nombre_container
```
You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server


ejecyrar tests
mix test
--------------
eliminar imagenes creadas por este compose:
```sh
docker-compose down --rmi all
```
❯ docker-compose up --build
docker compose down --rmi local --volumes --remove-orphans

--------------
para produccion 

Para generar una clave secreta, puedes ejecutar el siguiente comando en tu terminal:

    $ mix phx.gen.secret


ver mix phx.digest