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

`iex` - rails console equivalent

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

#### Useful tasks
  * `mix deps.get` install dependencies
  * `npm install` install node.js dependencies
  * `mix phoenix.routes` see routes
  * `mix phoenix.server` start server
  * `mix ecto.create` create database
  * `mix ecto.migrate` migrate database

#### Learn more
  * Deployment guides http://www.phoenixframework.org/docs/deployment
  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
