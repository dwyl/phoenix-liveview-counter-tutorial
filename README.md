<div align="center">

# Phoenix LiveView Counter Tutorial

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/dwyl/phoenix-liveview-counter-tutorial/ci.yml?label=build&style=flat-square&branch=main)
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/phoenix-liveview-counter-tutorial/master.svg?style=flat-square)](https://codecov.io/github/dwyl/phoenix-liveview-counter-tutorial?branch=master)
[![Hex.pm](https://img.shields.io/hexpm/v/phoenix_live_view?color=brightgreen&style=flat-square)](https://hex.pm/packages/phoenix_live_view)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/dwyl/phoenix-liveview-counter-tutorial/issues)
[![HitCount](https://hits.dwyl.com/dwyl/phoenix-liveview-counter-tutorial.svg)](https://hits.dwyl.io/dwyl/phoenix-liveview-counter-tutorial)

**Build your _first_ App** using **Phoenix LiveView** 🥇<br />
and **_understand_** all the concepts in **10 minutes** or _less_! 🚀

<div>
  <a href="https://livecount.fly.dev/">
    <img src="https://github.com/dwyl/phoenix-liveview-counter-tutorial/assets/194400/e61cf511-d1d8-4236-83b2-f9f45e06e710">
  </a>
</div>

</div>
<br />

- [Phoenix LiveView Counter Tutorial](#phoenix-liveview-counter-tutorial)
- [Why? 🤷‍♀️](#why-️)
- [What? 💭](#what-)
  - [`LiveView`?](#liveview)
- [Who? 👤](#who-)
  - [Please Star! ⭐](#please-star-)
  - [Prerequisites: What you Need _Before_ You Start 📝](#prerequisites-what-you-need-before-you-start-)
- [How? 💻](#how-)
  - [Step 0: Run the _Finished_ Counter App on your `localhost` 🏃‍](#step-0-run-the-finished-counter-app-on-your-localhost-)
    - [Clone the Repository](#clone-the-repository)
    - [_Download_ the Dependencies](#download-the-dependencies)
    - [_Run_ the App](#run-the-app)
  - [Step 1: Create the App 🆕](#step-1-create-the-app-)
    - [Checkpoint 1: _Run_ the _Tests_!](#checkpoint-1-run-the-tests)
    - [Checkpoint 1b: _Run_ the New Phoenix App!](#checkpoint-1b-run-the-new-phoenix-app)
  - [Step 2: Create the `counter.ex` File](#step-2-create-the-counterex-file)
    - [_Explanation_ of the Code](#explanation-of-the-code)
  - [Step 3: Create the `live` Route in `router.ex`](#step-3-create-the-live-route-in-routerex)
    - [3.1 Update the Failing Test Assertion](#31-update-the-failing-test-assertion)
    - [Checkpoint: Run Counter App!](#checkpoint-run-counter-app)
    - [Recap: Working Counter _Without_ Writing `JavaScript`!](#recap-working-counter-without-writing-javascript)
  - [Step 4: _Share_ State Between Clients!](#step-4-share-state-between-clients)
    - [Code Explanation](#code-explanation)
    - [Checkpoint: Run It!](#checkpoint-run-it)
  - [Congratulations! 🎉](#congratulations-)
  - [Tests! 🧪](#tests-)
    - [Add `excoveralls` to Check/Track Coverage](#add-excoveralls-to-checktrack-coverage)
    - [Create a `coveralls.json` File](#create-a-coverallsjson-file)
    - [`DELETE` Unused Files](#delete-unused-files)
    - [Add More Tests!](#add-more-tests)
  - [Bonus Level: Use a `LiveView Component` (Optional)](#bonus-level-use-a-liveview-component-optional)
    - [Create a `LiveView Component`](#create-a-liveview-component)
  - [Moving state out of the `LiveView`](#moving-state-out-of-the-liveview)
    - [Update the Tests for `GenServer` State](#update-the-tests-for-genserver-state)
  - [How many \`people\`\` are using the Counter?](#how-many-people-are-using-the-counter)
  - [More Tests!](#more-tests)
- [_Done_! 🏁](#done-)
- [What's _Next_?](#whats-next)
- [_Feedback_ 💬 🙏](#feedback--)
- [Credits + Thanks! 🙌](#credits--thanks-)
  - [`Phoenix LiveView` for Web Developers Who Don't know `Elixir`](#phoenix-liveview-for-web-developers-who-dont-know-elixir)
  
<br />

# Why? 🤷‍♀️

There are several apps around the Internet 
that use `Phoenix LiveView`
but _none_ include **step-by-step instructions**
a _complete_ beginner can follow ... 😕 <br />
_This_ is the **_complete beginner's_ tutorial**
we _wish_ we had when **learning `LiveView`**
and the one _you_ have been searching for! 🎉

# What? 💭

A **_complete beginners_ tutorial** for building
the most basic possible `Phoenix LiveView` App
with **no prior experience** necessary.

## `LiveView`?

Phoenix `LiveView` allows you to build **rich interactive web apps**
with **realtime reactive UI** (_no page refresh when data updates_)
**without** writing **`JavaScript`**!
This enables building **_incredible_ interactive experiences**
with **_considerably_ less code**.

`LiveView` pages load instantly because they are rendered on the Server
and they require far less bandwidth than a similar
React, Vue.js, Angular, etc. because only the _bare minimum_
is loaded on the client for the page to work.

For a sneak peak of what is possible to build with `LiveView`,
watch [@chrismccord](https://github.com/chrismccord)'s **`LiveBeats`** intro:

https://user-images.githubusercontent.com/576796/162234098-31b580fe-e424-47e6-b01d-cd2cfcf823a9.mp4

> **Tip**: Enable the **_sound_**. It's a collaborative music listening experience. 🎶
> Try the `LiveBeats` Demo: 
> [livebeats.fly.dev](https://livebeats.fly.dev/) 
> 😍 🤯 🙏

<br />

# Who? 👤

This tutorial is aimed at `people` who have
never built _anything_ in `Phoenix` or `LiveView`.
You can _speed-run_ it in **10 minutes**
if you're already familiar with `Phoenix` or `Rails`.

If you get stuck at any point
while following the tutorial
or you have any feedback/questions,
_please_
[open an issue on `GitHub`!](https://github.com/dwyl/phoenix-liveview-counter-tutorial/issues)

If you don't have a lot of time or bandwidth to watch videos,
this tutorial will be the _fastest_ way to learn `LiveView`.

## Please Star! ⭐

This is the tutorial we _wish_ we'd had when we first started using `LiveView` ... <br />
If you find it useful, please give it a star ⭐ it on `Github` 
so that other `people` will discover it. 

Thanks! 🙏 

<br />

## Prerequisites: What you Need _Before_ You Start 📝

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
Elixir 1.15.4 (compiled with Erlang/OTP 26)
```

This informs us we are using `Elixir version 1.15.4`
which is the _latest_ version at the time of writing.
Some of the more advanced features of Phoenix 1.7 during compilation time require elixir 
`1.14` although the code will work in previous versions.

<br />

**b.** **`Phoenix` installed** on your computer.
see: [hexdocs.pm/phoenix/**installation**](https://hexdocs.pm/phoenix/installation.html)

If you run the following command in your terminal:

```sh
mix phx.new -v
```

You should see something similar to the following:

```sh
Phoenix installer v1.7.7
```

If you have an earlier version,
definitely upgrade to get the _latest_ features! <br />
If you have a _later_ version of `Phoenix``,
and you get _stuck_ at any point,
_please_
[open an issue on GitHub!](https://github.com/dwyl/phoenix-liveview-counter-tutorial/issues)
We are here to help!

<br />

**c.** Basic familiarity with **`Elixir` syntax**
is _recommended_ but _not essential_; <br />
If you know _any_ programming language,
you can pick it up as you go and
[ask questions](https://github.com/dwyl/phoenix-liveview-counter-tutorial/issues)
if you get stuck!
See: 
[https://github.com/dwyl/**learn-elixir**](https://github.com/dwyl/learn-elixir#what)

<br />

# How? 💻

This tutorial takes you through all the steps
to build and test a counter in Phoenix LiveView. <br />
We always
["begin with the end in mind"](https://en.wikipedia.org/wiki/The_7_Habits_of_Highly_Effective_People#2_-_Begin_with_the_end_in_mind)
so we recommend running the _finished_ app
on your machine _before_ writing any code.

> 💡 You can also try the version deployed to Heroku:
> https://live-view-counter.herokuapp.com

<br />

## Step 0: Run the _Finished_ Counter App on your `localhost` 🏃‍

Before you attempt to _build_ the counter,
we suggest that you clone and _run_
the complete app on your `localhost`. <br />
That way you _know_ it's working
without much effort/time expended.

### Clone the Repository

On your `localhost`,
run the following command to clone the repo
and change into the directory:

```sh
git clone https://github.com/dwyl/phoenix-liveview-counter-tutorial.git
cd phoenix-liveview-counter-tutorial
```

### _Download_ the Dependencies

Install the dependencies by running the command:

```sh
mix setup
```

It will take a few seconds to download the dependencies
depending on the speed of your internet connection;
be
[patient](https://user-images.githubusercontent.com/194400/76169853-58139380-6174-11ea-8e03-4011815758d0.png).
😉

### _Run_ the App

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

## Step 1: Create the App 🆕

In your terminal, 
run the following `mix` command
to generate the new Phoenix app:

```sh
mix phx.new counter --no-ecto --no-mailer --no-dashboard --no-gettext
```

The flags after the `counter` (name of the project),
tell `mix phx.new` generator:
+ `--no-ecto` - don't create a Database - we aren't storing any data
+ `--no-mailer`- this project doesn't send `email`
+ `--no-dashboard` - we don't need a status `dashboard`
+ `--no-gettext` - no translation required
  
This keeps our counter as simple as possible.
We can always add these features _later_ if needed. 

> **Note**: Since `Phoenix` `1.6` the `--live` flag
> is no longer required when creating a `LiveView` app.
> `LiveView` is included by default in all new `Phoenix` Apps.
> Older tutorials may still include the flag,
> everything is _much_ easier now. 😉

When you see the following prompt:

```sh
Fetch and install dependencies? [Yn]
```

Type `Y` followed by the `[Enter]` key.
That will download all the necessary dependencies.

<br />

### Checkpoint 1: _Run_ the _Tests_!

In your terminal, 
go into the newly created app folder:

```sh
cd counter
```

And then run the following `mix` command:

```sh
mix test
```

This will compile the `Phoenix` app 
and will take some time. ⏳ <br />
You should see output similar to this:

```sh
Compiling 13 files (.ex)
Generated counter app
.....
Finished in 0.00 seconds (0.00s async, 0.00s sync)
5 tests, 0 failures

Randomized with seed 29485
```

Tests all pass. ✅

This is _expected_ with a `new` app.
It's a good way to confirm everything is working.

<br />

### Checkpoint 1b: _Run_ the New Phoenix App!

Run the server by executing this command:

```sh
mix phx.server
```

Visit
[`localhost:4000`](http://localhost:4000)
in your web browser.

You should see something similar to the following:

![welcome-to-phoenix](https://github.com/dwyl/phoenix-liveview-counter-tutorial/assets/194400/fa8a37e6-9b4d-4f36-b156-33a2e16030ff)

<br />

## Step 2: Create the `counter.ex` File

Create a new file with the path:
`lib/counter_web/live/counter.ex`

And add the following code to it:

```elixir
defmodule CounterWeb.Counter do
  use CounterWeb, :live_view

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
    ~H"""
    <div>
    <h1 class="text-4xl font-bold text-center"> The count is: <%= @val %> </h1>

    <p class="text-center">
     <.button phx-click="dec">-</.button>
     <.button phx-click="inc">+</.button>
     </p>
     </div>
    """
  end
end
```

### _Explanation_ of the Code

The first line instructs Phoenix to use the 
[`Phoenix.LiveView`](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html)
[behaviour](https://elixirschool.com/en/lessons/advanced/behaviours).
This just means that we need to implement certain functions
for our `LiveView` to work.

The first function is `mount/3` which,
as it's name suggests, 
_mounts_ the module
with the `_params`, `_session` and `socket` arguments:

```elixir
def mount(_params, _session, socket) do
  {:ok, assign(socket, :val, 0) }
end
```

In our case we are _ignoring_ 
the `_params` and `_session` arguments,
hence the prepended underscore.
If we were using sessions,
we would need to check the `session` variable,
but in this simple `counter` example, we just ignore it.

`mount/3` returns a
[tuple](https://elixir-lang.org/getting-started/basic-types.html#tuples):
`{:ok, assign(socket, :val, 0)}`
which uses the
[`assign/3`](https://hexdocs.pm/phoenix/Phoenix.Socket.html#assign/3)
function to assign the `:val` key a value of `0` on the `socket`.
That just means the socket will now have a `:val`
which is initialized to `0`.

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
> see: 
> [elixirschool.com/functions/#named-functions](https://elixirschool.com/en/lessons/basics/functions/#named-functions)

_Finally_ the _forth_ function `render/1`
receives the `assigns` argument which contains the `:val` state
and _renders_ the template using the `@val` template variable.

The `render/1` function renders the template included in the function.
The `~H"""` syntax just means
"_treat this multiline string as a LiveView template_"
The `~H` 
[`sigil``](https://elixir-lang.org/getting-started/sigils.html)
is a macro included when the `use Phoenix.LiveView` is invoked
at the top of the file.

`LiveView` will invoke the `mount/3` function
and will pass the result of `mount/3` to `render/1` behind the scenes.

Each time an update happens (e.g: `handle_event/3`)
the `render/1` function will be executed
and updated data (_in our case the `:val` count_)
is sent to the client.

> 🏁 At the end of Step 2 you should have a file similar to:
> [`lib/counter_web/live/counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/6aeb1b53b4c22b14258772e65ac05fd172a9f961/lib/counter_web/live/counter.ex)

<br />

## Step 3: Create the `live` Route in `router.ex`

Now that we have created our `LiveView` handler functions in Step 2,
it's time to tell `Phoenix` how to _find_ it.

Open the
`lib/counter_web/router.ex`
file and locate the block of code
that starts with `scope "/", CounterWeb do`:

```elixir
scope "/", CounterWeb do
  pipe_through :browser

  get "/", PageController, :index
end
```

Replace the line `get "/", PageController, :index`
with `live("/", Counter)`.
So you end up with:

```elixir
scope "/", CounterWeb do
  pipe_through :browser

  live("/", Counter)
end
```

<br />

### 3.1 Update the Failing Test Assertion

Since we have replaced the
`get "/", PageController, :index` route in `router.ex`
in the previous step, the test in
`test/counter_web/controllers/page_controller_test.exs`
will now _fail_:

```sh
Compiling 6 files (.ex)
Generated counter app
....

  1) test GET / (CounterWeb.PageControllerTest)
     test/counter_web/controllers/page_controller_test.exs:4
     Assertion with =~ failed
     code:  assert html_response(conn, 200) =~ "Peace of mind from prototype to production"
     left:  "<!DOCTYPE html>\n<html lang=\"en\">\n  <head>\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <meta name=\"csrf-token\" content=\"EFt5PABkPz1nPg5FMAoaDSA6BCFtBCMO_4JmNTx_2vO6i3qxXjETTpal\">\n    <title data-suffix=\" · Phoenix Framework\">\nLiveViewCounter\n     · Phoenix Framework</title>\n    <link phx-track-static rel=\"stylesheet\" href=\"/assets/app.css\">\n    <script defer phx-track-static type=\"text/javascript\" src=\"/assets/app.js\">\n    </script>\n  </head>\n  <body class=\"bg-white antialiased\">\n<div data-phx-main=\"true\" data-phx-session=\"SFMyNTY.g2gDaA\" id=\"phx-Fyi3ICCa7vPqDADE\"><header class=\"px-4 sm:px-6 lg:px-8\">\n  <div class=\"flex items-center justify-between border-b border-zinc-100 py-3\">\n    <div class=\"flex items-center gap-4\">\n      <a href=\"/\">\n        <svg viewBox=\"0 0 71 48\" class=\"h-6\" aria-hidden=\"true\">\n          <path d=\"etc." fill=\"#FD4F00\"></path>\n        </svg>\n      </a>\n      <p class=\"rounded-full bg-brand/5 px-2 text-[0.8125rem] font-medium leading-6 text-brand\">\n        v1.7\n      </p>\n    </div>\n    <div class=\"flex items-center gap-4\">\n      <a href=\"https://twitter.com/elixirphoenix\" class=\"text-[0.8125rem] font-semibold leading-6 text-zinc-900 hover:text-zinc-700\">\n        @elixirphoenix\n      </a>\n      <a href=\"https://github.com/phoenixframework/phoenix\" class=\"text-[0.8125rem] font-semibold leading-6 text-zinc-900 hover:text-zinc-700\">\n        GitHub\n      </a>\n      <a href=\"https://hexdocs.pm/phoenix/overview.html\" class=\"rounded-lg bg-zinc-100 px-2 py-1 text-[0.8125rem] font-semibold leading-6 text-zinc-900 hover:bg-zinc-200/80 active:text-zinc-900/70\">\n        Get Started <span aria-hidden=\"true\">&rarr;</span>\n      </a>\n    </div>\n  </div>\n</header>\n<main class=\"px-4 py-20 sm:px-6 lg:px-8\">\n </p>\n  \n</div>\n<div>\n<h1 class=\"text-4xl font-bold text-center\"> The count is: 0 </h1>\n\n<p class=\"text-center\">\n <button class=\"phx-submit-loading:opacity-75 rounded-lg bg-zinc-900 hover:bg-zinc-700 py-2 px-3 text-sm font-semibold leading-6 text-white active:text-white/80 \" phx-click=\"dec\">\n  -\n</button>\n <button class=\"phx-submit-loading:opacity-75 rounded-lg bg-zinc-900 hover:bg-zinc-700 py-2 px-3 text-sm font-semibold leading-6 text-white active:text-white/80 \" phx-click=\"inc\">\n  +\n</button>\n </p>\n </div>\n  </div>\n</main></div>\n  </body>\n</html>"
     right: "Peace of mind from prototype to production"
     stacktrace:
       test/counter_web/controllers/page_controller_test.exs:6: (test)


Finished in 0.1 seconds (0.06s async, 0.09s sync)
5 tests, 1 failure
```

This just tells us that the test is looking for the string
`"Peace of mind from prototype to production"` 
in the page and did not find it.

To fix the broken test, open the
`test/counter_web/controllers/page_controller_test.exs`
file and locate the line:

```elixir
assert html_response(conn, 200) =~ "Peace of mind from prototype to production"
```

Update the string from `"Peace of mind from prototype to production"`
to something we _know_ is present on the page,
e.g:
`"The count is"`

> 🏁 The `page_controller_test.exs.exs` file should now look like this:
> [`test/counter_web/controllers/page_controller_test.exs#L6`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/73e6f79a5fb75c36d3e7bb5a894b7f515ab83d40/test/counter_web/controllers/page_controller_test.exs)

Confirm the tests pass again by running:

```sh
mix test
```

You should see output similar to:

```
.....
Finished in 0.08 seconds (0.03s async, 0.05s sync)
5 tests, 0 failures

Randomized with seed 268653
```

<br />

### Checkpoint: Run Counter App!

Now that all the code for the `counter.ex` is written,
run the Phoenix app with the following command:

```
mix phx.server
```

Vist
[`localhost:4000`](http://localhost:4000)
in your web browser.

You should expect to see a fully functioning `LiveView` counter:

![liveview-counter-1.7.7](https://github.com/dwyl/phoenix-liveview-counter-tutorial/assets/194400/abb5bb09-de59-4631-b5a9-48f9de28ef75)

<br />

### Recap: Working Counter _Without_ Writing `JavaScript`!

Once the initial installation
and configuration of `LiveView` was complete,
the creation of the actual counter was _remarkably_ simple.
We created a _single_ new file
[`lib/counter_web/live/counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/6aeb1b53b4c22b14258772e65ac05fd172a9f961/lib/counter_web/live/counter.ex)
that contains all the code required to
initialise, render and update the counter.
Then we set the `live "/", Counter` route
to invoke the `Counter` module in `router.ex`.

In total our `counter`` App is **25 lines** of (relevant) code. 🤯

<br />

One important thing to note is that
the counter only maintains state for a _single_ web browser.
Try opening a second browser window (_e.g: in "incognito mode"_)
and notice how the counter only updates in one window at a time:

![phoenix-liveview-counter-two-windows-independent-count](https://github.com/dwyl/phoenix-liveview-counter-tutorial/assets/194400/7f8d0742-a295-4507-b7a2-fa2a281a32cb)

If we want to _share_ the `counter` state between multiple clients,
we need to add a bit more code.

<br />

## Step 4: _Share_ State Between Clients!

One of the biggest selling points
of using `Phoenix` to build web apps
is the built-in support for 
[`WebSockets`](https://developer.mozilla.org/en-US/docs/Web/API/WebSocket)
in the form of 
[`Phoenix Channels`](https://hexdocs.pm/phoenix/channels.html).
`Channels` allow us to
_effortlessly_ sync data between
clients and servers with _minimal_ overhead;
they are one of `Elixir` (`Erlang/OTP`) superpowers! 

We can share the `counter` state
between multiple clients by updating the
`counter.ex`
file with the following code:

```elixir
defmodule CounterWeb.Counter do
  use CounterWeb, :live_view

  @topic "live"

  def mount(_session, _params, socket) do
    CounterWeb.Endpoint.subscribe(@topic) # subscribe to the channel
    {:ok, assign(socket, :val, 0)}
  end

  def handle_event("inc", _value, socket) do
    new_state = update(socket, :val, &(&1 + 1))
    CounterWeb.Endpoint.broadcast_from(self(), @topic, "inc", new_state.assigns)
    {:noreply, new_state}
  end

  def handle_event("dec", _, socket) do
    new_state = update(socket, :val, &(&1 - 1))
    CounterWeb.Endpoint.broadcast_from(self(), @topic, "dec", new_state.assigns)
    {:noreply, new_state}
  end

  def handle_info(msg, socket) do
    {:noreply, assign(socket, val: msg.payload.val)}
  end

  def render(assigns) do
    ~H"""
    <div class="text-center">
      <h1 class="text-4xl font-bold text-center"> Counter: <%= @val %> </h1>
      <.button phx-click="dec" class="w-20 bg-red-500 hover:bg-red-600">-</.button>
      <.button phx-click="inc" class="w-20 bg-green-500 hover:bg-green-600">+</.button>
    </div>
    """
  end
end
```

### Code Explanation

The first change is on
[Line 4](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/664228ac564a79a0dd92d06857622c1ba22cda71/lib/counter_web/live/counter.ex#L4)
`@topic "live"` defines a module attribute
(_think of it as a global constant_),
that lets us to reference `@topic` 
anywhere in the file.

The second change is on
[Line 7](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/664228ac564a79a0dd92d06857622c1ba22cda71/lib/counter_web/live/counter.exL7)
where the
[`mount/3`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/d3cddb14dff911a377d0e41b916cfe57b0557606/lib/counter_web/live/counter.ex#L6)
function now creates a subscription to the `@topic``:

```elixir
CounterWeb.Endpoint.subscribe(@topic) # subscribe to the channel topic
```

Each client connected to the App
subscribes to the `@topic`
so when the count is updated on any of the clients,
all the other clients see the same value.

Next we update the first
[`handle_event/3`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/d3cddb14dff911a377d0e41b916cfe57b0557606/lib/counter_web/live/counter.ex#L11)
function which handles the `"inc"` event:

```elixir
def handle_event("inc", _msg, socket) do
  new_state = update(socket, :val, &(&1 + 1))
  CounterWeb.Endpoint.broadcast_from(self(), @topic, "inc", new_state.assigns)
  {:noreply, new_state}
end
```

Assign the result of the `update` invocation to `new_state`
so that we can use it on the next two lines.
Invoking
`CounterWeb.Endpoint.broadcast_from`
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
    live_view_module: CounterWeb.Counter,
    val: 1
  },
  changed: %{val: true},
  endpoint: CounterWeb.Endpoint,
  id: "phx-Ffq41_T8jTC_3gED",
  parent_pid: nil,
  view: CounterWeb.Counter,
  ...
}
```

The `new_state.assigns` is a Map
that includes the key `val`
where the value is `1`
(_after we clicked on the increment button_).

The _fourth_ update is to the
`"dec"` version of
[`handle_event/3`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/d3cddb14dff911a377d0e41b916cfe57b0557606/lib/counter_web/live/counter.ex#L17)

```elixir
def handle_event("dec", _msg, socket) do
  new_state = update(socket, :val, &(&1 - 1))
  CounterWeb.Endpoint.broadcast_from(self(), @topic, "dec", new_state.assigns)
  {:noreply, new_state}
end
```

The only difference from the `"inc"`
version is the `&(&1 - 1)`
and "dec" in the `broadcast_from`.

The _final_ change is the implementation of the `handle_info/2` function:

```elixir
def handle_info(msg, socket) do
  {:noreply, assign(socket, val: msg.payload.val)}
end
```

[`handle_info/2`](https://hexdocs.pm/phoenix/Phoenix.Channel.html#c:handle_info/2)
handles `Elixir` process messages
where `msg` is the received message
and `socket` is the `Phoenix.Socket`. <br />
The line `{:noreply, assign(socket, val: msg.payload.val)}`
just means "don't send this message to the socket again"
(_which would cause a recursive loop of updates_).

_Finally_ we modified the `HTML` inside the `render/1` function
to be a bit more visually appealing.

> 🏁 At the end of Step 6 the file looks like:
> [`lib/counter_web/live/counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/664228ac564a79a0dd92d06857622c1ba22cda71/lib/counter_web/live/counter.ex)

<br />

### Checkpoint: Run It!

Now that
[`counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/664228ac564a79a0dd92d06857622c1ba22cda71/lib/counter_web/live/counter.ex#L4)
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

![phoenix-liveview-counter-four-windows](https://github.com/dwyl/phoenix-liveview-counter-tutorial/assets/194400/f25db87c-d8b3-40db-aee6-631c6fadd8da)


<br />

## Congratulations! 🎉

You just built a real-time counter
that seamlessly updates all connected clients
using `Phoenix LiveView`
in less than **40 lines** of code!

<br />

## Tests! 🧪

`before` we get carried away celebrating that we've _finished_ the counter,
Let's make sure that all the functionality, however basic, is fully tested.

### Add `excoveralls` to Check/Track Coverage

Open your `mix.exs` file and locate the `deps` list.
Add the following line to the list:

```elixir
# Track test coverage: github.com/parroty/excoveralls
{:excoveralls, "~> 0.16.0", only: [:test, :dev]},
```

e.g: 
[`mix.exs#L58`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/664228ac564a79a0dd92d06857622c1ba22cda71/mix.exs#L58)

Then, still in the `mix.exs` file, locate the `project` definition,
and replace:

```elixir
deps: deps()
```

With the following lines:

```elixir
deps: deps(),
test_coverage: [tool: ExCoveralls],
preferred_cli_env: [
  c: :test,
  coveralls: :test,
  "coveralls.detail": :test,
  "coveralls.json": :test,
  "coveralls.post": :test,
  "coveralls.html": :test,
  t: :test
]
```

e.g:
[`mix.exs#L13-L22`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/664228ac564a79a0dd92d06857622c1ba22cda71/mix.exs#L13-L22)

Finally in the `aliases` section of `mix.exs`,
add the following lines:

```elixir
c: ["coveralls.html"],
s: ["phx.server"],
t: ["test"]
```

The `mix c` alias is the one we care about, we're going to use it immediately.
The other two `mix s` and `mix t` are convenient shortcuts too. 
Hopefully you can infer what they do. 👌


With the the `mix.exs` file updated, 
run the following commands in your terminal:

```sh
mix deps.get
mix c
```

That will download the `excoveralls` dependency
and execute the tests with coverage tracking.

You should see output similar to the following:

```sh
Randomized with seed 468341
----------------
COV    FILE                                        LINES RELEVANT   MISSED
100.0% lib/counter.ex                                  9        0        0
 75.0% lib/counter/application.ex                     34        4        1
100.0% lib/counter_web.ex                            111        2        0
 15.9% lib/counter_web/components/core_componen      661      151      127
100.0% lib/counter_web/components/layouts.ex           5        0        0
100.0% lib/counter_web/controllers/error_html.e       19        1        0
100.0% lib/counter_web/controllers/error_json.e       15        1        0
  0.0% lib/counter_web/controllers/page_control        9        1        1
100.0% lib/counter_web/controllers/page_html.ex        5        0        0
100.0% lib/counter_web/endpoint.ex                    46        0        0
 33.3% lib/counter_web/live/counter.ex                32       12        8
100.0% lib/counter_web/live/counter_component.e       17        2        0
100.0% lib/counter_web/router.ex                      18        2        0
 80.0% lib/counter_web/telemetry.ex                   69        5        1
[TOTAL]  23.8%
----------------
Generating report...
Saved to: cover/
FAILED: Expected minimum coverage of 100%, got 23.8%.
```

This tells us that only `23.8%` of the code in the project is covered by tests. 😕
Let's fix that!

### Create a `coveralls.json` File

In the root of the project, 
create a file called `coveralls.json`
and add the following code to it:


```json
{
  "coverage_options": {
    "minimum_coverage": 100
  },
  "skip_files": [
    "lib/counter/application.ex",
    "lib/counter_web.ex",
    "lib/counter_web/channels/user_socket.ex",
    "lib/counter_web/telemetry.ex",
    "lib/counter_web/views/error_helpers.ex",
    "lib/counter_web/router.ex",
    "lib/counter_web/live/page_live.ex",
    "lib/counter_web/components/core_components.ex",
    "lib/counter_web/controllers/error_json.ex",
    "lib/counter_web/controllers/error_html.ex",
    "test/"
  ]
}
```

This file and the `skip_files` list specifically, 
tells `excoveralls` to ignore boilerplate `Phoenix` files
we cannot test. 

If you re-run `mix c` now you should see something similar to the following:

```sh
Randomized with seed 572431
----------------
COV    FILE                                        LINES RELEVANT   MISSED
100.0% lib/counter.ex                                  9        0        0
100.0% lib/counter_web/components/layouts.ex           5        0        0
  0.0% lib/counter_web/controllers/page_control        9        1        1
100.0% lib/counter_web/controllers/page_html.ex        5        0        0
100.0% lib/counter_web/endpoint.ex                    46        0        0
 33.3% lib/counter_web/live/counter.ex                32       12        8
[TOTAL]  40.0%
----------------
Generating report...
Saved to: cover/
FAILED: Expected minimum coverage of 100%, got 40%.
```

This is already much better. 
There are only 2 files we need to focus on.
Let's start by tidying up the unused files.

### `DELETE` Unused Files

Given that this `counter` App doesn't use any "controllers",
we can simply `DELETE` the 
`lib/counter_web/controllers/page_controller.ex` file.

```sh
git rm lib/counter_web/controllers/page_controller.ex
```


Rename the `test/counter_web/controllers/page_controller_test.exs`
to: `test/counter_web/live/counter_test.exs`

Update the code in the `test/counter_web/live/counter_test.exs` to:

```elixir
defmodule CounterWeb.CounterTest do
  use CounterWeb.ConnCase
  import Phoenix.LiveViewTest

  test "connected mount", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/")
    assert html =~ "Counter: 0"
  end
end
```

Re-run the tests:

```sh
mix c
```

You should see:

```sh
Finished in 0.1 seconds (0.04s async, 0.07s sync)
6 tests, 0 failures

Randomized with seed 603239
----------------
COV    FILE                                        LINES RELEVANT   MISSED
100.0% lib/counter.ex                                  9        0        0
100.0% lib/counter_web/components/layouts.ex           5        0        0
100.0% lib/counter_web/controllers/page_html.ex        5        0        0
100.0% lib/counter_web/endpoint.ex                    46        0        0
 33.3% lib/counter_web/live/counter.ex                32       12        8
[TOTAL]  42.9%
----------------
Generating report...
Saved to: cover/
FAILED: Expected minimum coverage of 100%, got 42.9%.
```

Open the coverage `HTML` file:
```sh
open cover/excoveralls.html
```

You should see:

<img width="1180" alt="image" src="https://github.com/dwyl/phoenix-liveview-counter-tutorial/assets/194400/3efbe3ba-d3d4-47a7-88d5-82f0e8cb2712">

This shows us which functions/lines are _not_ being covered by our _existing_ tests.

<br />

### Add More Tests!

Open the `test/counter_web/live/counter_test.exs`
and add the following tests:

```elixir
test "Increment", %{conn: conn} do
  {:ok, view, _html} = live(conn, "/")
  assert render_click(view, :inc) =~ "Counter: 1"
end

test "Decrement", %{conn: conn} do
  {:ok, view, _html} = live(conn, "/")
  assert render_click(view, :dec) =~ "Counter: -1"
end

test "handle_info/2 broadcast message", %{conn: conn} do
  {:ok, view, _html} = live(conn, "/")
  {:ok, view2, _html} = live(conn, "/")

  assert render_click(view, :inc) =~ "Counter: 1"
  assert render_click(view2, :inc) =~ "Counter: 2"
end
```

Once you've saved the file, 
re-run the tests: `mix c`
You should see:

```sh
........
Finished in 0.1 seconds (0.03s async, 0.09s sync)
8 tests, 0 failures

Randomized with seed 552859
----------------
COV    FILE                                        LINES RELEVANT   MISSED
100.0% lib/counter.ex                                  9        0        0
100.0% lib/counter_web/components/layouts.ex           5        0        0
100.0% lib/counter_web/controllers/page_html.ex        5        0        0
100.0% lib/counter_web/endpoint.ex                    46        0        0
100.0% lib/counter_web/live/counter.ex                32       12        0
[TOTAL] 100.0%
----------------
```

**Done**. ✅

## Bonus Level: Use a `LiveView Component` (Optional)

At present the
[`render/1`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/664228ac564a79a0dd92d06857622c1ba22cda71/lib/counter_web/live/counter.ex#L27-L35)
function in
[`counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/664228ac564a79a0dd92d06857622c1ba22cda71/lib/counter_web/live/counter.ex)
has an inline template:

```elixir
def render(assigns) do
  ~H"""
  <div class="text-center">
    <h1 class="text-4xl font-bold text-center"> Counter: <%= @val %> </h1>
    <.button phx-click="dec" class="text-6xl pb-2 w-20 bg-red-500 hover:bg-red-600">-</.button>
    <.button phx-click="inc" class="text-6xl pb-2 w-20 bg-green-500 hover:bg-green-600">+</.button>
  </div>
  """
```

This is _fine_ when the template is _small_ like in this `counter`,
but in a bigger App 
like our 
[`MPV`](https://github.com/dwyl/mvp/)
it's a good idea to _split_ the template into a _separate_ file
to make it easier to read and maintain.

This is where 
[`Phoenix.LiveComponent`](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveComponent.html)
comes to the rescue!
`LiveComponents`` are a mechanism 
to compartmentalize state, markup, 
and events in `LiveView``.

### Create a `LiveView Component`

Create a new file with the path:
`lib/counter_web/live/counter_component.ex`

And type (or paste) the following code in it: 

```elixir
defmodule CounterComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="text-center">
      <h1 class="text-4xl font-bold text-center"> Counter: <%= @val %> </h1>
      <button phx-click="dec" class="text-6xl pb-2 w-20 bg-red-500 hover:bg-red-600 rounded-lg">
        -
      </button>
      <button phx-click="inc" class="text-6xl pb-2 w-20 bg-green-500 hover:bg-green-600 rounded-lg">
        +
      </button>
    </div>
    """
  end
end
```

Then back in the `counter.ex` file, 
update the `render/1` function to:

```elixir
  def render(assigns) do
    ~H"""
    <.live_component module={CounterComponent} id="counter" val={@val} />
    """
  end
```


> 🏁 Your `counter_component.ex` should look like this:
[`lib/counter_web/live/counter_component.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/92a25e41d52be7bbfd430b92181540806af64baa/lib/counter_web/live/counter_component.ex)

The component's has an identical
[`render/1`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/33e0e47fd379e1314dcba6509d214c9468632c77/lib/counter_web/live/counter.ex#L27-L34)
function to what was in `counter.ex`.
That's the point; we just want it in a separate file
for maintainability.

<br />

Re-run the `counter` App 
using `mix phx.server` 
and confirm everything still works:

![phoenix-liveview-counter-component](https://github.com/dwyl/phoenix-liveview-counter-tutorial/assets/194400/7026e461-003d-4033-a0ea-c80b55494fa5)


The tests all still pass and we have 100% coverage:

```sh
........
Finished in 0.1 seconds (0.03s async, 0.09s sync)
8 tests, 0 failures

Randomized with seed 470293
----------------
COV    FILE                                        LINES RELEVANT   MISSED
100.0% lib/counter.ex                                  9        0        0
100.0% lib/counter_web/components/layouts.ex           5        0        0
100.0% lib/counter_web/controllers/page_html.ex        5        0        0
100.0% lib/counter_web/endpoint.ex                    46        0        0
100.0% lib/counter_web/live/counter.ex                32       12        0
100.0% lib/counter_web/live/counter_component.e       17        2        0
[TOTAL] 100.0%
----------------
```

<br />


## Moving state out of the `LiveView`

With this implementation you may have noticed that when we open a new browser
window the count is always zero. As soon as we click plus or minus it adjusts
and all the views get back in line. This is because the state is replicated
across LiveView instances and coordinated via pub-sub. If the state was big
and complicated this would get wasteful in resources and hard to manage.

Generally it is good practice 
to identify _shared state_ 
and to manage that in
a single location.

The `Elixir` way of managing state is the
[`GenServer`](https://hexdocs.pm/elixir/GenServer.html), 
using `PubSub` to update
the `LiveView` about changes. 
This allows the `LiveViews` 
to focus on specific state, 
separating concerns; 
making the application both more efficient
(hopefully) and easier to reason about and debug.


Create a file with the path:
`lib/counter_web/live/counter_state.ex` 
and add the following:

```elixir
defmodule Counter.Count do
  use GenServer
  alias Phoenix.PubSub
  @name :count_server

  @start_value 0

  # External API (runs in client process)

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

  # Implementation (Runs in GenServer process)

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
    PubSub.broadcast(Counter.PubSub, topic(), {:count, new_count})
    {:reply, new_count, new_count}
  end
end
```

The `GenServer` runs in its own process. 
Other parts of the application invoke
the API in their own process, these calls are forwarded to the `handle_call`
functions in the `GenServer` process where they are processed serially.

We have also moved the `PubSub` publication here as well.

We are also going to need to tell the Application that it now has some business
logic; we do this in the `start/2` function in the
`lib/counter/application.ex` file.

```diff
  def start(_type, _args) do
    children = [
      # Start the App State
+     Counter.Count,
      # Start the Telemetry supervisor
      CounterWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Counter.PubSub},
      # Start the Endpoint (http/https)
      CounterWeb.Endpoint
      # Start a worker by calling: Counter.Worker.start_link(arg)
      # {Counter.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Counter.Supervisor]
    Supervisor.start_link(children, opts)
  end
...
```

Finally, we need make some changes to the `LiveView` itself,
it now has less to do!

```elixir
defmodule CounterWeb.Counter do
  use CounterWeb, :live_view
  alias Counter.Count
  alias Phoenix.PubSub

  @topic Count.topic

  def mount(_params, _session, socket) do
    PubSub.subscribe(Counter.PubSub, @topic)

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
    ~H"""
    <div>
      <h1>The count is: <%= @val %></h1>
      <.button phx-click="dec">-</.button>
      <.button phx-click="inc">+</.button>
    </div>
    """
  end
end
```

The initial state is retrieved from the
shared Application `GenServer`` process 
and the updates are being forwarded there
via its API. 
Finally, the `GenServer`
to all the active `LiveView` clients.

### Update the Tests for `GenServer` State

Given that the `counter.ex` is now using the `GenServer` State,
two of the tests now fail because the count is not correct.

```sh
mix t

Generated counter app
.....

  1) test connected mount (CounterWeb.CounterTest)
     test/counter_web/live/counter_test.exs:6
     Assertion with =~ failed
     code:  assert html =~ "Counter: 0"
     left:  "<html lang=\"en\" class=\"[scrollbar-gutter:stable]\"><head><meta charset=\"utf-8\"/><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"/><meta name=\"csrf-token\" content=\"A2QQMHc0OgsbDl0mUCZdGDoHWhUtMC4CDUIv9XHhtx2p6_iLerkvIbbk\"/><title data-suffix=\" · Phoenix Framework\">\nCounter\n     · Phoenix Framework</title><link phx-track-static=\"phx-track-static\" rel=\"stylesheet\" href=\"/assets/app.css\"/><script defer=\"defer\" phx-track-static=\"phx-track-static\" type=\"text/javascript\" src=\"/assets/app.js\">\n    </script></head><body class=\"bg-white antialiased\"><div data-phx-main=\"data-phx-main\" data-phx-session=\"SFMyNTY.g2gDaAJhBXQAAAAIdwJpZG0AAAAUcGh4LUYzWm01LWgycVNXZW5RREJ3B3Nlc3Npb250AAAAAHcKcGFyZW50X3BpZHcDbmlsdwZyb3V0ZXJ3GEVsaXhpci5Db3VudGVyV2ViLlJvdXRlcncEdmlld3cZRWxpeGlyLkNvdW50ZXJXZWIuQ291bnRlcncIcm9vdF9waWR3A25pbHcJcm9vdF92aWV3dxlFbGl4aXIuQ291bnRlcldlYi5Db3VudGVydwxsaXZlX3Nlc3Npb25oAncHZGVmYXVsdG4IAPP26BwRWHYXbgYA2w20ookBYgABUYA.Zae9BLTboLn6SPPe0qmktsfuru8HX2W4CALIBZNpcqE\" data-phx-static=\"SFMyNTY.g2gDaAJhBXQAAAADdwJpZG0AAAAUcGh4LUYzWm01LWgycVNXZW5RREJ3BWZsYXNodAAAAAB3CmFzc2lnbl9uZXdqbgYA2w20ookBYgABUYA.uooN8p97RRE1JN4tmkVNqC9islv-Np5B8wrewhwLnKc\" id=\"phx-F3Zm5-h2qSWenQDB\"><header class=\"px-4 sm:px-6 lg:px-8\"><div class=\"flex items-center justify-between border-b border-zinc-100 py-3 text-sm\"><div class=\"flex items-center gap-4\"><a href=\"/\"><img src=\"/images/logo.svg\" width=\"36\"/></a><p class=\"bg-brand/5 text-brand rounded-full px-2 font-medium leading-6\">\n        v1.7.7\n      </p></div><div class=\"flex items-center gap-4 font-semibold leading-6 text-zinc-900\"><a href=\"https://github.com/dwyl/phoenix-liveview-counter-tutorial\" class=\"hover:text-zinc-700\">\n        GitHub\n      </a><a href=\"https://github.com/dwyl/phoenix-liveview-counter-tutorial#how-\" class=\"rounded-lg bg-zinc-100 px-2 py-1 hover:bg-zinc-200/80\">\n        Get Started ..."
     right: "Counter: 0"
     stacktrace:
       test/counter_web/live/counter_test.exs:8: (test)



  2) test Increment (CounterWeb.CounterTest)
     test/counter_web/live/counter_test.exs:11
     Assertion with =~ failed
     code:  assert render_click(view, :inc) =~ "Counter: 1"
     left:  "<header class=\"px-4 sm:px-6 lg:px-8\"><div class=\"flex items-center justify-between border-b border-zinc-100 py-3 text-sm\"><div class=\"flex items-center gap-4\"><a href=\"/\"><img src=\"/images/logo.svg\" width=\"36\"/></a><p class=\"bg-brand/5 text-brand rounded-full px-2 font-medium leading-6\">\n        v1.7.7\n      </p></div><div class=\"flex items-center gap-4 font-semibold leading-6 text-zinc-900\"><a href=\"https://github.com/dwyl/phoenix-liveview-counter-tutorial\" class=\"hover:text-zinc-700\">\n        GitHub\n      </a><a href=\"https://github.com/dwyl/phoenix-liveview-counter-tutorial#how-\" class=\"rounded-lg bg-zinc-100 px-2 py-1 hover:bg-zinc-200/80\">\n      etc..."
     right: "Counter: 1"
     stacktrace:
       test/counter_web/live/counter_test.exs:13: (test)

.
Finished in 0.1 seconds (0.02s async, 0.09s sync)
8 tests, 2 failures
```

The test is expecting the _initial_ state to be `0` (zero) each time.
But if we are storing the `count` in the `GenServer`,
it will not be `0`.

We can easily update the tests to check the state 
_before_ incrementing/decrementing it.
Open the 
`test/counter_web/live/counter_test.exs`
file and replace the contents with the following:

```elixir
defmodule CounterWeb.CounterTest do
  use CounterWeb.ConnCase
  import Phoenix.LiveViewTest

  test "Increment", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")
    current = Counter.Count.current()
    assert html =~ "Counter: #{current}"
    assert render_click(view, :inc) =~ "Counter: #{current + 1}"
  end

  test "Decrement", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")
    current = Counter.Count.current()
    assert html =~ "Counter: #{current}"
    assert render_click(view, :dec) =~ "Counter: #{current - 1}"
  end

  test "handle_info/2 Count Update", %{conn: conn} do
    {:ok, view, disconnected_html} = live(conn, "/")
    current = Counter.Count.current()
    assert disconnected_html =~ "Counter: #{current}"
    assert render(view) =~ "Counter: #{current}"
    send(view.pid, {:count, 2})
    assert render(view) =~ "Counter: 2"
  end
end
```

Re-run the tests `mix c` and watch them pass with 100% coverage:

```sh
.......
Finished in 0.1 seconds (0.04s async, 0.09s sync)
7 tests, 0 failures

Randomized with seed 614997
----------------
COV    FILE                                        LINES RELEVANT   MISSED
100.0% lib/counter.ex                                  9        0        0
100.0% lib/counter_web/components/layouts.ex           5        0        0
100.0% lib/counter_web/controllers/page_html.ex        5        0        0
100.0% lib/counter_web/endpoint.ex                    46        0        0
100.0% lib/counter_web/live/counter.ex                31        7        0
100.0% lib/counter_web/live/counter_component.e       17        2        0
100.0% lib/counter_web/live/counter_state.ex          53       12        0
[TOTAL] 100.0%
----------------
```




## How many `people`` are using the Counter?

Phoenix has a very cool feature called
[Presence](https://hexdocs.pm/phoenix/presence.html#content) 
to track how many
people are using our system. (It does a lot more than count users, but this is
a counting app so...)

First of all we need to tell the Application we are going to use Presence.
For this we need to create a `lib/counter/presence.ex` file like this:

```elixir
defmodule Counter.Presence do
  use Phoenix.Presence,
    otp_app: :counter,
    pubsub_server: Counter.PubSub
end
```

and tell the application about it in the 
`lib/counter/application.ex`
file (add it just below the PubSub config):

```diff
  def start(_type, _args) do
    children = [
      # Start the App State
      Counter.Count,
      # Start the Telemetry supervisor
      CounterWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Counter.PubSub},
+     Counter.Presence,
      # Start the Endpoint (http/https)
      CounterWeb.Endpoint
      # Start a worker by calling: Counter.Worker.start_link(arg)
      # {Counter.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Counter.Supervisor]
    Supervisor.start_link(children, opts)
  end

```

The application doesn't need to know any more about the user count (it might,
but not here) so the rest of the code goes into
`lib/counter_web/live/counter.ex`.

1. We subscribe to and participate in the Presence system (we do that in
   `mount`)
2. We handle Presence updates and use the current count, adding joiners and
   subtracting leavers to calculate the current numbers 'present'. We do that
   in a pattern matched `handle_info`.
3. We publish the additional data to the client in `render`

```diff
defmodule CounterWeb.Counter do
  use CounterWeb, :live_view
  alias Counter.Count
  alias Phoenix.PubSub
+ alias Counter.Presence

  @topic Count.topic
+ @presence_topic "presence"

  def mount(_params, _session, socket) do
    PubSub.subscribe(Counter.PubSub, @topic)

+   Presence.track(self(), @presence_topic, socket.id, %{})
+   CounterWeb.Endpoint.subscribe(@presence_topic)
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
    ~H"""
    <.live_component module={CounterComponent} id="counter" val={@val} />
+   <.live_component module={PresenceComponent} id="presence" present={@present} />
    """
  end
end
```

You will have noticed that last addition in the `render/1` function invokes a `PresenceComponent`.
It doesn't exist yet, let's create it now!

Create a file with the path:
`lib/counter_web/live/presence_component.ex`
and add the following code to it:

```elixir
defmodule PresenceComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <h1 class="text-center pt-2 text-xl">Connected Clients: <%= @present %></h1>
    """
  end
end
```

Now, as you open and close your incognito windows to `localhost:4000`, 
you will get a count of how many are running.


![dwyl-liveview-counter-presence-genserver-state](https://github.com/dwyl/phoenix-liveview-counter-tutorial/assets/194400/33220b3e-3d22-42a0-be37-414a1cb0b693)

<br />

## More Tests!

Once you have implemented the solution,
you need to make sure that the new code is tested. 
Open the `test/counter_web/live/counter_test.exs` file
and add the following tests:

```elixir
test "handle_info/2 Presence Update - Joiner", %{conn: conn} do
  {:ok, view, html} = live(conn, "/")
  assert html =~ "Connected Clients: 1"
  send(view.pid, %{
    event: "presence_diff",
    payload: %{joins: %{"phx-Fhb_dqdqsOCzKQAl" => %{metas: [%{phx_ref: "Fhb_dqdrwlCmfABl"}]}},
                leaves: %{}}})
  assert render(view) =~ "Connected Clients: 2"
end

test "handle_info/2 Presence Update - Leaver", %{conn: conn} do
  {:ok, view, html} = live(conn, "/")
  assert html =~ "Connected Clients: 1"
  send(view.pid, %{
    event: "presence_diff",
    payload: %{joins: %{},
                leaves: %{"phx-Fhb_dqdqsOCzKQAl" => %{metas: [%{phx_ref: "Fhb_dqdrwlCmfABl"}]}}}})
  assert render(view) =~ "Connected Clients: 0"
end
```

With those tests in place, re-running the tests with coverage `mix c`,
you should see the following:

```sh
.........
Finished in 0.1 seconds (0.04s async, 0.1s sync)
9 tests, 0 failures

Randomized with seed 958121
----------------
COV    FILE                                        LINES RELEVANT   MISSED
100.0% lib/counter.ex                                  9        0        0
100.0% lib/counter/presence.ex                         5        0        0
100.0% lib/counter_web/components/layouts.ex           5        0        0
100.0% lib/counter_web/controllers/page_html.ex        5        0        0
100.0% lib/counter_web/endpoint.ex                    46        0        0
100.0% lib/counter_web/live/counter.ex                51       13        0
100.0% lib/counter_web/live/counter_component.e       17        2        0
100.0% lib/counter_web/live/counter_state.ex          53       12        0
100.0% lib/counter_web/live/presence_component.        9        2        0
[TOTAL] 100.0%
----------------
```

# _Done_! 🏁

That's it for this tutorial. <br />
We hope you enjoyed learning with us! <br />
If you found this useful, 
please ⭐️ and _share_ the `GitHub`` repo
so we know you like it!
-->

<br />

# What's _Next_?

If you've enjoyed this basic `counter`` tutorial
and want something a bit more advanced,
checkout our **`LiveView` _Chat_ Tutorial**:
[github.com/dwyl/**phoenix-liveview-chat-example**](https://github.com/dwyl/phoenix-liveview-chat-example) 💬 <br />
Then if you want a more advanced "real world" App
that uses `LiveView` _extensively_
including `Authentication` and some client-side `JS`,
checkout our 
**`MVP` App** 
[/dwyl/**mvp**](https://github.com/dwyl/mvp/)


<br /><br />

# _Feedback_ 💬 🙏

Several people in the `Elixir` / `Phoenix` community
have found this tutorial helpful when starting to use `LiveView`,
e.g: Kurt Mackey [**`@mrkurt`**](https://github.com/mrkurt)
[twitter.com/mrkurt/status/1362940036795219973](https://twitter.com/mrkurt/status/1362940036795219973)

![mrkurt-liveview-tweet](https://user-images.githubusercontent.com/194400/109387184-c8707300-78f7-11eb-9f2f-3a13f5433b77.png)

He deployed the counter app to a 17 region cluster using fly.io: https://liveview-counter.fly.dev

![liveview-counter-cluster](https://user-images.githubusercontent.com/194400/170820493-117751b7-078a-4d4c-9539-33bb5ff8e14d.png)

Code: https://github.com/fly-apps/phoenix-liveview-cluster/blob/master/lib/counter_web/live/counter.ex

> **_Your_ feedback** is always very much **welcome**! 🙏

<br /><br />

# Credits + Thanks! 🙌

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
2. **_Latest_ `Phoenix`, `Elixir` and `LiveView`** versions.
   _Many_ updates have been made to `LiveView` setup since Dennis published his video,
   these are reflected in our tutorial which uses the _latest_ release.
3. **_Broadcast updates_** to all connected clients.
   So when the counter is incremented/decremented in one client,
   all others see the update.
   This is the true power and "WOW Moment" of `LiveView`!

<br />

## `Phoenix LiveView` for Web Developers Who Don't know `Elixir`

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
