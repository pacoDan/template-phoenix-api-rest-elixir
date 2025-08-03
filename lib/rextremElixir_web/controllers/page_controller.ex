defmodule RextremElixirWeb.PageController do
  use RextremElixirWeb, :controller

  # def home(conn, _params) do
  #   # The home page is often custom made,
  #   # so skip the default app layout.
  #   render(conn, :home, layout: false)
  # end
    def home(conn, _params) do
    render(conn, "home.html")
  end
end
