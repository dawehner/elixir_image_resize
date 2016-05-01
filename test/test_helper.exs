ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ElixirImageResize.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ElixirImageResize.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ElixirImageResize.Repo)

