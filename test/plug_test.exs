defmodule BartenderPlugTest do
  use ExUnit.Case, async: true
  use Plug.Test
  import GuardianHelper

  setup do
    conn =
      :post
      |> Plug.Test.conn("/auth")

    user = %{id: :ok, test: true}
    {:ok, token, _claims} = encode_and_sign(user, %{}, token_type: :access)

    [conn: conn, token: token]
  end

  describe "Bartender.Plug" do
    test "successfully calls the module", %{conn: conn} do
      assert Bartender.Plug.call(conn, GuardianHelper)
    end

    test "sets the current_user in context when the token is correct", %{conn: conn, token: token} do
      conn =
        conn
        |> put_req_header("authorization", "Bearer " <> token)

      %{private: %{absinthe: %{context: context}}} = Bartender.Plug.call(conn, GuardianHelper)
      assert context == %{current_user: %{test: true}}
    end

    test "does not set a current_user in context when the token is bad", %{conn: conn} do
      conn =
        conn
        |> put_req_header("authorization", "Bearer bad_token")

      %{private: %{absinthe: %{context: context}}} = Bartender.Plug.call(conn, GuardianHelper)
      assert context == %{}
    end

    test "does not set a current_user in context when the token is missing", %{conn: conn} do
      %{private: %{absinthe: %{context: context}}} = Bartender.Plug.call(conn, GuardianHelper)
      assert context == %{}
    end
  end
end
