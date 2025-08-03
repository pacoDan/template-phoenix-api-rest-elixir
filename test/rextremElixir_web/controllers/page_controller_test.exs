defmodule RextremElixirWeb.PageControllerTest do
  use RextremElixirWeb.ConnCase

  # test "GET /", %{conn: conn} do
  #   conn = get(conn, ~p"/")
  #   assert html_response(conn, 200) =~ "Peace of mind from prototype to production"
  # end
    test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Hola"
  end
end
