# :cocktail: Bartender

> JWT authentication using [Absinthe](https://github.com/absinthe-graphql/absinthe) + [Guardian](https://github.com/ueberauth/guardian)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bartender` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bartender, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/bartender](https://hexdocs.pm/bartender).

## Usage

You can call `Bartender.Plug` explicitly with `Bartender.Plug.call(conn, MyApp.Guardian)` 

If using in Phoenix, or any other app that uses `Router`, establish the `Plug` like so.

```elixir
defmodule MyApp.Router do
  use MyApp, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Bartender.Plug, MyApp.Guardian
  end
end
```

This `Plug` makes use of `Absinthe.Plug`, inserting the verified resource (in this case, a `current_user`) into the Connection, which can then be accessed from a Resolver. See the Absinthe [docs](https://hexdocs.pm/absinthe/context-and-authentication.html#content) for more info.
