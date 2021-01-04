<div align="center">

# Phoenix LiveView Counter Tutorial

[![Build Status](https://img.shields.io/travis/dwyl/phoenix-liveview-counter-tutorial/master.svg?style=flat-square)](https://travis-ci.org/dwyl/phoenix-liveview-counter-tutorial)
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/phoenix-liveview-counter-tutorial/master.svg?style=flat-square)](http://codecov.io/github/dwyl/phoenix-liveview-counter-tutorial?branch=master)
[![Hex pm](http://img.shields.io/hexpm/v/phoenix_live_view.svg?style=flat-square)](https://hex.pm/packages/phoenix_live_view)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/dwyl/phoenix-liveview-counter-tutorial/issues)
[![HitCount](http://hits.dwyl.io/dwyl/phoenix-liveview-counter-tutorial.svg)](http://hits.dwyl.io/dwyl/phoenix-liveview-counter-tutorial)

**Build your _first_ App** using **Phoenix LiveView** <br />
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

<br />

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

> 💡 This tutorial follows and _expands_
> on the _official_ Phoenix LiveView installation instructions:
> [github.com/phoenixframework/phoenix_live_view/blob/master/guides/introduction/installation.md](https://github.com/phoenixframework/phoenix_live_view/blob/e87a2a9c08c7527120e2f0c687b909a1e0095869/guides/introduction/installation.md) <br />
> We always prefer _more_ detailed instructions when learning
> so we have added more detail to each step.
> Crucially we know all the steps in _this_ tutorial _work_ flawlessly,
> because the counter works in the finished example.
> If you followed the instructions in "Step 0"
> to run the finished app on your `localhost` > _before_ diving into building it,
> you also know they work for _you_. ✅

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
Elixir 1.10.4 (compiled with Erlang/OTP 23)
```

This informs us we are using `Elixir version 1.10.4`
which is the _latest_ version at the time of writing.

<br />

**b.** **`Phoenix` installed** on your computer.
see: [hexdocs.pm/phoenix/installation.html](https://hexdocs.pm/phoenix/installation.html)

If you run the following command in your terminal:

```sh
mix phx.new -v
```

You should see:

```sh
Phoenix v1.5.5
```

If you have an earlier version,
definitely upgrade to get the latest features! <br />
If you have a _later_ version of Phoenix,
and you get _stuck_ at any point,
_please_
[open an issue on GitHub!](https://github.com/dwyl/phoenix-liveview-counter-tutorial/issues)
We are here to help!

<br />

**c.** **`Node.js` installed** on your computer.
Download it from: https://nodejs.org

If you run the following command in your terminal:

```sh
node -v
```

You should see output similar to:

```
v12.18.4
```

> Phoenix LiveView does not require the _latest_ Node.js,
> so if you have a _recent_ version e.g `v10`, you will be fine.

<br />

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
> https://live-view-counter.herokuapp.com

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

Install the dependencies by running the command:

```sh
mix setup
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
> you will see the the counter updating in both places like magic!

You should expect to see:

![phoenix-liveview-counter-start](https://user-images.githubusercontent.com/194400/76150696-2e3f6b80-60a5-11ea-8d65-1999a70bb40a.gif)

With the _finished_ version of the App running on your machine
and a clear picture of where we are headed, it's time to _build_ it!

<br />

### Step 1: Create the App 🆕

In your terminal run the following `mix` command
to generate the new Phoenix app:

```sh
mix phx.new live_view_counter --live --no-ecto
```

The `--live` flag tells the `mix phx.new` generator command
that we are creating a `LiveView` application.
It will setup the dependencies and boilerplate
for us to get going as fast as possible.

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

In your terminal, go into the newly created app folder using:

```sh
cd live_view_counter
```

And then run the following `mix` command:

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

😱 If you are having problems with the server hanging, try
[this](#problems-with-dependencies)

> 🏁 Snapshot of code at the end of Step 1:
> [`#c48488`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/tree/c4848853beb2df3327663270d1018a128bbcf0fa)

<br />

### Step 2. Configure `signing_salt` in `config.exs`

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
> that generates a **32 character string** of alphanumeric data, <br />
> so the result will be **different each time** you run the command.

Copy the string into your computer's clipboard.

Open your `config/config.exs` file
and locate the line that begins with
`live_view:`

In this case it is the last line in the "Configures the endpoint" block:

```elixir
# Configures the endpoint
config :live_view_counter, LiveViewCounterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "s0e+LZ/leTtv3peHaFhnd2rbncAeV5qlR1rNShKXDMSRbVgU2Aar8nyXszsQrZ1p",
  render_errors: [view: LiveViewCounterWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveViewCounter.PubSub,
  live_view: [signing_salt: "tT2envDD"]
```

Replace the String value for `signing_salt`
with the one you generated in your terminal:

```elixir
# Configures the endpoint
config :live_view_counter, LiveViewCounterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "s0e+LZ/leTtv3peHaFhnd2rbncAeV5qlR1rNShKXDMSRbVgU2Aar8nyXszsQrZ1p",
  render_errors: [view: LiveViewCounterWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveViewCounter.PubSub,
  live_view: [signing_salt: "iluKTpVJp8PgtRHYv1LSItNuQ1bLdR7c"]
```

The _last_ line in the code block is the important one.

> 🏁 At the end of Step 2 the file should look like this:
> [config/config.exs#L16](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/c8f175eaa90352cec37eb1db070b652a763265cb/config/config.exs#L16)

> 💡**Note**: in a _real world_ App,
> we would use an environment variable
> for the `signing_salt`
> to ensure it is kept secret.

<br />

### Step 3: Add `Phoenix.LiveView.Controller` to `live_view_counter_web.ex`

Open the `lib/live_view_counter_web.ex` file
and add the relevant `Phoenix.LiveView` import statement
to the `controller`:

```diff
def controller do
  quote do
    use Phoenix.Controller, namespace: LiveViewCounterWeb

    import Plug.Conn
    import LiveViewCounterWeb.Gettext
    alias LiveViewCounterWeb.Router.Helpers, as: Routes

+   import Phoenix.LiveView.Controller
  end
end
```

> 🏁 Change made in Step 3:
> [`lib/live_view_counter_web.ex#L28`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/ac2b5bedba500e08dbc066ecb5772f6fe3e2a69f/lib/live_view_counter_web.ex#L28)

<br />

We are finished setting up our Phoenix App to use LiveView!
Now we get to the _fun_ part: creating the counter!! 🎉

<br />

### Step 4: Create the `counter.ex` File

Create a new file with the path:
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
  {:ok, assign(socket, :val, 0) }
end
```

In our case we are _ignoring_ the `_params` and `_session`,
hence the underscore prepended
to the parameters.
If we were using sessions for user management,
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
Specifying the `layout` template as `app.html`
is needed for Phoenix LiveView to know which template file to use.

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
and _decrements_ the counter using the `&(&1 - 1)` syntax.

> In `Elixir` we can have multiple
> similar functions with the _same_ function name
> but different matches on the arguments
> or different "arity" (_number of arguments_). <br />
> For more detail on Functions in Elixir,
> see: https://elixirschool.com/en/lessons/basics/functions/#named-functions

_Finally_ the _forth_ function `render/1`
receives the `assigns` argument which contains the `:val` state
and renders the template using the `@val` template variable.

The `render/1` function renders the template included in the function.
The `~L"""` syntax just means
"_treat this multiline string as a LiveView template_"
The `~L` [sigil](https://elixir-lang.org/getting-started/sigils.html)
is a macro included when the `use Phoenix.LiveView` is invoked
at the top of the file.

LiveView will invoke the `mount/3` function
and will pass the result of `mount/3` to `render/1` behind the scenes.

Each time an update happens (e.g: `handle_event/3`)
the `render/1` function will be executed
and updated data (_in our case the `:val` count_)
is sent to the client.

> 🏁 At the end of Step 4 you should have a file similar to:
> [`lib/live_view_counter_web/live/counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/7e75ba0cfd7f170dc022cfdf62af380d70cc1496/lib/live_view_counter_web/live/counter.ex)

<br />

### Step 5: Create the `live` Route in `router.ex`

Now that we have created our Live handler function in Step 4,
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
with `live("/", Counter)`.
So you end up with:

```elixir
scope "/", LiveViewCounterWeb do
  pipe_through :browser

  live("/", Counter)
end
```

> 🏁 At the end of Step 5 you should have a `router.ex` file similar to:
> [`lib/live_view_counter_web/router.ex#L20`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/008aaaca697015cc944bca6b99cc654b1385b51e/lib/live_view_counter_web/router.ex#L20)

<br />

#### 5.1 Update the Failing Test Assertion

Since we have replaced the
`get "/", PageController, :index` route in `router.ex`
in the previous step, the test in
`test/live_view_counter_web/controllers/page_controller_test.exs`
will now _fail_:

```sh
Compiling 1 file (.ex)
..

1) test disconnected and connected render (LiveViewCounterWeb.PageLiveTest)
   test/live_view_counter_web/live/page_live_test.exs:6
   Assertion with =~ failed
   code:  assert disconnected_html =~ "Welcome to Phoenix!"
   left:  "<html lang=\"en\"><head><meta charset=\"utf-8\"/><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"/><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/><meta charset=\"UTF-8\" content=\"IHQLHHISBjZlWTskHjAmHBETKCFnGWUloYSOGMkDRhaSvIBtkycvQNUF\" csrf-param=\"_csrf_token\" method-param=\"_method\" name=\"csrf-token\"/><title data-suffix=\" · Phoenix Framework\">LiveViewCounter · Phoenix Framework</title><link phx-track-static=\"phx-track-static\" rel=\"stylesheet\" href=\"/css/app.css\"/><script defer=\"defer\" phx-track-static=\"phx-track-static\" type=\"text/javascript\" src=\"/js/app.js\"></script></head><body><header><section class=\"container\"><nav role=\"navigation\"><ul><li><a href=\"https://hexdocs.pm/phoenix/overview.html\">Get Started</a></li><li><a href=\"/dashboard\">LiveDashboard</a></li></ul></nav><a href=\"https://phoenixframework.org/\" class=\"phx-logo\"><img src=\"/images/phoenix.png\" alt=\"Phoenix Framework Logo\"/></a></section></header><div data-phx-main=\"true\" data-phx-session=\"SFMyNTY" data-phx-view=\"Counter\" id=\"phx-FhQ9AJF6KACJPAEm\"><div><h1>The count is: 0</h1><button phx-click=\"dec\">-</button><button phx-click=\"inc\">+</button></div></div></body></html>"
   right: "Welcome to Phoenix!"
   stacktrace:
     test/live_view_counter_web/live/page_live_test.exs:8: (test)


Finished in 0.1 seconds
3 tests, 1 failure
```

This just tells us that the test is looking for the string
`"Welcome to Phoenix!"` in the page and did not find it.

To fix the broken test, open the
`test/live_view_counter_web/live/page_live_test.exs`
file and locate the lines:

```elixir
assert disconnected_html =~ "Welcome to Phoenix!"
assert render(page_live) =~ "Welcome to Phoenix!"
```

Update the string from `"Welcome to Phoenix!"`
to something we _know_ is present on the page,
e.g:
`"The count is"`

> 🏁 The `page_live_test.exs` file should now look like this:
> [`test/live_view_counter_web/live/page_live_test.exs#L8-L9`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/8b12dd70f6b1693a4f39a1cb53f8fc1b4ced33f1/test/live_view_counter_web/live/page_live_test.exs#L8-L9)

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

Once the initial installation
and configuration of LiveView was complete,
the creation of the actual counter was remarkably simple.
We created a _single_ new file
[`lib/live_view_counter_web/live/counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/7e75ba0cfd7f170dc022cfdf62af380d70cc1496/lib/live_view_counter_web/live/counter.ex)
that contains all the code required to
initialise, render and update the counter.
Then we set the `live("/", Counter)` route
to invoke the `Counter` module in `router.ex`.

In total our counter App is **25 lines** of code.

<br />

One important thing to note is that
the counter only maintains state for a single web browser.
Try opening a second browser window (_e.g: in "incognito mode"_)
and notice how the counter only updates in one window at a time:

![phoenix-liveview-counter-two-windows-independent-count](https://user-images.githubusercontent.com/194400/76204729-de6dbb00-61f0-11ea-9e72-5c67f8aa6598.gif)

If we want to _share_ the counter state between multiple clients,
we need to add a bit more code.

<br />

### Step 6: Share State Between Clients!

One of the biggest selling points
of using Phoenix to build web apps
is the built-in support for WebSockets
in the form of "channels".
Phoenix Channels allow us to
effortlessly sync data between
clients and servers with minimal overhead.

We can share the counter state
between multiple clients by updating the
[`counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/fcf34ac1b7e0300ec5d51ce27695fece457fbd6d/lib/live_view_counter_web/live/counter.ex#L1)
file with the following code:

```elixir
defmodule LiveViewCounterWeb.Counter do
  use Phoenix.LiveView

  @topic "live"

  def mount(_session, _params, socket) do
    LiveViewCounterWeb.Endpoint.subscribe(@topic) # subscribe to the channel
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
    {:noreply, new_state}
  end

  def handle_info(msg, socket) do
    {:noreply, assign(socket, val: msg.payload.val)}
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

#### Code Explanation

The first change is on
[Line 4](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/d3cddb14dff911a377d0e41b916cfe57b0557606/lib/live_view_counter_web/live/counter.ex#L4)
`@topic "live"` defines a module attribute
(_think of it as a global constant_),
that lets us to reference `@topic` anywhere in the file.

The second change is on
[Line 7](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/d3cddb14dff911a377d0e41b916cfe57b0557606/lib/live_view_counter_web/live/counter.ex#L7)
where the
[`mount/3`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/d3cddb14dff911a377d0e41b916cfe57b0557606/lib/live_view_counter_web/live/counter.ex#L6)
function now creates a subscription to the topic:

```elixir
LiveViewCounterWeb.Endpoint.subscribe(@topic) # subscribe to the channel topic
```

Each client connected to the App
subscribes to the `@topic`
so when the count is updated on any of the clients,
all the other clients see the same value.
This uses Phoenix's built-in channels (WebSocket) system.

Next we update the first
[`handle_event/3`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/d3cddb14dff911a377d0e41b916cfe57b0557606/lib/live_view_counter_web/live/counter.ex#L11)
function which handles the `"inc"` event:

```elixir
def handle_event("inc", _msg, socket) do
  new_state = update(socket, :val, &(&1 + 1))
  LiveViewCounterWeb.Endpoint.broadcast_from(self(), @topic, "inc", new_state.assigns)
  {:noreply, new_state}
end
```

Assign the result of the `update` invocation to `new_state`
so that we can use it on the next two lines.
Invoking
`LiveViewCounterWeb.Endpoint.broadcast_from`
sends a message from the current process `self()`
on the `@topic`, the key is "inc"
and the _value_ is the `new_state.assigns` Map.

In case you are curious (_like we are_),
`new_state` is an instance of the
[`Phoenix.LiveView.Socket`](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.Socket.html)
socket:

```elixir
#Phoenix.LiveView.Socket<
  assigns: %{
    flash: %{},
    live_view_action: nil,
    live_view_module: LiveViewCounterWeb.Counter,
    val: 1
  },
  changed: %{val: true},
  endpoint: LiveViewCounterWeb.Endpoint,
  id: "phx-Ffq41_T8jTC_3gED",
  parent_pid: nil,
  view: LiveViewCounterWeb.Counter,
  ...
}
```

The `new_state.assigns` is a Map
that includes the key `val`
where the value is `1`
(_after we clicked on the increment button_).

The _fourth_ update is to the
`"dec"` version of
[`handle_event/3`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/d3cddb14dff911a377d0e41b916cfe57b0557606/lib/live_view_counter_web/live/counter.ex#L17)

```elixir
def handle_event("dec", _msg, socket) do
  new_state = update(socket, :val, &(&1 - 1))
  LiveViewCounterWeb.Endpoint.broadcast_from(self(), @topic, "dec", new_state.assigns)
  {:noreply, new_state}
end
```

The only difference from the `"inc"`
version is the `&(&1 - 1)`
and "dec" in the `broadcast_from`.

The _final_ change is the implementation of the `handle_info/2` function:

```elixir
def handle_info(msg, socket) do
  {:noreply, assign(socket, msg.payload)}
end
```

[`handle_info/2`](https://hexdocs.pm/phoenix/Phoenix.Channel.html#c:handle_info/2)
handles `Elixir` process messages
where `msg` is the received message
and `socket` is the `Phoenix.Socket`. <br />
The line `{:noreply, assign(socket, msg.payload)}`
just means "don't send this message to the socket again"
(_which would cause a recursive loop of updates_).

> 🏁 At the end of Step 6 the file looks like:
> [`lib/live_view_counter_web/live/counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/d3cddb14dff911a377d0e41b916cfe57b0557606/lib/live_view_counter_web/live/counter.ex#L1-L36)

<br />

#### Checkpoint: Run It!

Now that
[`counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/33e0e47fd379e1314dcba6509d214c9468632c77/lib/live_view_counter_web/live/counter.ex#L4)
has been updated to broadcast the count to all connected clients,
let's _run_ the app in a few web browsers to show it in _action_!

In your terminal, run:

```
mix phx.server
```

Open
[`localhost:4000`](http://localhost:4000)
in as many web browsers as you have
and test the increment/decrement buttons!

You should see the count increasing/decreasing in all browsers simultaneously!

![phoenix-liveview-counter-four-windows](https://user-images.githubusercontent.com/194400/76265954-d26c1280-625d-11ea-90df-bcd6db60ccf5.gif)

<br />

# Congratulations! 🎉

You just built a real-time counter
that seamlessly updates all connected clients
using Phoenix LiveView
in less than 40 lines of code!

<br />

<!-- uncomment this if you want to help get it working.

### Step 7: Use a LiveView Template (Optional)

At present the
[`render/1`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/33e0e47fd379e1314dcba6509d214c9468632c77/lib/live_view_counter_web/live/counter.ex#L27-L34)
function in
[`counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/33e0e47fd379e1314dcba6509d214c9468632c77/lib/live_view_counter_web/live/counter.ex#L4)
has an inline template:

```elixir
def render(assigns) do
  ~L"""
  <div>
    <h1>The count is: <%= @val %></h1>
    <button phx-click="dec">-</button>
    <button phx-click="inc">+</button>
  </div>
  """
```

This is _fine_ when the template is small like in this counter,
but it's a good idea to split the template into a _separate_ file
to make it easier to read and maintain.

Create a new file with the path:
`lib/live_view_counter_web/templates/counter.html.leex`

and add the following code to it:

```html
<div>
  <h1>The count is: <%= @val %></h1>
  <button phx-click="dec">-</button>
  <button phx-click="inc">+</button>
</div>
```

> 🏁 Your `counter.html.leex` should look like this:
[lib/live_view_counter_web/templates/counter.html.leex](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/a82b6b79d83e62efc7d1d0be6b89ecef06c04fcd/lib/live_view_counter_web/templates/counter.html.leex)

That template is identical to the one we had in the
[`render/1`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/33e0e47fd379e1314dcba6509d214c9468632c77/lib/live_view_counter_web/live/counter.ex#L27-L34)
function.
That's the point; we just want it in a separate file.

<br />

Now open the
[`counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/33e0e47fd379e1314dcba6509d214c9468632c77/lib/live_view_counter_web/live/counter.ex#L4)
file and locate the
[`render/1`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/33e0e47fd379e1314dcba6509d214c9468632c77/lib/live_view_counter_web/live/counter.ex#L27-L34)
function.
Update the code to:

```elixir
def render(assigns) do
  LiveViewCounterWeb.PageView.render("counter.html", assigns)
end
```

> 🏁 At the end of Step 7 your `counter.ex` file should resemble:
[lib/live_view_counter_web/live/counter.ex](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/f6a5be51a7f7acc3c0df63595ec6f9716a603e12/lib/live_view_counter_web/live/counter.ex#L29)

Re-run your app using `mix phx.server` and confirm everything still works:


![phoenix-liveview-counter-42](https://user-images.githubusercontent.com/194400/76267885-14985280-6264-11ea-8e6d-52d5166aacd9.gif)

<br /><br />

# _Done_!

-->

That's it for this tutorial. <br />
We hope you enjoyed learning with us! <br />
If you found this useful, please ⭐️and _share_ the GitHub repo
so we know you like it!

<br /><br /><br />

## Future Steps

### Moving state out of the LiveViews

With this implementation you may have noticed that when we open a new browser
window the count is always zero. As soon as we click plus or minus it adjusts
and all the views get back in line. This is because the state is replicated
across LiveView instances and coordinated via pub-sub. If the state was big
and complicated this would get wasteful in resources and hard to manage.

Generally it is good practice to identify _shared state_ and to manage that in
a single location.

The Elixir way of managing state is the
[GenServer](https://hexdocs.pm/elixir/GenServer.html), using PubSub to update
the LiveViews about changes. This allows the LiveViews to focus on user specific
state, separating concerns; making the application both more efficient
(hopefully) and easier to reason about and debug.

We are now going to start making use of the lib/live_view_counter directory! The
[Phoenix docs](https://hexdocs.pm/phoenix/directory_structure.html#content) says
that this holds "all of your business domain". For us this is the current count,
along with the incr and decr methods.

```elixir
defmodule LiveViewCounter.Count do
  use GenServer

  alias Phoenix.PubSub

  @name :count_server

  @start_value 0

  # -------  External API (runs in client process) -------

  def topic do
    "count"
  end

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, @start_value, name: @name)
  end

  def incr() do
    GenServer.call @name, :incr
  end

  def decr() do
    GenServer.call @name, :decr
  end

  def current() do
    GenServer.call @name, :current
  end

  def init(start_count) do
    {:ok, start_count}
  end

  # -------  Implementation  (Runs in GenServer process) -------

  def handle_call(:current, _from, count) do
     {:reply, count, count}
  end

  def handle_call(:incr, _from, count) do
    make_change(count, +1)
  end

  def handle_call(:decr, _from, count) do
    make_change(count, -1)
  end

  defp make_change(count, change) do
    new_count = count + change
    PubSub.broadcast(LiveViewCounter.PubSub, topic(), {:count, new_count})
    {:reply, new_count, new_count}
  end
end
```

The GenServer runs in its own process. Other parts of the application invoke
the API in their own process, these calls are forwarded to the `handle_call`
functions in the GenServer process where they are processed serially.

We have also moved the PubSub publication here as well.

_[We could have used asyncronous `handle_cast` functions and relied on the
PubSub to update us. Using `handle_call` means the calling LiveView will be
updated twice, but it doesn't really matter at this scale.]_

We are also going to need to tell the Application that it now has some business
logic; we do this in the `start/2` function in the
`lib/live_view_counter/application.ex file`.

```diff
  def start(_type, _args) do
    children = [
      # Start the App State
+     LiveViewCounter.Count,
      # Start the Telemetry supervisor
      LiveViewCounterWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveViewCounter.PubSub},
      # Start the Endpoint (http/https)
      LiveViewCounterWeb.Endpoint
      # Start a worker by calling: LiveViewCounter.Worker.start_link(arg)
      # {LiveViewCounter.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveViewCounter.Supervisor]
    Supervisor.start_link(children, opts)
  end
...
```

Finally, we are going to have to make some changes to the LiveView itself,
it now has less to do!

```elixir
defmodule LiveViewCounterWeb.Counter do
  use Phoenix.LiveView
  alias LiveViewCounter.Count
  alias Phoenix.PubSub

  @topic Count.topic

  def mount(_params, _session, socket) do
    PubSub.subscribe(LiveViewCounter.PubSub, @topic)

    {:ok, assign(socket, val: Count.current()) }
  end

  def handle_event("inc", _, socket) do
    {:noreply, assign(socket, :val, Count.incr())}
  end

  def handle_event("dec", _, socket) do
    {:noreply, assign(socket, :val, Count.decr())}
  end

  def handle_info({:count, count}, socket) do
    {:noreply, assign(socket, val: count)}
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

What is happening now is that the initial state is being retrieved from the
shared Application GenServer process and the updates are being forwarded there
via its API. Finally, the Gen Server Handlers publish the new state to all the
active LiveViews.

### How many people are using the Counter?

Phoenix has a very cool feature called
[Presence](https://hexdocs.pm/phoenix/presence.html#content) to track how many
people are using our system. (It does a lot more than count users, but this is
a counting app so...)

First of all we need to tell the Application we are going to use Presence.
For this we need to create a `lib/lib_view_counter/presence.ex` file like this:

```elixir
defmodule LiveViewCounter.Presence do
  use Phoenix.Presence,
    otp_app: :live_view_counter,
    pubsub_server: LiveViewCounter.PubSub
end
```

and tell the application about it in the `lib/lib_view_counter/application.ex`
file (add it just below the PubSub config):

```diff
  def start(_type, _args) do
    children = [
      # Start the App State
      LiveViewCounter.Count,
      # Start the Telemetry supervisor
      LiveViewCounterWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveViewCounter.PubSub},
+     LiveViewCounter.Presence,
      # Start the Endpoint (http/https)
      LiveViewCounterWeb.Endpoint
      # Start a worker by calling: LiveViewCounter.Worker.start_link(arg)
      # {LiveViewCounter.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveViewCounter.Supervisor]
    Supervisor.start_link(children, opts)
  end

```

The application doesn't need to know any more about the user count (it might,
but not here) so the rest of the code goes into
`lib/lib_view_counter_web/live/counter.ex`.

1. We subscribe, participate-in and subscribe to the Presence system (we do that in
   `mount`)
1. We handle Presence updates and use the current count, adding joiners and
   subtracting leavers to calculate the current numbers 'present'. We do that
   in a pattern matched `handle_info`.
1. We publish the additional data to the client in `render`

```diff
defmodule LiveViewCounterWeb.Counter do
  use Phoenix.LiveView
  alias LiveViewCounter.Count
  alias Phoenix.PubSub
  alias LiveViewCounter.Presence

  @topic Count.topic
  @presence_topic "presence"

  def mount(_params, _session, socket) do
    PubSub.subscribe(LiveViewCounter.PubSub, @topic)

+   Presence.track(self(), @presence_topic, socket.id, %{})
+   LiveViewCounterWeb.Endpoint.subscribe(@presence_topic)
+
+   initial_present =
+     Presence.list(@presence_topic)
+     |> map_size

+   {:ok, assign(socket, val: Count.current(), present: initial_present) }
-   {:ok, assign(socket, val: Count.current()) }
  end

  def handle_event("inc", _, socket) do
    {:noreply, assign(socket, :val, Count.incr())}
  end

  def handle_event("dec", _, socket) do
    {:noreply, assign(socket, :val, Count.decr())}
  end

  def handle_info({:count, count}, socket) do
    {:noreply, assign(socket, val: count)}
  end

+ def handle_info(
+       %{event: "presence_diff", payload: %{joins: joins, leaves: leaves}},
+       %{assigns: %{present: present}} = socket
+    ) do
+   new_present = present + map_size(joins) - map_size(leaves)
+
+   {:noreply, assign(socket, :present, new_present)}
+ end

  def render(assigns) do
    ~L"""
    <div>
      <h1>The count is: <%= @val %></h1>
      <button phx-click="dec">-</button>
      <button phx-click="inc">+</button>
+     <h1>Current users: <%= @present %></h1>
    </div>
    """
  end
end
```

Now, as you open and close your incognito windows you will get a count of how
many are running.

<br /><br /><br />

## Notes and help

### Problems with dependencies

If the app hangs and throws this error:

```
[error] an exception was raised:
    ** (FunctionClauseError) no function clause matching in Phoenix.LiveView.Channel.start_link/1
        (phoenix_live_view 0.12.1) lib/phoenix_live_view/channel.ex:12: Phoenix.LiveView.Channel.start_link({LivetestWeb.Endpoint, {#PID<0.643.0>, #Reference<0.4273921409.1426587651.156349>}})

```

Modifying your mix.deps from:

```elixir
 defp deps do
    [
      {:phoenix, "~> 1.5.1"},
      {:phoenix_live_view, "~> 0.12.1"},
      ...
    ]
  end
```

to this:

```elixir
 defp deps do
    [
      {:phoenix, "~> 1.5.3"},
      {:phoenix_live_view, "~> 0.13.0"},
      ...
    ]
  end
```

Should fix the problem.

---

## Credits & Thanks! 🙌

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
3. **_Broadcast updates_** to all connected clients.
   So when the counter is incremented/decremented in one client,
   all others see the update.
   This is the true power and "wow moment" of LiveView!

<br />

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

<br />

If you haven't watched Chris' Keynote from ElixirConf EU 2019,
we _highly_ recommend watching it:
[youtu.be/8xJzHq8ru0M](https://youtu.be/8xJzHq8ru0M)

[![chris-keynote-elixirconf-eu-2019](https://user-images.githubusercontent.com/194400/59027797-dd6ac000-8851-11e9-82b9-b53c48f7e1b9.png)](https://youtu.be/8xJzHq8ru0M)

Also read the original announcement for LiveView to understand the hype! <br />:
https://dockyard.com/blog/2018/12/12/phoenix-liveview-interactive-real-time-apps-no-need-to-write-javascript

<br />

Sophie DeBenedetto's ElixirConf 2019 talk "Beyond LiveView:
Building Real-Time features with Phoenix LiveView, PubSub,
Presence and Channels (Hooks) is worth watching:
[youtu.be/AbNAuOQ8wBE](https://youtu.be/AbNAuOQ8wBE)

[![Sophie-DeBenedetto-elixir-conf-2019-talk](https://user-images.githubusercontent.com/194400/76205486-3a850f00-61f2-11ea-9503-aec19ee666b5.png)](https://youtu.be/AbNAuOQ8wBE)

Related blog post: https://elixirschool.com/blog/live-view-live-component/
