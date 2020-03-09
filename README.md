<div align="center">

# Phoenix LiveView Counter Tutorial

[![Build Status](https://img.shields.io/travis/dwyl/phoenix-liveview-counter-tutorial/master.svg?style=flat-square)](https://travis-ci.org/dwyl/phoenix-liveview-counter-tutorial) [![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/dwyl/phoenix-liveview-counter-tutorial/issues) [![HitCount](http://hits.dwyl.io/dwyl/phoenix-liveview-counter-tutorial.svg)](http://hits.dwyl.io/dwyl/phoenix-liveview-counter-tutorial)
<!--
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/phoenix-liveview-counter-tutorial/master.svg?style=flat-square)](http://codecov.io/github/dwyl/phoenix-liveview-counter-tutorial?branch=master)
-->

**Build your _first_ App** using **Phoenix LiveView**
and _understand_ all the basic concepts in **20 minutes** or _less_!

<div>
  <a href="https://live-view-counter.herokuapp.com/">
    <img src="https://user-images.githubusercontent.com/194400/76150696-2e3f6b80-60a5-11ea-8d65-1999a70bb40a.gif">
  </a>
</div>

</div>
<br />

## Why? 🤷

There are several example apps on GitHub using Phoenix LiveView
but none include are step-by-step instructions
a _complete_ beginner can follow.
This repository is the **_complete beginner's_ tutorial**
we _wish_ we had when **learning LiveView**
and the one _you_ have been looking for!




## What? 💭

A _complete beginners_ tutorial for building
the most basic possible Phoenix LiveView App
with **no prior experience** necessary.


### LiveView?

Phoenix LiveView allows you to build rich interactive web apps
with realtime reactive UI (_no page refresh when data updates_)
without having to write any `JavaScript`!
This allows developers to build _incredible_ user experiences
with considerably less code.

LiveView pages load instantly because they are rendered on the Server
and they require considerably less bandwidth than a similar
React, Vue.js, Angular, etc. because only the _bare minimum_
is loaded on the client for the page to work.

See: https://github.com/phoenixframework/phoenix_live_view




<br />


## Who? 👤

This tutorial is aimed at people who have
never built _anything_ in Phoenix or LiveView.

If you get stuck at any point
while following the tutorial
or you have any feedback/questions,
_please_
[open an issue on GitHub!](https://github.com/dwyl/phoenix-liveview-counter-tutorial/issues)

If you don't have a lot of time or bandwidth to watch videos,
this tutorial will be the _fastest_ way to learn LiveView.

<br />

### Prerequisites: What you Need _Before_ You Start 📝

Before you start working through the tutorial,
you will need:

**a.** **`Elixir` installed** on your computer.
See: [learn-elixir#**installation**](https://github.com/dwyl/learn-elixir#installation) <br />

When you run the command:

```sh
elixir -v
```

You should expect to see output similar to the following:

```elixir
Elixir 1.10.1 (compiled with Erlang/OTP 22)
```
This informs us we are using `Elixir version 1.10.1`
which is the _latest_ version at the time of writing.


**b.** **`Phoenix` installed** on your computer.
see: [hexdocs.pm/phoenix/installation.html](https://hexdocs.pm/phoenix/installation.html)

If you run the following command in your terminal:

```sh
mix phx.new -v
```

You should see:

```sh
Phoenix v1.4.15
```

If you have a _later_ version of Phoenix,
and you get _stuck_ at any point,
_please_
[open an issue on GitHub!](https://github.com/dwyl/phoenix-liveview-counter-tutorial/issues)
We are here to help!




**c.** **`Node.js` installed** on your computer.
Download it from: https://nodejs.org

If you run the following command in your terminal:

```sh
node -v
```

You should see output similar to:

```
v12.16.1
```

> Phoenix LiveView does not require the _latest_ Node.js,
so if you have a _recent_ version e.g `v10`, you will be fine.


**d.** Familiarity with **basic `Elixir` syntax** is recommended
but not essential; <br />
you can pick it up as you go and
[ask questions](https://github.com/dwyl/phoenix-liveview-counter-tutorial/issues)
if you get stuck!
See: [https://github.com/dwyl/**learn-elixir**](https://github.com/dwyl/learn-elixir#what)


<br />

## How? 💻

This tutorial takes you through all the steps
to build and test a counter in Phoenix LiveView. <br />
We always
["begin with the end in mind"](https://en.wikipedia.org/wiki/The_7_Habits_of_Highly_Effective_People#2_-_Begin_with_the_end_in_mind)
so we recommend running the _finished_ app
on your machine _before_ writing any code.

> 💡 You can also try the version deployed to Heroku:
https://live-view-counter.herokuapp.com

<br />

### Step 0: Run the _Finished_ Counter App on your `localhost` 🏃‍

Before you attempt to _build_ the counter,
we suggest that you clone and _run_
the complete app on your `localhost`. <br />
That way you _know_ it's working
without much effort/time expended.


#### Clone the Repository

On your `localhost`,
run the following command to clone the repo
and change into the directory:

```sh
git clone https://github.com/dwyl/phoenix-liveview-counter-tutorial.git
cd phoenix-liveview-counter-tutorial
```

#### _Download_ the Dependencies

Install the `Elixir` dependencies by running the command:

```sh
mix deps.get
```

Install the `Node.js` dependencies with:

```sh
npm install --prefix assets
```

It will take a few seconds to download the dependencies
depending on the speed of your internet connection;
be
[patient](https://user-images.githubusercontent.com/194400/76169853-58139380-6174-11ea-8e03-4011815758d0.png).
😉

#### _Run_ the App

Start the Phoenix server by running the command:

```sh
mix phx.server
```

Now you can visit
[`localhost:4000`](http://localhost:4000)
in your web browser.

> 💡 Open a _second_ browser window (_e.g. incognito mode_),
you will see the the counter updating in both places like magic!

You should expect to see:

![phoenix-liveview-counter-start](https://user-images.githubusercontent.com/194400/76150696-2e3f6b80-60a5-11ea-8d65-1999a70bb40a.gif)


With the _finished_ version of the App running on your machine
and a clear picture of where we are headed, it's time to _build_ it!

<br />

### Step 1: Create the App 🆕

In your terminal run the following `mix` command
to generate the new Phoenix app:

```sh
mix phx.new live_view_counter --no-ecto
```

The `--no-ecto` flag tells `mix phx.new`
to create an App without a Database. <br />
This keeps our counter as simple as possible.
We can always add a Database to store the counter later.

When you see the following prompt:

```sh
Fetch and install dependencies? [Yn]
```

Type `Y` followed by the `[Enter]` key.
That will download all the necessary dependencies.

<br />

#### Checkpoint 1: _Run_ the _Tests_!


In your terminal, run the following `mix` command:

```sh
mix test
```

You should see:

```
Generated phoenix app
==> live_view_counter
Compiling 14 files (.ex)
Generated live_view_counter app
...

Finished in 0.02 seconds
3 tests, 0 failures
```

Tests all pass.
This is _expected_ with a new app.
It's a good way to confirm everything is working.

<br />

#### Checkpoint 1b: _Run_ the New Phoenix App!

Run the server by executing this command:

```sh
mix phx.server
```


Visit
[`localhost:4000`](http://localhost:4000)
in your web browser.

![welcome-to-phoenix](https://user-images.githubusercontent.com/194400/76152198-ae210200-60b4-11ea-956f-68935daddfe0.png)

> 🏁 Snapshot of code at the end of Step 1:
[phoenix-liveview-counter-tutorial/pull/4/commits/0d94a1c](https://github.com/dwyl/phoenix-liveview-counter-tutorial/tree/0d94a1c4072514d0c66cba2c2c21952a76af98be)

<br />

### Step 2: Add LiveView to `deps` in `mix.exs` File

Now that we have a working basic Phoenix App,
it's time to setup `phoenix_live_view` to work with our App.
There are quite a few steps
but they only take a couple of minutes to complete;
don't be put off by the configuration,
the payoff is worth it!


> 💡 This tutorial follows and _expands_
on the _official_ Phoenix LiveView installation instructions:
[github.com/phoenixframework/phoenix_live_view/blob/master/guides/introduction/installation.md](https://github.com/phoenixframework/phoenix_live_view/blob/e87a2a9c08c7527120e2f0c687b909a1e0095869/guides/introduction/installation.md) <br />
We always prefer _more_ detailed instructions when learning
so we have added more detail to each step.
Crucially we know all the steps in _this_ tutorial _work_ flawlessly,
because the counter works in the finished example.
If you followed the instructions in "Step 0"
to run the finished app on your `localhost`
_before_ diving into building it,
you also know they work for _you_. ✅


Open the `mix.exs` file and locate the `deps` list,
e.g:

```elixir
defp deps do
  [
    {:phoenix, "~> 1.4.15"},
    {:phoenix_pubsub, "~> 1.1"},
    {:phoenix_html, "~> 2.11"},
    {:phoenix_live_reload, "~> 1.2", only: :dev},
    {:gettext, "~> 0.11"},
    {:jason, "~> 1.0"},
    {:plug_cowboy, "~> 2.0"}
  ]
end

```

Append the following line to the end of the list:

```
{:phoenix_live_view, "~> 0.8.1"},
```

The `deps` definition should now look likes this:

```elixir
defp deps do
  [
    {:phoenix, "~> 1.4.15"},
    {:phoenix_pubsub, "~> 1.1"},
    {:phoenix_html, "~> 2.11"},
    {:phoenix_live_reload, "~> 1.2", only: :dev},
    {:gettext, "~> 0.11"},
    {:jason, "~> 1.0"},
    {:plug_cowboy, "~> 2.0"},
    {:phoenix_live_view, "~> 0.8.1"},
  ]
end
```

The _last_ line in the code block is the important one.


> 🏁 [`mix.exs`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/79d149c89655a6ddd452c93187e638b487aaf375/mix.exs#L33-L46)
file at the end of Step 2:
[mix.exs#L44](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/79d149c89655a6ddd452c93187e638b487aaf375/mix.exs#L44)

<br />

#### 2.1 Download the `phoenix_live_view` Dependency

Now that you've added the `phoenix_live_view` to `mix.exs`,
you need to _download_ the dependencies.
Run:

```
mix deps.get
```

You should see output similar to:

```
Resolving Hex dependencies...
Dependency resolution completed:
Unchanged:
  cowboy 2.7.0
  ...
New:
  phoenix_live_view 0.8.1
* Getting phoenix_live_view (Hex package)
```

<br />

### Step 3. Configure `signing_salt` in `config.exs`

Phoenix LiveView uses a cryptographic salt
to secure communications
between client and server. 🔐 <br />
You don't need to know what this is,
just follow the instructions below and you'll be fine,
but if you are curious,
read: https://en.wikipedia.org/wiki/Salt_(cryptography)

In your terminal run the following command:

```
mix phx.gen.secret 32
```

You should see output similar to the following:

```
iluKTpVJp8PgtRHYv1LSItNuQ1bLdR7c
```

> 💡 This is a **random** string generator
that generates a **32 character string** of alphanumeric data, <br />
so the result will be **different each time** you run the command.

Copy the string into your computer's clipboard.


Open your `config/config.exs` file
and locate the line that begins with
`live_view:`

In this case it is the last line in the "Configures the endpoint" block:

```elixir
# Configures the endpoint
config :live_view_counter, LiveViewCounterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "K73oqZVIRIAck+a4sNK0V/hPujAYLeXGrKwax57JXFKMb8z64kgTaMF0Ys/Ikhrm",
  render_errors: [view: LiveViewCounterWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LiveViewCounter.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "dUvMl2Sn"]
```

Replace the String value for `signing_salt`
with the one you generated in your terminal:

```elixir
# Configures the endpoint
config :live_view_counter, LiveViewCounterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "K73oqZVIRIAck+a4sNK0V/hPujAYLeXGrKwax57JXFKMb8z64kgTaMF0Ys/Ikhrm",
  render_errors: [view: LiveViewCounterWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LiveViewCounter.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "iluKTpVJp8PgtRHYv1LSItNuQ1bLdR7c"]
```

The _last_ line in the code block is the important one.


> 🏁 At the end of Step 3 the
[`config.exs`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/79d149c89655a6ddd452c93187e638b487aaf375/mix.exs#L33-L46)
file should look like this:
[config/config.exs#L16](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/6b48e6e52a7e935985a473a8cd4b32d7bbcfff39/config/config.exs#L16)

> 💡**Note**: in a _real world_ App,
we would use an environment variable
for the `signing_salt`
to ensure it is kept secret.


<br />

### Step 4: Add `:fetch_live_flash` Plug to Browser Pipeline


At the top of the file you should see the line
`use LiveViewCounterWeb, :router` <br />
add the following import statement below it:
[`import Phoenix.LiveView.Router`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/3b562348100ce0048da3f1f4e81c036d94e6463e/lib/live_view_counter_web/router.ex#L3)


Next we need to
replace the regular Phoenix flash plug
with the LiveView flash plug.

Open the
[`lib/live_view_counter_web/router.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/b1f4fada6ae6d1a62a8c53ed7cb5f86aa4854171/lib/live_view_counter_web/router.ex#L4-L10)
file and locate the `pipeline :browser do` block.
e.g:

```elixir
pipeline :browser do
  plug :accepts, ["html"]
  plug :fetch_session
  plug :fetch_flash
  plug :protect_from_forgery
  plug :put_secure_browser_headers
end
```

Replace the line `plug :fetch_flash`
with `plug :fetch_live_flash`
such that it now looks like this:

```elixir
pipeline :browser do
  plug :accepts, ["html"]
  plug :fetch_session
  plug :fetch_live_flash
  plug :protect_from_forgery
  plug :put_secure_browser_headers
end
```

That ensures flash messages (_e.g: "not connected to network"_)
are displayed in the client when the LiveView App is running.

> 🏁 At the end of Step 4, the
[`lib/live_view_counter_web/router.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/3b562348100ce0048da3f1f4e81c036d94e6463e/lib/live_view_counter_web/router.ex#L8)
should look like:
[`router.ex#L8`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/3b562348100ce0048da3f1f4e81c036d94e6463e/lib/live_view_counter_web/router.ex#L8)

<br />

### Step 5: Add `Phoenix.LiveView` Helpers to `live_view_counter_web.ex`


Open the
[`lib/live_view_counter_web.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/7e300eadb4b71443543d33dc9e02975a99f0aa08/lib/live_view_counter_web.ex)
file
and add the relevant `Phoenix.LiveView` import statements
for each of the `controller`, `view` and `router` blocks.

```diff
def controller do
  quote do
    ...
+   import Phoenix.LiveView.Controller
  end
end

def view do
  quote do
    ...
+   import Phoenix.LiveView.Helpers
  end
end

def router do
  quote do
    ...
+   import Phoenix.LiveView.Router
  end
end
```

> 🏁 Changes made in Step 5: <br />
**Before**:
[`lib/live_view_counter_web.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/7e300eadb4b71443543d33dc9e02975a99f0aa08/lib/live_view_counter_web.ex) <br />
***After***:
[`lib/live_view_counter_web.ex#L27`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/3c7c448ead7c161167fb310638b44be80b20ea1e/lib/live_view_counter_web.ex#L27)
The relevant lines are
[`27`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/3c7c448ead7c161167fb310638b44be80b20ea1e/lib/live_view_counter_web.ex#L27),
[`46`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/3c7c448ead7c161167fb310638b44be80b20ea1e/lib/live_view_counter_web.ex#L46)
and
[`55`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/3c7c448ead7c161167fb310638b44be80b20ea1e/lib/live_view_counter_web.ex#L55).

<br />

### Step 6: Create the `/live` Socket in `endpoint.ex`

In order to allow the client(s)
to communicate with the server,
we need to open a socket.
Open the
[`lib/live_view_counter_web/endpoint.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/3c7c448ead7c161167fb310638b44be80b20ea1e/lib/live_view_counter_web/endpoint.ex)
file
and add the following lines to it:

```elixir
socket "/live", Phoenix.LiveView.Socket,
  websocket: [connect_info: [session: @session_options]]
```

This exposes a socket in the `/live` namespace for the LiveView updates.

> 🏁 Changes made in Step 6:
[`lib/live_view_counter_web/endpoint.ex#L13-L14`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/f618a3b1214f6c26c2547fd7e6e6517fc72bd4d2/lib/live_view_counter_web/endpoint.ex#L13-L14)

<br />

### Step 7: Add `phoenix_live_view` to Node.js Dependencies in `package.json`

In order for the LiveView client to work in the web browser,
we need to add the LiveView NPM dependency to the
`dependencies` in the
[`assets/package.json`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/f618a3b1214f6c26c2547fd7e6e6517fc72bd4d2/assets/package.json#L8-L11)
file.

Locate the `"dependencies"` section:

```js
"dependencies": {
  "phoenix": "file:../deps/phoenix",
  "phoenix_html": "file:../deps/phoenix_html"
},
```

Add the line: `"phoenix_live_view": "file:../deps/phoenix_live_view"`
so that it now looks like this:

```js
"dependencies": {
  "phoenix": "file:../deps/phoenix",
  "phoenix_html": "file:../deps/phoenix_html",
  "phoenix_live_view": "file:../deps/phoenix_live_view"
}
```

> 🏁 Changes made in Step 7:
[`assets/package.json#L11`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/bb6c60b3f8743bfabff24e27f8da85282b48e51b/assets/package.json#L11)

<br />

#### 7.1 Install the NPM Dependency

Once you've added the line to the `package.json` file,
you will need to run the following command to _install_ the dependency:

```sh
npm install --prefix assets
```

You should expect to see output similar to the following:

```sh
added 1 package from 1 contributor and audited 8438 packages in 4.257s
```

<br />

### Step 8: Add CSRF meta tag to Layout

In order to ensure that the Client
can securely communicate with the LiveView
server we need to ensure that the `csrf_meta_tag()`
is included in the `<head>` tag of the layout template.

Open the
[`lib/live_view_counter_web/templates/layout/app.html.eex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/bb6c60b3f8743bfabff24e27f8da85282b48e51b/lib/live_view_counter_web/templates/layout/app.html.eex#L29)
file,
and add `<%= csrf_meta_tag() %>`
_above_ the `app.js` script tag:

```html
<%= csrf_meta_tag() %>
<script type="text/javascript" src="<%= Routes.static_path(@conn, "/js/app.js") %>"></script>
```


> 🏁 Line of code added in Step 8:
[`lib/live_view_counter_web/templates/layout/app.html.eex#L29`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/9d648ade3eaeb91a2de87cc4f822bc907776e667/lib/live_view_counter_web/templates/layout/app.html.eex#L29)

<br />

### Step 9: Add LiveView code to `app.js`

In order for the client to connect to LiveView,
we need to add some lines of code to `app.js`. <br />
Open the
[`assets/js/app.js`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/79d149c89655a6ddd452c93187e638b487aaf375/assets/js/app.js)
file and add the lines:

```js
import {Socket} from "phoenix"
import LiveSocket from "phoenix_live_view"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}});
liveSocket.connect()
```

> 🏁 Code added in Step 9:
[`assets/js/app.js#L19-L24`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/1bbef516da6b3ccb2b3f5b2a510edb6665300e76/assets/js/app.js#L19-L24)

<br />


### Step 10: Import the `live_view.css` in `app.css`

In order to display the "connecting" and "offline" UI in our counter,
we need to import the `live_view.css` file in our `app.css`.

Open the
[`assets/css/app.css`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/80ef56d9234f9006c35b0b43aeab953b5dc4c5de/assets/css/app.css#L3)
file and append the following line:

```css
@import "../../deps/phoenix_live_view/assets/css/live_view.css";
```

> 🏁 The line of code added in Step 10 is:
[`/assets/css/app.css#L4`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/eb7d33c44e9ac0ec1dc1f6b8462c6c96f8e1f677/assets/css/app.css#L4)

<br />



We are _finally_ finished setting up our Counter App to use LiveView!
Now we get to the _fun_ part: creating the counter!! 🎉



### Step 11: Create the `counter.ex` File

In the `lib/live_view_counter_web` directory,
create a new directory called `live`:

```
mkdir lib/live_view_counter_web/live
```
Then create a new file with the path:
`lib/live_view_counter_web/live/counter.ex`

And add the following code to it:

```elixir
defmodule LiveViewCounterWeb.Counter do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :val, 0)}
  end

  def handle_event("inc", _, socket) do
    {:noreply, update(socket, :val, &(&1 + 1))}
  end

  def handle_event("dec", _, socket) do
    {:noreply, update(socket, :val, &(&1 - 1))}
  end

  def render(assigns) do
    ~L"""
    <div>
      <h1>The count is: <%= @val %></h1>
      <button phx-click="dec">-</button>
      <button phx-click="inc">+</button>
    </div>
    """
  end
end
```

#### _Explanation_ of the Code

The first line instructs Phoenix to use the `Phoenix.LiveView` behaviour.
This loads just means that we will need to implement certain functions
for our live view to work.

The first function is `mount/3` which,
as it's name suggests, mounts the module
with the `_params`, `_session` and `socket` arguments:

```elixir
def mount(_params, _session, socket) do
  {:ok, assign(socket, :val, 0)}
end
```

In our case we are _ignoring_ the `_params` and `_session`,
hence the underscore prepended
to the parameters.
If we were using sessions user management,
we would need to check the `session` variable,
but in this simple counter example we just ignore it.

`mount/3` returns a
[tuple](https://elixir-lang.org/getting-started/basic-types.html#tuples):
`{:ok, assign(socket, :val, 0)}`
which uses the
[`assign/3`](https://hexdocs.pm/phoenix/Phoenix.Socket.html#assign/3)
function to assign the `:val` key a value of `0` on the `socket`.
That just means the socket will now have a `:val`
which is initialised to `0`.

<br />


The second function is `handle_event/3`
which handles the incoming events received.
In the case of the _first_ declaration of
`handle_event("inc", _, socket)`
it pattern matches the string `"inc"`
and _increments_ the counter.

```elixir
def handle_event("inc", _, socket) do
  {:noreply, update(socket, :val, &(&1 + 1))}
end
```
`handle_event/3` ("inc")
returns a tuple of:
`{:noreply, update(socket, :val, &(&1 + 1))}`
where the `:noreply` just means
"do not send any further messages to the caller of this function".
`update(socket, :val, &(&1 + 1))` as it's name suggests,
will _update_ the value of `:val` on the `socket`
to the
`&(&1 + 1)` is a shorthand way of writing `fn val -> val + 1 end`.
the `&()` is the same as `fn ... end`
(_where the `...` is the function definition_).
If this inline anonymous function syntax is unfamiliar to you,
please read:
https://elixir-lang.org/crash-course.html#partials-and-function-captures-in-elixir

The _third_ function is _almost identical_ to the one above,
the key difference is that it decrements the `:val`.

```elixir
def handle_event("dec", _, socket) do
  {:noreply, update(socket, :val, &(&1 - 1))}
end
```

`handle_event("dec", _, socket)` pattern matches the `"dec"` String
and _decrements_ the counter using the same syntax as before.

> In `Elixir` we can have multiple
similar functions with the _same_ function name
but different matches on the arguments
or different "arity" (_number of arguments_). <br />
For more detail on Functions in Elixir,
see: https://elixirschool.com/en/lessons/basics/functions/#named-functions


_Finally_ the _third_ function `render/1` which
receives it's state as the `assigns` argument
and renders the template.

The `render/1` function renders the template included in the function.
The `~L"""` syntax just means
"_treat this multiline string as a LiveView tempalte_"
The `~L` [sigil](https://elixir-lang.org/getting-started/sigils.html)
is a macro included when the `use Phoenix.LiveView` is invoked
at the top of the file.

LiveView will invoke the `mount/3` function
and will pass the result of `mount/3` to `render/1` behind the scenes.

Each time an update happens in the form of the `handle_event/3`
the `render/1` function will be executed.


> 🏁 At the end of Step 11 you should have a file similar to:
[`lib/live_view_counter_web/live/counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/fcf34ac1b7e0300ec5d51ce27695fece457fbd6d/lib/live_view_counter_web/live/counter.ex#L1)

<br />


### Step 12: Create the `live` Route in `router.ex`

Now that we have created our Live handler function in Step 11,
it's time to tell Phoenix how to invoke it.

Open the
`lib/live_view_counter_web/router.ex`
file and locate the block of code
that starts with `scope "/", LiveViewCounterWeb do`:

```elixir
scope "/", LiveViewCounterWeb do
  pipe_through :browser

  get "/", PageController, :index
end
```

Replace the line `get "/", PageController, :index`
with `live("/", Counter)`. So you end up with:

```elixir
scope "/", LiveViewCounterWeb do
  pipe_through :browser

  live("/", Counter)
end
```

> 🏁 At the end of Step 12 you should have a `router.ex` file similar to:
[`lib/live_view_counter_web/router.ex#L20`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/008aaaca697015cc944bca6b99cc654b1385b51e/lib/live_view_counter_web/router.ex#L20)

<br />

#### 12.1 Update the Failing Test Assertion

Since we have replaced the
`get "/", PageController, :index` route in `router.ex`
in the previous step, the test in
`test/live_view_counter_web/controllers/page_controller_test.exs`
will now _fail_:

```sh
Compiling 1 file (.ex)
..

  1) test GET / (LiveViewCounterWeb.PageControllerTest)
     test/live_view_counter_web/controllers/page_controller_test.exs:4
     Assertion with =~ failed
     code:  assert html_response(conn, 200) =~ "Welcome to Phoenix!"
     left:  "<!DOCTYPE html>\n<html lang=\"en\">\n  
     <head>\n <meta charset=\"utf-8\"/>\n
     <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"/>\n
     <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>\n
     <title>LiveViewCounter · Phoenix Framework</title>\n  
     </head>\n  <body>\n <header>\n <section class=\"container\">\n
     <a href=\"https://phoenixframework.org/\" class=\"phx-logo\">\n
     <img src=\"/images/phoenix.png\" alt=\"Phoenix Framework Logo\"/>\n </a>\n
     </section>\n </header>\n <main role=\"main\" class=\"container\">\n
     <div data-phx-main=\"true\"
     <h1>The count is: 0</h1>\n  <button phx-click=\"dec\">-</button>\n  
     <button phx-click=\"inc\">+</button>\n</div>\n</div>    
     </main> <script type=\"text/javascript\" src=\"/js/app.js\"></script>\n  
     </body>\n</html>\n"
     right: "Welcome to Phoenix!"
     stacktrace:
       test/live_view_counter_web/controllers/page_controller_test.exs:6: (test)

Finished in 0.1 seconds
3 tests, 1 failure
```
This just tells us that the test is looking for the string
`"Welcome to Phoenix!"` in the page and did not find it.


To fix the broken test, open the
`test/live_view_counter_web/controllers/page_controller_test.exs`
file and locate the line:
```elixir
assert html_response(conn, 200) =~ "Welcome to Phoenix!"
```
Update the string from `"Welcome to Phoenix!"`
to something we _know_ is present on the page,
e.g:
`"The count is"`

> 🏁 The `page_controller_test.exs` file should now look like this:
[`test/live_view_counter_web/controllers/page_controller_test.exs#L6`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/d3f1e34942396ecbb51e0a5241380176e86be389/test/live_view_counter_web/controllers/page_controller_test.exs#L6)


Confirm the tests pass again by running:

```sh
mix test
```

You should see output similar to:

```
Generated live_view_counter app
...

Finished in 0.05 seconds
3 tests, 0 failures
```



<br />

#### Checkpoint: Run Counter App!

Now that all the code for the `counter.ex` is written,
run the Phoenix app with the following command:

```
mix phx.server
```

Vist
[`localhost:4000`](http://localhost:4000)
in your web browser.

You should expect to see a fully functioning LiveView counter:

![phoenix-liveview-counter-single-windowl](https://user-images.githubusercontent.com/194400/76174551-d6395f80-619f-11ea-8e8d-ab9441d15b6d.gif)


<br />

#### Recap: Working Counter Without a JavaScript Framework

Once the initial installation and configuration of LiveView
(_Steps 1 - 10 of this tutorial_) were complete,
the creation of the actual counter was remarkably simple.
We created a _single_ new file
[`lib/live_view_counter_web/live/counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/fcf34ac1b7e0300ec5d51ce27695fece457fbd6d/lib/live_view_counter_web/live/counter.ex#L1)
that contains all the code required to
initialise, render and update the counter.
Then we set the `live("/", Counter)` route to invoke the `Counter` module
in `router.ex`.

In total our counter App is 25 lines of code.

<br />

One important thing to note is that
the counter only maintains state for a single web browser.
Try opening a second browser window (_e.g: in "incognito mode"_)
and notice how the counter only updates in one window at a time:

![phoenix-liveview-counter-two-windows-independent-count](https://user-images.githubusercontent.com/194400/76204729-de6dbb00-61f0-11ea-9e72-5c67f8aa6598.gif)

If we want to _share_ the counter state between multiple clients,
we need to add a bit more code.

<br />


### Step 13: Share State Between Clients!

One of the biggest selling points
of using Phoenix to build web apps
is the built-in support for WebSockets
in the form of "channels".
Phoenix Channels allow us to
effortlessly sync data between
clients and servers with minimal overhead.

We can share the counter state
between multiple clients by updating the `counter.ex` file
with the following code:


TODO: Broadcast the Inc/Dec Signal!

https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/20bea0b36f0a6a054b4398c5f69fe4a1583282c4/lib/live_view_counter_web/live/counter_live.ex

```elixir
defmodule LiveViewCounterWeb.Counter do
  use Phoenix.LiveView

  @topic "live"

  def render(assigns) do
    LiveViewCounterWeb.PageView.render("counter.html", assigns)
  end

  def mount(_session, socket) do
    LiveViewCounterWeb.Endpoint.subscribe(@topic)
    {:ok, assign(socket, :val, 0)}
  end

  def handle_event("inc", _value, socket) do
    new_state = update(socket, :val, &(&1 + 1))
    LiveViewCounterWeb.Endpoint.broadcast_from(self(), @topic, "inc", new_state.assigns)
    {:noreply, new_state}
  end

  def handle_event("dec", _, socket) do
    new_state = update(socket, :val, &(&1 - 1))
    LiveViewCounterWeb.Endpoint.broadcast_from(self(), @topic, "dec", new_state.assigns)
    {:noreply, update(socket, :val, &(&1 - 1))}
  end

  def handle_info(msg, socket) do
    {:noreply, assign(socket, msg.payload)}
  end
end
```



`lib/live_view_counter_web/templates/page/counter.html.leex`

```elixir
<div>
  <h1>The count is: <%= @val %></h1>
  <button phx-click="dec">-</button>
  <button phx-click="inc">+</button>
</div>
```





<br /><br />

## Recommended Reading 📚

+ _Official_ Phoenix LiveView installation instructions:
https://github.com/phoenixframework/phoenix_live_view/blob/master/guides/introduction/installation.md


<br /><br />

## Credits 🙌

Credit for inspiring this tutorial goes to Dennis Beatty
[@dnsbty](https://github.com/dnsbty)
for his superb post:
https://dennisbeatty.com/2019/03/19/how-to-create-a-counter-with-phoenix-live-view.html
and corresponding video: [youtu.be/2bipVjOcvdI](https://youtu.be/2bipVjOcvdI)

[![dennisbeatty-counter-video](https://user-images.githubusercontent.com/194400/76142652-953e2f80-6067-11ea-95f7-1efdad619b2f.png)](https://youtu.be/2bipVjOcvdI)

We recommend _everyone_ learning `Elixir`
_subscribe_ to his YouTube channel and watch _all_ his videos
as they are a _superb_ resource!

The 3 key differences
between this tutorial and Dennis' original post are:

1. **_Complete_ code** commit (snapshot) at the end of each section
(_not just inline snippets of code_). <br />
We feel that having the _complete_ code
speeds up learning significantly, especially if (when) we get _stuck_.
2. **_Latest_ Phoenix, Elixir and LiveView** versions.
A few updates have been made to LiveView setup,
these are reflected in our tutorial which uses the latest release.
3. ***Broadcast updates*** to all connected clients.
So when the counter is incremented/decremented in one client,
all others see the update.
This is the true power and "wow moment" of LiveView!

### Phoenix LiveView for Web Developers Who Don't know Elixir

If you are new to LiveView (_and have the bandwidth_),
we recommend watching
James [@knowthen](https://github.com/knowthen) Moore's
intro to LiveView where he explains the concepts:
[youtu.be/U_Pe8Ru06fM](https://youtu.be/U_Pe8Ru06fM)

[![phoenix-liveview-intro-](https://user-images.githubusercontent.com/194400/76150088-6d1df300-609e-11ea-8b73-67a263fc762b.png)](https://youtu.be/U_Pe8Ru06fM)

Watching the video is _not required_;
you will be able to follow the tutorial without it.


<br />

Chris McCord (creator of Phoenix and LiveView) has
[github.com/chrismccord/phoenix_live_view_example](https://github.com/chrismccord/phoenix_live_view_example/tree/e3966aca18f7d8f4da84d197e3ee22af4050fd5e) <br />
![chris-phoenix-live-view-example-rainbow](https://user-images.githubusercontent.com/194400/76169589-9ce9fb00-6171-11ea-9238-2c72287b0eed.png)
It's a great collection of examples for people who already understand LiveView.
However we feel that it is not very beginner-friendly
(_at the time of writing_).
Only the default "_start your Phoenix server_" instructions are included,
and the
[dependencies have diverged](https://github.com/chrismccord/phoenix_live_view_example/issues/56)
so the app does not _compile/run_ for some people.
We understand/love that Chris is focussed _building_
Phoenix and LiveView so we decided to fill in the gaps
and write this _beginner-focussed_ tutorial.
