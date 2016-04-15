#### Elixir Installation
http://elixir-lang.org/install.html
OS X:
```
brew install elixir
```

Check elixir version:
```
$ elixir --version
Elixir 1.2.1
```

```
$ erl -version
Erlang (SMP,ASYNC_THREADS,HIPE) (BEAM) emulator version 7.2.1
```

Node.js install: https://nodejs.org/en/download/stable/

```
$ node -v
v5.10.1
```

```
$ npm -v
3.8.3
```

`iex` - ruby irb equivalent
`iex -S mix` - rails c equivalent

#### Getting the Phoenix Framework
```
$ git clone https://github.com/phoenixframework/phoenix.git
$ cd phoenix
```

Get deps and compile phoenix project before start
```
$ mix do deps.get, compile
```

Intall phoenix.new task
```
$ mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
```

#### Create postgres user
```
$ createuser ectouser --pwprompt
```

create db for this user
```
$ createdb -Oectouser -Eutf8 demo_phoenix_development
```

or grant access to create database. connect to postgres and type:
```
ALTER USER ectouser CREATEDB;
```

Make sure you can login to database
```
$ psql demo_phoenix_development --user ectouser --password
```

#### Create new project
```
$ mix phoenix.new ../demo_phoenix
$ cd ../demo_phoenix
$ mix do deps.get, compile
$ git init
$ git add .
$ git commit -m 'First commit'
```

Start server
```
$ mix phoenix.server
```

#### Create controller
web/controllers/quote_controller.ex
```
defmodule DemoPhoenix.QuoteController do
  use DemoPhoenix.Web, :controller

  def homepage(conn, _params) do
    render conn, "homepage.html"
  end
end
```
#### Create new view file
Create view file

web/views/quote_view.ex
```
defmodule DemoPhoenix.QuoteView do
  use DemoPhoenix.Web, :view
end
```

Create template
```
mkdir web/templates/quote
```
web/templates/quote/homepage.html.eex
```
1 + 1 = <%= 1 + 1 %>
```

#### Create database migration
Update database settings at config/dev/exs

Create migration file
```
mix ecto.gen.migration create_quotes
```

Create table in migration file
```
defmodule DemoPhoenix.Repo.Migrations.CreateQuotes do
  use Ecto.Migration

  def change do
    create table(:quotes) do
      add :saying, :string
      add :author, :string

      timestamps
    end
  end
end
```

Create database and run migrations
```
mix ecto.create
mix ecto.migrate
```


#### Set up a model
web/models/quote.ex
```
defmodule DemoPhoenix.Quote do
  use Ecto.Model

  schema "quotes" do
    field :saying, :string
    field :author, :string

    timestamps
  end

  @required_fields ~w(saying author)
  @optional_fields ~w()
end
```

`iex -S mix` open elixir console

Save record to database
```
alias DemoPhoenix.Repo
quote = %DemoPhoenix.Quote{saying: "First message.", author: "Bob Smith"}
Repo.insert(quote)
```

Load record from database where 1 - quotes.id
```
quote2 = Repo.get(DemoPhoenix.Quote, 1)
```

Update and restroy record
```
quote3 = DemoPhoenix.Repo.get_by(DemoPhoenix.Quote, author: "Bob Smith")
changeset = Ecto.Changeset.cast(quote3, %{author: "Bob Smith1"}, ~w(author), ~w())
quote3 = DemoPhoenix.Repo.update!(changeset)
{:ok, deleted_post} = DemoPhoenix.Repo.delete(quote3)
```
#### Useful tasks
  * `mix deps.get` install dependencies
  * `npm install` install node.js dependencies
  * `iex -S mix` elixir console
  * `mix phoenix.routes` see routes
  * `mix phoenix.server` start server
  * `mix ecto.gen.migration migration_name` create migration file
  * `mix ecto.create` create database
  * `mix ecto.migrate` migrate database

#### Learn more
  * Deployment guides http://www.phoenixframework.org/docs/deployment
  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
