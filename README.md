<div align="center">

# Phoenix LiveView Counter Tutorial

[![Build Status](https://img.shields.io/travis/dwyl/phoenix-liveview-counter-tutorial/master.svg?style=flat-square)](https://travis-ci.org/dwyl/phoenix-liveview-counter-tutorial) [![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/dwyl/phoenix-liveview-counter-tutorial/issues) [![HitCount](http://hits.dwyl.io/dwyl/phoenix-liveview-counter-tutorial.svg)](http://hits.dwyl.io/dwyl/phoenix-liveview-counter-tutorial)
<!--
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/phoenix-liveview-counter-tutorial/master.svg?style=flat-square)](http://codecov.io/github/dwyl/phoenix-liveview-counter-tutorial?branch=master)
-->

Build your _first_ App using Phoenix LiveView
and understand all the basic concepts in 20 minutes or less!

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
with no prior experience necessary.


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
but not essential; you can pick it up as you go
and
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
the complete app on your `localhost`.
That way you _know_ it's working
without much effort/time expended.

<br />

#### Clone the Repository

On your `localhost`,
run the following command to clone the repo
and change into the directory:

```sh
git clone https://github.com/dwyl/phoenix-liveview-counter-tutorial.git
cd phoenix-liveview-counter-tutorial
```

#### Download the Dependencies

Install the `Elixir` dependencies by running the command:

```sh
mix deps.get
```

Install the `Node.js` dependencies with:

```sh
npm install --prefix assets
```

#### Run the App

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
https://github.com/phoenixframework/phoenix_live_view/blob/master/guides/introduction/installation.md
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
[mix.exs#L33-L46](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/79d149c89655a6ddd452c93187e638b487aaf375/mix.exs#L33-L46)

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


> 🏁 [`mix.exs`](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/79d149c89655a6ddd452c93187e638b487aaf375/mix.exs#L33-L46)
file at the end of Step 2:
[mix.exs#L33-L46](https://github.com/dwyl/phoenix-liveview-counter-tutorial/blob/79d149c89655a6ddd452c93187e638b487aaf375/mix.exs#L33-L46)

<br />

### Step 4: Add `:fetch_live_flash` Plug to Browser Pipeline


At the top of the file you should see the line
`use LiveViewCounterWeb, :router`
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

### Step 6:













<br /><br />

## Recommended Reading 📚

+ _Official_ Phoenix LiveView installation instructions:
https://github.com/phoenixframework/phoenix_live_view/blob/master/guides/introduction/installation.md


<br /><br />

## Credits 🙌

All credit for inspiring this tutorial goes to Dennis Beatty
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
3. ***Test Driven Development*** is followed so _complete_ beginners
can see how _easy_ it is to write reliable code in a basic example.

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
We feel that it is not very beginner-friendly (_at the time of writing_).
Only the default "_start your Phoenix server_" instructions are included,
and the
[dependencies have diverged](https://github.com/chrismccord/phoenix_live_view_example/issues/56)
so the app does not _compile/run_.
We understand/love that Chris is focussed _building_
Phoenix and LiveView so we decided to fill in the gaps
and write this tutorial.
