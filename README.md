<div align="center">

# Phoenix LiveView Counter Tutorial

[![Build Status](https://img.shields.io/travis/dwyl/phoenix-liveview-counter-tutorial/master.svg?style=flat-square)](https://travis-ci.org/dwyl/phoenix-liveview-counter-tutorial) [![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/dwyl/phoenix-liveview-counter-tutorial/issues) [![HitCount](http://hits.dwyl.io/dwyl/phoenix-liveview-counter-tutorial.svg)](http://hits.dwyl.io/dwyl/phoenix-liveview-counter-tutorial)
<!--
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/phoenix-liveview-counter-tutorial/master.svg?style=flat-square)](http://codecov.io/github/dwyl/phoenix-liveview-counter-tutorial?branch=master)
-->

Build your _first_ App using Phoenix LiveView
to understand all the basics in 20 minutes or less!

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

> Chris McCord the creator of Phoenix and LiveView has an example:
[https://github.com/chrismccord/phoenix_live_view_example](https://github.com/chrismccord/phoenix_live_view_example/tree/e3966aca18f7d8f4da84d197e3ee22af4050fd5e)
At the time of writing, we feel that it is not very beginner-friendly.
Only the default "_start your Phoenix server_" instructions are included,
and the dependencies have
[diverged](https://github.com/chrismccord/phoenix_live_view_example/issues/56)
so the exampled does not _run_.
We totally understand that Chris is focussing _building_
Phoenix and LiveView so we decided to fill in the gaps
and write this tutorial.






## What? 💭

A _complete beginners_ tutorial for building
the most basic possible Phoenix LiveView App
with no prior experience necessary.

### LiveView?

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


If you are totally new to LiveView (_and have the bandwidth_),
we recommend watching
James [@knowthen](https://github.com/knowthen) Moore's
intro to LiveView video where he explains the concepts:
"_Phoenix LiveView for web developers who don't know Elixir_"
https://youtu.be/U_Pe8Ru06fM
[![phoenix-liveview-intro-](https://user-images.githubusercontent.com/194400/76150088-6d1df300-609e-11ea-8b73-67a263fc762b.png)](https://youtu.be/U_Pe8Ru06fM)




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
This tells us we are using `Elixir version 1.10.1`
which is the _latest_ version at the time of writing.


**b.** **`Phoenix` _installed_** on your computer

**c.** **`Node.js` _installed_** on your computer.

If you run the following command in your terminal:

```sh
node -v
```
You should see:
```
v12.16.1
```

> Phoenix LiveView only requires Node.js



**c.** Familiarity with **basic `Elixir` syntax**.
See: [https://github.com/dwyl/**learn-elixir**](https://github.com/dwyl/learn-elixir#what)



## How? 💻

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

> 💡 If you open a _second_ browser window (_e.g. incognito mode_),
you will see the the counter updating in both places like magic!

You should expect to see:

![phoenix-liveview-counter-start](https://user-images.githubusercontent.com/194400/76150696-2e3f6b80-60a5-11ea-8d65-1999a70bb40a.gif)




## Credits 🙌

All credit for this tutorial goes to Dennis Beatty
[@dnsbty](https://github.com/dnsbty)
for his superb post:
https://dennisbeatty.com/2019/03/19/how-to-create-a-counter-with-phoenix-live-view.html
and corresponding video: https://youtu.be/2bipVjOcvdI

[![dennisbeatty-counter-video](https://user-images.githubusercontent.com/194400/76142652-953e2f80-6067-11ea-95f7-1efdad619b2f.png)](https://youtu.be/2bipVjOcvdI)

We recommend _everyone_ learning `Elixir`
subscribe to his YouTube channel and watch _all_ his videos
as they are a _superb_ resource.

The 3 key differences
between this tutorial and Dennis' original post are:

1. **_Complete_ code** commit (snapshot) at the end of each section.
(_not just snippets of code_).
2. **_Latest_ Phoenix, Elixir and LiveView** versions.
3. ***Test Driven Development*** is followed so _complete_ beginners
can see how easy it is to write reliable code in a basic example.
