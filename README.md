<div align="center">

# Phoenix LiveView Counter Tutorial

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/dwyl/phoenix-liveview-counter-tutorial/ci.yml?label=build&style=flat-square&branch=main)
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/phoenix-liveview-counter-tutorial/master.svg?style=flat-square)](https://codecov.io/github/dwyl/phoenix-liveview-counter-tutorial?branch=master)
[![Hex.pm](https://img.shields.io/hexpm/v/phoenix_live_view?color=brightgreen&style=flat-square)](https://hex.pm/packages/phoenix_live_view)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/dwyl/phoenix-liveview-counter-tutorial/issues)
[![HitCount](https://hits.dwyl.com/dwyl/phoenix-liveview-counter-tutorial.svg)](https://hits.dwyl.io/dwyl/phoenix-liveview-counter-tutorial)

**Build your _first_ App** using **Phoenix LiveView** <br />
and **_understand_** all the concepts in **20 minutes** or _less_!

<div>
  <a href="https://live-view-counter.herokuapp.com/">
    <img src="https://user-images.githubusercontent.com/194400/76150696-2e3f6b80-60a5-11ea-8d65-1999a70bb40a.gif">
  </a>
</div>

</div>
<br />

- [Phoenix LiveView Counter Tutorial](#phoenix-liveview-counter-tutorial)
- [Why? 🤷](#why-)
- [What? 💭](#what-)
  - [`LiveView`?](#liveview)
- [Who? 👤](#who-)
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
    - [Recap: Working Counter Without a JavaScript Framework](#recap-working-counter-without-a-javascript-framework)
  - [Step 4: Share State Between Clients!](#step-4-share-state-between-clients)
    - [Code Explanation](#code-explanation)
    - [Checkpoint: Run It!](#checkpoint-run-it)
- [Congratulations! 🎉](#congratulations-)
  - [What's _Next_?](#whats-next)
  - [_Feedback_](#feedback)
- [Future Steps](#future-steps)
  - [Moving state out of the LiveViews](#moving-state-out-of-the-liveviews)
  - [How many people are using the Counter?](#how-many-people-are-using-the-counter)
  - [Some more tests](#some-more-tests)
  - [Credits + Thanks! 🙌](#credits--thanks-)
    - [Phoenix LiveView for Web Developers Who Don't know Elixir](#phoenix-liveview-for-web-developers-who-dont-know-elixir)
  
<br />

# Why? 🤷

There are several example apps around the Internet using Phoenix LiveView
but _none_ include **step-by-step instructions**
a _complete_ beginner can follow.
This is the **_complete beginner's_ tutorial**
we _wish_ we had when **learning LiveView**
and the one _you_ have been searching for! 🎉

# What? 💭

A _complete beginners_ tutorial for building
the most basic possible Phoenix LiveView App
with **no prior experience** necessary.

## `LiveView`?

Phoenix `LiveView` allows you to build **rich interactive web apps**
with **realtime reactive UI** (_no page refresh when data updates_)
**without** writing **`JavaScript`**!
This enables building **_incredible_ user experiences**
with **_considerably_ less code**.

`LiveView` pages load instantly because they are rendered on the Server
and they require far less bandwidth than a similar
React, Vue.js, Angular, etc. because only the _bare minimum_
is loaded on the client for the page to work.

For a sneak peak of what is possible to build with `LiveView`,
watch [@chrismccord](https://github.com/chrismccord)'s **`LiveBeats`** intro:

https://user-images.githubusercontent.com/576796/162234098-31b580fe-e424-47e6-b01d-cd2cfcf823a9.mp4

> **Tip**: Enable the **_sound_**. It's a collaborative music listening experience. 🎶

See: https://github.com/phoenixframework/phoenix_live_view

<br />

# Who? 👤

This tutorial is aimed at people who have
never built _anything_ in `Phoenix` or `LiveView`.
You can _speed-run_ it in **10 minutes**
if you're already familiar with `Phoenix` or `Rails`.

If you get stuck at any point
while following the tutorial
or you have any feedback/questions,
_please_
[open an issue on GitHub!](https://github.com/dwyl/phoenix-liveview-counter-tutorial/issues)

If you don't have a lot of time or bandwidth to watch videos,
this tutorial will be the _fastest_ way to learn `LiveView`.

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
Elixir 1.14.2 (compiled with Erlang/OTP 25)
```

This informs us we are using `Elixir version 1.14.2`
which is the _latest_ version at the time of writing.
Some of the more advanced features of Phoenix 1.7 during compilation time require elixir 
1.14 although the code will work in previous versions.

<br />

**b.** **`Phoenix` installed** on your computer.
see: [hexdocs.pm/phoenix/**installation**](https://hexdocs.pm/phoenix/installation.html)

If you run the following command in your terminal:

```sh
mix phx.new -v
```

You should see something similar to the following:

```sh
Phoenix installer v1.7.0-rc.0
```

If you have an earlier version,
definitely upgrade to get the latest features! <br />
If you have a _later_ version of Phoenix,
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
See: [https://github.com/dwyl/**learn-elixir**](https://github.com/dwyl/learn-elixir#what)

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

In your terminal run the following `mix` command
to generate the new Phoenix app:

```sh
mix phx.new live_view_counter --no-ecto
```

The `--no-ecto` flag tells `mix phx.new`
to create an App without a Database. <br />
This keeps our counter as simple as possible.
We can always add a Database _later_.

> **Note**: Since `Phoenix` `1.6` the `--live` flag
> is no longer required when creating a `LiveView` app.
> `LiveView` is included by default in all new `Phoenix` Apps.
> Older tutorials may still include the flag,
> everything is _much_ easier now.

When you see the following prompt:

```sh
Fetch and install dependencies? [Yn]
```

Type `Y` followed by the `[Enter]` key.
That will download all the necessary dependencies.

<br />

### Checkpoint 1: _Run_ the _Tests_!

In your terminal, go into the newly created app folder using:

```sh
cd live_view_counter
```

And then run the following `mix` command:

```sh
mix test
```

The first time it will compile Phoenix and will take some time.
You should see something similar to this:

```
Compiling 17 files (.ex)
Generated live_view_counter app

.....
Finished in 0.1 seconds (0.05s async, 0.1s sync)
5 tests, 0 failures
```

Tests all pass.
This is _expected_ with a new app.
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

![welcome-to-phoenix](https://user-images.githubusercontent.com/194400/76152198-ae210200-60b4-11ea-956f-68935daddfe0.png)

<br />

## Step 2: Create the `counter.ex` File

Create a new file with the path:
`lib/live_view_counter_web/live/counter.ex`

And add the following code to it:

```elixir
defmodule LiveViewCounterWeb.Counter do
  use LiveViewCounterWeb, :live_view

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
The `~H"""` syntax just means
"_treat this multiline string as a LiveView template_"
The `~H` [sigil](https://elixir-lang.org/getting-started/sigils.html)
is a macro included when the `use Phoenix.LiveView` is invoked
at the top of the file.

LiveView will invoke the `mount/3` function
and will pass the result of `mount/3` to `render/1` behind the scenes.

Each time an update happens (e.g: `handle_event/3`)
the `render/1` function will be executed
and updated data (_in our case the `:val` count_)
is sent to the client.

> 🏁 At the end of Step 2 you should have a file similar to:
> [`lib/live_view_counter_web/live/counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/7e75ba0cfd7f170dc022cfdf62af380d70cc1496/lib/live_view_counter_web/live/counter.ex)

<br />

## Step 3: Create the `live` Route in `router.ex`

Now that we have created our Live handler function in Step 2,
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

<br />

### 3.1 Update the Failing Test Assertion

Since we have replaced the
`get "/", PageController, :index` route in `router.ex`
in the previous step, the test in
`test/live_view_counter_web/controllers/page_controller_test.exs`
will now _fail_:

```sh
Compiling 6 files (.ex)
Generated live_view_counter app
....

  1) test GET / (LiveViewCounterWeb.PageControllerTest)
     test/live_view_counter_web/controllers/page_controller_test.exs:4
     Assertion with =~ failed
     code:  assert html_response(conn, 200) =~ "Peace of mind from prototype to production"
     left:  "<!DOCTYPE html>\n<html lang=\"en\">\n  <head>\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <meta name=\"csrf-token\" content=\"EFt5PABkPz1nPg5FMAoaDSA6BCFtBCMO_4JmNTx_2vO6i3qxXjETTpal\">\n    <title data-suffix=\" · Phoenix Framework\">\nLiveViewCounter\n     · Phoenix Framework</title>\n    <link phx-track-static rel=\"stylesheet\" href=\"/assets/app.css\">\n    <script defer phx-track-static type=\"text/javascript\" src=\"/assets/app.js\">\n    </script>\n  </head>\n  <body class=\"bg-white antialiased\">\n<div data-phx-main=\"true\" data-phx-session=\"SFMyNTY.g2gDaAJhBXQAAAAIZAACaWRtAAAAFHBoeC1GeWkzSUNDYTd2UHFEQURFZAAMbGl2ZV9zZXNzaW9uaAJkAAdkZWZhdWx0bggAuNQjZx-3KBdkAApwYXJlbnRfcGlkZAADbmlsZAAIcm9vdF9waWRkAANuaWxkAAlyb290X3ZpZXdkACFFbGl4aXIuTGl2ZVZpZXdDb3VudGVyV2ViLkNvdW50ZXJkAAZyb3V0ZXJkACBFbGl4aXIuTGl2ZVZpZXdDb3VudGVyV2ViLlJvdXRlcmQAB3Nlc3Npb250AAAAAGQABHZpZXdkACFFbGl4aXIuTGl2ZVZpZXdDb3VudGVyV2ViLkNvdW50ZXJuBgB-d1aLhAFiAAFRgA.hdT9WuJRfJeX-TckMFWrkUEVEh_orieA_DkMToWk-7Q\" data-phx-static=\"SFMyNTY.g2gDaAJhBXQAAAADZAAKYXNzaWduX25ld2pkAAVmbGFzaHQAAAAAZAACaWRtAAAAFHBoeC1GeWkzSUNDYTd2UHFEQURFbgYAjXdWi4QBYgABUYA.6RULnUMCLG3q5DBgBuTc-2ZP2L0jyu-DoIHLG7WlEDs\" id=\"phx-Fyi3ICCa7vPqDADE\"><header class=\"px-4 sm:px-6 lg:px-8\">\n  <div class=\"flex items-center justify-between border-b border-zinc-100 py-3\">\n    <div class=\"flex items-center gap-4\">\n      <a href=\"/\">\n        <svg viewBox=\"0 0 71 48\" class=\"h-6\" aria-hidden=\"true\">\n          <path d=\"m26.371 33.477-.552-.1c-3.92-.729-6.397-3.1-7.57-6.829-.733-2.324.597-4.035 3.035-4.148 1.995-.092 3.362 1.055 4.57 2.39 1.557 1.72 2.984 3.558 4.514 5.305 2.202 2.515 4.797 4.134 8.347 3.634 3.183-.448 5.958-1.725 8.371-3.828.363-.316.761-.592 1.144-.886l-.241-.284c-2.027.63-4.093.841-6.205.735-3.195-.16-6.24-.828-8.964-2.582-2.486-1.601-4.319-3.746-5.19-6.611-.704-2.315.736-3.934 3.135-3.6.948.133 1.746.56 2.463 1.165.583.493 1.143 1.015 1.738 1.493 2.8 2.25 6.712 2.375 10.265-.068-5.842-.026-9.817-3.24-13.308-7.313-1.366-1.594-2.7-3.216-4.095-4.785-2.698-3.036-5.692-5.71-9.79-6.623C12.8-.623 7.745.14 2.893 2.361 1.926 2.804.997 3.319 0 4.149c.494 0 .763.006 1.032 0 2.446-.064 4.28 1.023 5.602 3.024.962 1.457 1.415 3.104 1.761 4.798.513 2.515.247 5.078.544 7.605.761 6.494 4.08 11.026 10.26 13.346 2.267.852 4.591 1.135 7.172.555ZM10.751 3.852c-.976.246-1.756-.148-2.56-.962 1.377-.343 2.592-.476 3.897-.528-.107.848-.607 1.306-1.336 1.49Zm32.002 37.924c-.085-.626-.62-.901-1.04-1.228-1.857-1.446-4.03-1.958-6.333-2-1.375-.026-2.735-.128-4.031-.61-.595-.22-1.26-.505-1.244-1.272.015-.78.693-1 1.31-1.184.505-.15 1.026-.247 1.6-.382-1.46-.936-2.886-1.065-4.787-.3-2.993 1.202-5.943 1.06-8.926-.017-1.684-.608-3.179-1.563-4.735-2.408l-.043.03a2.96 2.96 0 0 0 .04-.029c-.038-.117-.107-.12-.197-.054l.122.107c1.29 2.115 3.034 3.817 5.004 5.271 3.793 2.8 7.936 4.471 12.784 3.73A66.714 66.714 0 0 1 37 40.877c1.98-.16 3.866.398 5.753.899Zm-9.14-30.345c-.105-.076-.206-.266-.42-.069 1.745 2.36 3.985 4.098 6.683 5.193 4.354 1.767 8.773 2.07 13.293.51 3.51-1.21 6.033-.028 7.343 3.38.19-3.955-2.137-6.837-5.843-7.401-2.084-.318-4.01.373-5.962.94-5.434 1.575-10.485.798-15.094-2.553Zm27.085 15.425c.708.059 1.416.123 2.124.185-1.6-1.405-3.55-1.517-5.523-1.404-3.003.17-5.167 1.903-7.14 3.972-1.739 1.824-3.31 3.87-5.903 4.604.043.078.054.117.066.117.35.005.699.021 1.047.005 3.768-.17 7.317-.965 10.14-3.7.89-.86 1.685-1.817 2.544-2.71.716-.746 1.584-1.159 2.645-1.07Zm-8.753-4.67c-2.812.246-5.254 1.409-7.548 2.943-1.766 1.18-3.654 1.738-5.776 1.37-.374-.066-.75-.114-1.124-.17l-.013.156c.135.07.265.151.405.207.354.14.702.308 1.07.395 4.083.971 7.992.474 11.516-1.803 2.221-1.435 4.521-1.707 7.013-1.336.252.038.503.083.756.107.234.022.479.255.795.003-2.179-1.574-4.526-2.096-7.094-1.872Zm-10.049-9.544c1.475.051 2.943-.142 4.486-1.059-.452.04-.643.04-.827.076-2.126.424-4.033-.04-5.733-1.383-.623-.493-1.257-.974-1.889-1.457-2.503-1.914-5.374-2.555-8.514-2.5.05.154.054.26.108.315 3.417 3.455 7.371 5.836 12.369 6.008Zm24.727 17.731c-2.114-2.097-4.952-2.367-7.578-.537 1.738.078 3.043.632 4.101 1.728.374.388.763.768 1.182 1.106 1.6 1.29 4.311 1.352 5.896.155-1.861-.726-1.861-.726-3.601-2.452Zm-21.058 16.06c-1.858-3.46-4.981-4.24-8.59-4.008a9.667 9.667 0 0 1 2.977 1.39c.84.586 1.547 1.311 2.243 2.055 1.38 1.473 3.534 2.376 4.962 2.07-.656-.412-1.238-.848-1.592-1.507Zm17.29-19.32c0-.023.001-.045.003-.068l-.006.006.006-.006-.036-.004.021.018.012.053Zm-20 14.744a7.61 7.61 0 0 0-.072-.041.127.127 0 0 0 .015.043c.005.008.038 0 .058-.002Zm-.072-.041-.008-.034-.008.01.008-.01-.022-.006.005.026.024.014Z\" fill=\"#FD4F00\"></path>\n        </svg>\n      </a>\n      <p class=\"rounded-full bg-brand/5 px-2 text-[0.8125rem] font-medium leading-6 text-brand\">\n        v1.7\n      </p>\n    </div>\n    <div class=\"flex items-center gap-4\">\n      <a href=\"https://twitter.com/elixirphoenix\" class=\"text-[0.8125rem] font-semibold leading-6 text-zinc-900 hover:text-zinc-700\">\n        @elixirphoenix\n      </a>\n      <a href=\"https://github.com/phoenixframework/phoenix\" class=\"text-[0.8125rem] font-semibold leading-6 text-zinc-900 hover:text-zinc-700\">\n        GitHub\n      </a>\n      <a href=\"https://hexdocs.pm/phoenix/overview.html\" class=\"rounded-lg bg-zinc-100 px-2 py-1 text-[0.8125rem] font-semibold leading-6 text-zinc-900 hover:bg-zinc-200/80 active:text-zinc-900/70\">\n        Get Started <span aria-hidden=\"true\">&rarr;</span>\n      </a>\n    </div>\n  </div>\n</header>\n<main class=\"px-4 py-20 sm:px-6 lg:px-8\">\n  <div class=\"mx-auto max-w-2xl\">\n    \n    \n    <div id=\"disconnected\" phx-click=\"[[&quot;push&quot;,{&quot;event&quot;:&quot;lv:clear-flash&quot;,&quot;value&quot;:{&quot;key&quot;:&quot;error&quot;}}],[&quot;hide&quot;,{&quot;time&quot;:200,&quot;to&quot;:&quot;#flash&quot;,&quot;transition&quot;:[[&quot;transition-all&quot;,&quot;transform&quot;,&quot;ease-in&quot;,&quot;duration-200&quot;],[&quot;opacity-100&quot;,&quot;translate-y-0&quot;,&quot;sm:scale-100&quot;],[&quot;opacity-0&quot;,&quot;translate-y-4&quot;,&quot;sm:translate-y-0&quot;,&quot;sm:scale-95&quot;]]}]]\" role=\"alert\" class=\"fixed hidden top-2 right-2 w-80 sm:w-96 z-50 rounded-lg p-3 shadow-md shadow-zinc-900/5 ring-1 bg-rose-50 p-3 text-rose-900 shadow-md ring-rose-500 fill-rose-900\" phx-connected=\"[[&quot;hide&quot;,{&quot;time&quot;:200,&quot;to&quot;:&quot;#disconnected&quot;,&quot;transition&quot;:[[&quot;transition-all&quot;,&quot;transform&quot;,&quot;ease-in&quot;,&quot;duration-200&quot;],[&quot;opacity-100&quot;,&quot;translate-y-0&quot;,&quot;sm:scale-100&quot;],[&quot;opacity-0&quot;,&quot;translate-y-4&quot;,&quot;sm:translate-y-0&quot;,&quot;sm:scale-95&quot;]]}]]\" phx-disconnected=\"[[&quot;show&quot;,{&quot;display&quot;:null,&quot;time&quot;:200,&quot;to&quot;:&quot;#disconnected&quot;,&quot;transition&quot;:[[&quot;transition-all&quot;,&quot;transform&quot;,&quot;ease-out&quot;,&quot;duration-300&quot;],[&quot;opacity-0&quot;,&quot;translate-y-4&quot;,&quot;sm:translate-y-0&quot;,&quot;sm:scale-95&quot;],[&quot;opacity-100&quot;,&quot;translate-y-0&quot;,&quot;sm:scale-100&quot;]]}]]\">\n  <p class=\"flex items-center gap-1.5 text-[0.8125rem] font-semibold leading-6\">\n    \n    <svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" class=\"h-4 w-4\" fill=\"currentColor\" viewBox=\"0 0 20 20\">\n  <path fill-rule=\"evenodd\" d=\"M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-5a.75.75 0 01.75.75v4.5a.75.75 0 01-1.5 0v-4.5A.75.75 0 0110 5zm0 10a1 1 0 100-2 1 1 0 000 2z\" clip-rule=\"evenodd\"/>\n</svg>\n    We can&#39;t find the internet\n  </p>\n  <p class=\"mt-2 text-[0.8125rem] leading-5\">\n      Attempting to reconnect <svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" class=\"ml-1 w-3 h-3 inline animate-spin\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.5\" viewBox=\"0 0 24 24\">\n  <path stroke-linecap=\"round\" stroke-linejoin=\"round\" d=\"M16.023 9.348h4.992v-.001M2.985 19.644v-4.992m0 0h4.992m-4.993 0l3.181 3.183a8.25 8.25 0 0013.803-3.7M4.031 9.865a8.25 8.25 0 0113.803-3.7l3.181 3.182m0-4.991v4.99\"/>\n</svg>\n    </p>\n  \n</div>\n<div>\n<h1 class=\"text-4xl font-bold text-center\"> The count is: 0 </h1>\n\n<p class=\"text-center\">\n <button class=\"phx-submit-loading:opacity-75 rounded-lg bg-zinc-900 hover:bg-zinc-700 py-2 px-3 text-sm font-semibold leading-6 text-white active:text-white/80 \" phx-click=\"dec\">\n  -\n</button>\n <button class=\"phx-submit-loading:opacity-75 rounded-lg bg-zinc-900 hover:bg-zinc-700 py-2 px-3 text-sm font-semibold leading-6 text-white active:text-white/80 \" phx-click=\"inc\">\n  +\n</button>\n </p>\n </div>\n  </div>\n</main></div>\n  </body>\n</html>"
     right: "Peace of mind from prototype to production"
     stacktrace:
       test/live_view_counter_web/controllers/page_controller_test.exs:6: (test)


Finished in 0.1 seconds (0.06s async, 0.09s sync)
5 tests, 1 failure
```

This just tells us that the test is looking for the string
`"Peace of mind from prototype to production"` in the page and did not find it.

To fix the broken test, open the
`test/live_view_counter_web/controllers/page_controller_test.exs`
file and locate the line:

```elixir
assert html_response(conn, 200) =~ "Peace of mind from prototype to production"
```

Update the string from `"Peace of mind from prototype to production"`
to something we _know_ is present on the page,
e.g:
`"The count is"`

> 🏁 The `page_controller_test.exs.exs` file should now look like this:
> [`test/live_view_counter_web/controllers/page_controller_test.exs#L6`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/master/test/live_view_counter_web/controllers/page_controller_test.exs#L6)

Confirm the tests pass again by running:

```sh
mix test
```

You should see output similar to:

```
.....
Finished in 0.1 seconds (0.03s async, 0.07s sync)
5 tests, 0 failures

Randomized with seed 244388
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

You should expect to see a fully functioning LiveView counter:

![phoenix-liveview-counter-single-windowl](https://user-images.githubusercontent.com/194400/76174551-d6395f80-619f-11ea-8e8d-ab9441d15b6d.gif)

<br />

### Recap: Working Counter Without a JavaScript Framework

Once the initial installation
and configuration of LiveView was complete,
the creation of the actual counter was remarkably simple.
We created a _single_ new file
[`lib/live_view_counter_web/live/counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/7e75ba0cfd7f170dc022cfdf62af380d70cc1496/lib/live_view_counter_web/live/counter.ex)
that contains all the code required to
initialise, render and update the counter.
Then we set the `live "/", Counter` route
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

## Step 4: Share State Between Clients!

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
  use LiveViewCounterWeb, :live_view

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

### Code Explanation

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

> 🏁 At the end of Step 6 the file looks like:
> [`lib/live_view_counter_web/live/counter.ex`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/d3cddb14dff911a377d0e41b916cfe57b0557606/lib/live_view_counter_web/live/counter.ex#L1-L36)

<br />

### Checkpoint: Run It!

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
  ~H"""
  <div>
    <h1>The count is: <%= @val %></h1>
    <.button phx-click="dec">-</.button>
    <.button phx-click="inc">+</.button>
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
  <.button phx-click="dec">-</.button>
  <.button phx-click="inc">+</.button>
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
If you found this useful, please ⭐️ and _share_ the GitHub repo
so we know you like it!

<br />

## What's _Next_?

If you've enjoyed this basic counter tutorial
and want something a bit more advanced,
checkout our `LiveView` _Chat_ Tutorial:
[github.com/dwyl/**phoenix-liveview-chat-example**](https://github.com/dwyl/phoenix-liveview-chat-example)

<br />

## _Feedback_

Several people in the `Elixir` / `Phoenix` community
have found this tutorial helpful when starting to use `LiveView`,
e.g: Kurt Mackey [**`@mrkurt`**](https://github.com/mrkurt)
[twitter.com/mrkurt/status/1362940036795219973](https://twitter.com/mrkurt/status/1362940036795219973)

![mrkurt-liveview-tweet](https://user-images.githubusercontent.com/194400/109387184-c8707300-78f7-11eb-9f2f-3a13f5433b77.png)

He deployed the counter app to a 17 region cluster using fly.io: https://liveview-counter.fly.dev

![liveview-counter-cluster](https://user-images.githubusercontent.com/194400/170820493-117751b7-078a-4d4c-9539-33bb5ff8e14d.png)

Code: https://github.com/fly-apps/phoenix-liveview-cluster/blob/master/lib/live_view_counter_web/live/counter.ex

> **_Your_ feedback** is always very much **welcome**! 🙏

<br />

# Future Steps

## Moving state out of the LiveViews

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

Create a file with the path `lib/live_view_counter/counter.ex` and add the following:

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
  use LiveViewCounterWeb, :live_view
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

What is happening now is that the initial state is being retrieved from the
shared Application GenServer process and the updates are being forwarded there
via its API. Finally, the Gen Server Handlers publish the new state to all the
active LiveViews.

## How many people are using the Counter?

Phoenix has a very cool feature called
[Presence](https://hexdocs.pm/phoenix/presence.html#content) to track how many
people are using our system. (It does a lot more than count users, but this is
a counting app so...)

First of all we need to tell the Application we are going to use Presence.
For this we need to create a `lib/live_view_counter/presence.ex` file like this:

```elixir
defmodule LiveViewCounter.Presence do
  use Phoenix.Presence,
    otp_app: :live_view_counter,
    pubsub_server: LiveViewCounter.PubSub
end
```

and tell the application about it in the `lib/live_view_counter/application.ex`
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
`lib/live_view_counter_web/live/counter.ex`.

1. We subscribe to and participate in the Presence system (we do that in
   `mount`)
1. We handle Presence updates and use the current count, adding joiners and
   subtracting leavers to calculate the current numbers 'present'. We do that
   in a pattern matched `handle_info`.
1. We publish the additional data to the client in `render`

```diff
defmodule LiveViewCounterWeb.Counter do
  use LiveViewCounterWeb, :live_view
  alias LiveViewCounter.Count
  alias Phoenix.PubSub
+ alias LiveViewCounter.Presence

  @topic Count.topic
+ @presence_topic "presence"

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
    ~H"""
    <div>
      <h1>The count is: <%= @val %></h1>
      <.button phx-click="dec">-</.button>
      <.button phx-click="inc">+</.button>
+     <h1>Current users: <%= @present %></h1>
    </div>
    """
  end
end
```

Now, as you open and close your incognito windows you will get a count of how
many are running.

<br />

## Some more tests

Once you have implemented the solution - before if you are using TDD - you need to make sure that the new code is properly tested. 

We had a small test that showed that we were showing the counter in the web page, but let's test some of the new logic we added to the "test/live_view_counter_web/live/counter_test.exs" file

```elixir
defmodule LiveViewCounterWeb.CounterTest do
  use LiveViewCounterWeb.ConnCase
  import Phoenix.LiveViewTest

  test "connected mount", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/")
    current = LiveViewCounter.Count.current()
    assert html =~ "count is: #{current}"
  end
end
```

We load the cases and the LiveViewTest and start testing that the connnection shows the current number of users when connecting.

Let's add logic to test increments and decrements

```elixir
  test "Increment", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")
    current = LiveViewCounter.Count.current()
    assert html =~ "count is: #{current}"
    assert render_click(view, :inc) =~ "count is: #{current + 1}"
  end

  test "Decrement", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")
    current = LiveViewCounter.Count.current()
    assert html =~ "count is: #{current}"
    assert render_click(view, :dec) =~ "count is: #{current - 1}"
  end

```

Some more tests for the logic when a new user is connected
```elixir
  test "handle_info/2 Count Update", %{conn: conn} do
    {:ok, view, disconnected_html} = live(conn, "/")
    current = LiveViewCounter.Count.current()
    assert disconnected_html =~ "count is: #{current}"
    assert render(view) =~ "count is: #{current}"
    send(view.pid, {:count, 2})
    assert render(view) =~ "count is: 2"
  end
```

And lastly the logic that follows presence

```elixir

  test "handle_info/2 Presence Update - Joiner", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")
    assert html =~ "Current users: 1"
    send(view.pid, %{
      event: "presence_diff",
      payload: %{joins: %{"phx-Fhb_dqdqsOCzKQAl" => %{metas: [%{phx_ref: "Fhb_dqdrwlCmfABl"}]}},
                 leaves: %{}}})
    assert render(view) =~ "Current users: 2"
  end

  test "handle_info/2 Presence Update - Leaver", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")
    assert html =~ "Current users: 1"
    send(view.pid, %{
      event: "presence_diff",
      payload: %{joins: %{},
                 leaves: %{"phx-Fhb_dqdqsOCzKQAl" => %{metas: [%{phx_ref: "Fhb_dqdrwlCmfABl"}]}}}})
    assert render(view) =~ "Current users: 0"
  end
```


## Credits + Thanks! 🙌

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
