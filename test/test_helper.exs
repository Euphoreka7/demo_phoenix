ExUnit.start

Mix.Task.run "ecto.create", ~w(-r DemoPhoenix.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r DemoPhoenix.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(DemoPhoenix.Repo)

