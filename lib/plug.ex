defmodule Bartender.Plug do
  @behaviour Plug

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, guardian_module) do
    context = build_context(conn, guardian_module)
    Absinthe.Plug.put_options(conn, context: context)
  end

  defp build_context(conn, guardian_module) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
      {:ok, current_user} <- authorize(guardian_module, token) do
        %{current_user: current_user}
      else
        _ ->
          %{}
      end
  end

  defp authorize(guardian_module, token) do
    case apply(guardian_module, :resource_from_token, [token]) do
      {:ok, user, _claims} ->
        {:ok, user}
      _ ->
        {:error, :unauthorized}
    end
  end
end
