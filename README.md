instalacion de dependencias:
```sh
mix deps.get  ## Este comando descargará e instalará todas las dependencias que están listadas en el archivo mix.exs.
```
```sh
mix deps.compile
```
Crear y migrar la base de datos:
```sh
mix ecto.create
mix ecto.migrate
```
Levantar el servidor:
```sh
mix phx.server
```
verificar conexion a la base de datos:
```sh
mix ecto.ping
```
saber PID del contenedor para poder matarlo cuando esta de forma corrupta:
```sh
docker inspect -f '{{.State.Pid}}' postgres_prod
```
---

# RextremElixir

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

- creacion
mix phx.new rextremElixir

We are almost there! The following steps are missing:

    $ cd rextremElixir

code .

hen configure your database in config/dev.exs and run:

    $ mix ecto.create

Start your Phoenix app with:

    $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server



--------------

❯ docker-compose up
docker compose down --rmi local --volumes --remove-orphans


--------------
para produccion 

Para generar una clave secreta, puedes ejecutar el siguiente comando en tu terminal:

    $ mix phx.gen.secret
