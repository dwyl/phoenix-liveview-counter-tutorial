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


If you are new to LiveView (_and have the bandwidth_),
we recommend watching
James [@knowthen](https://github.com/knowthen) Moore's
intro to LiveView where he explains the concepts:
"_Phoenix LiveView for web developers who don't know Elixir_"
[youtu.be/U_Pe8Ru06fM](https://youtu.be/U_Pe8Ru06fM)

[![phoenix-liveview-intro-](https://user-images.githubusercontent.com/194400/76150088-6d1df300-609e-11ea-8b73-67a263fc762b.png)](https://youtu.be/U_Pe8Ru06fM)

Watching the video is _not required_;
you will be able to follow the tutorial without it.

<br />


## Who? 👤

This tutorial is aimed at people who have
never built _anything_ in Phoenix or LiveView.

If you get stuck at any point
while following the tutorial
or you have any feedback/questions/suggestions,
_please_
[open an issue on GitHub!](https://github.com/dwyl/phoenix-liveview-counter-tutorial/issues)

If you don't have a lot of time or bandwidth to watch videos,
this tutorial will be the _fastest_ way to learn LiveView.



### Prerequisites 📝

Before you start working through this tutorial,
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


**b.** **`Phoenix` _installed_** on your computer.
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




**c.** **`Node.js` _installed_** on your computer.
Download it from: https://nodejs.org

If you run the following command in your terminal:

```sh
node -v
```

You should see:

```
v12.16.1
```

> Phoenix LiveView does not require the _latest_ Node.js,
so if you have a _recent_ version e.g v10, you'll be fine.


**d.** Familiarity with **basic `Elixir` syntax** is highly recommended.
See: [https://github.com/dwyl/**learn-elixir**](https://github.com/dwyl/learn-elixir#what)

<br />

## How? 💻

This tutorial takes you through all the steps
to build and test a counter in Phoenix LiveView.
It's a good idea to
["begin with the end in mind"](https://en.wikipedia.org/wiki/The_7_Habits_of_Highly_Effective_People#2_-_Begin_with_the_end_in_mind)
so we recommend running the _finished_ app
on your machine _before_ you write any code.

You can also try the version deployed to Heroku:
https://live-view-counter.herokuapp.com

<br />

### Run the App on your `localhost`

Before you attempt to _build_ the counter,
we suggest that you clone and _run_
the complete app on your `localhost`.
That way you _know_ it's working
without much effort/time expended.

#### Clone the Repository

On your `localhost`, run the following command to clone the repo:

```sh
git clone https://github.com/dwyl/phoenix-liveview-counter-tutorial.git && phoenix-liveview-counter-tutorial
```

#### Download the Dependencies

Install `Elixir` dependencies by running the command:

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


### Step 1. Create the App 🆕

In your terminal run the following `mix` command
to generate the new Phoenix app:

```sh
mix phx.new live_view_counter --no-ecto
```

The `--no-ecto` flag tells `mix phx.new` to create an App without a Database.
This keeps our counter as simple as possible.
We can always add a Database to store the counter later.

When you see the following prompt:

```sh
Fetch and install dependencies? [Yn]
```

Type `Y` and `[Enter]`.
That will download all the dependencies.


#### Checkpoint: _Run_ the _Tests_!


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

#### Checkpoint: _Run_ the New Phoenix App!

Run the server by executing this command:

```sh
mix phx.server
```


Visit
[`localhost:4000`](http://localhost:4000)
in your web browser.

![welcome-to-phoenix](https://user-images.githubusercontent.com/194400/76152198-ae210200-60b4-11ea-956f-68935daddfe0.png)



> Snapshot of code at the end of Step 1:
[phoenix-liveview-counter-tutorial/pull/4/commits/0d94a1c](https://github.com/dwyl/phoenix-liveview-counter-tutorial/pull/4/commits/0d94a1c4072514d0c66cba2c2c21952a76af98be)



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
3. ***Test Driven Development*** is followed so _complete_ beginners
can see how _easy_ it is to write reliable code in a basic example.


<br />

Chris McCord (creator of Phoenix and LiveView) has
[github.com/chrismccord/phoenix_live_view_example](https://github.com/chrismccord/phoenix_live_view_example/tree/e3966aca18f7d8f4da84d197e3ee22af4050fd5e) <br />
We feel that it is not very beginner-friendly (_at the time of writing_).
Only the default "_start your Phoenix server_" instructions are included,
and the
[dependencies have diverged](https://github.com/chrismccord/phoenix_live_view_example/issues/56)
so the app does not _run_.
We understand/love that Chris is focussed _building_
Phoenix and LiveView so we decided to fill in the gaps
and write this tutorial.
