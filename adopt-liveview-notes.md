# Learn Phoenix LiveView

These notes are from the extremely useful 
[Adopt Liveview](https://adopt-liveview.lubien.dev/)
course by Lubien Dev.  
If you want deeper explanations and details then definitely check it out!  
The aim of this file is to provide a fast understanding 
of some **core components** of LiveView. 

# 1. Fundamentals 

## The PageLive module

To begin, all the code for our LiveView must be contained inside a module:

```elixir
defmodule PageLive do
  use OurProjectWeb, :live_view
do
```
We can name `PageLive` anything, but we normally add "Live" to the end of the  
module name to indicate that this module is a LiveView.

Next, we see the line `use OurProjectWeb, :live_view`. 
+ The [`use`](https://hexdocs.pm/elixir/macros.html) macro is in all LiveViews
+ `use` executes code at compile time
+ `live_view` indicates that this module is a LiveView 
(will see more of how this works in routers)

## Putting the 'View' in LiveView
The most basic of LiveViews will contain at minimum a `render/1` function,
which renders HTML like code called `HEEx` (more on that later).  
It looks a little something like this: 

```elixir 
def render(assigns) do
  ~H"""
  Hello World!
  """
end
```

Super basic! Here we're passing in an assigns (which we're about to examine),  
and we contain our `HEEx` code inside the 
[`sigil_H/2`](https://hexdocs.pm/phoenix_live_view/0.17.0/Phoenix.LiveView.Helpers.html#sigil_H/2S).
> In Elixir, [sigils](https://hexdocs.pm/elixir/sigils.html)
> are binary functions that essentially transform text into something else 

So why are we passing something called `assign` into our function?  

Well, most the time we will want to manage state in our LiveView.  
This requires us to **store** state somewhere,
which leads us to `assigns`. 
> _Note: the render function must only and always be 
> passed the argument `assigns`_

## LiveView assigns

### Storing state
In frontend frameworks we need a way to store state 
(e.g in `hooks` in ReactJS).  
In LiveView, we use 
[`assigns`](https://hexdocs.pm/phoenix_live_view/assigns-eex.html):

+ All LiveView data is stored in the 
[`socket`](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.Socket.html)
data struct
+ Your own data is stored under the `assigns` key of said socket
+ (i.e, `assigns` is an [elixir map](https://hexdocs.pm/elixir/1.12/Map.html))
+ In assigns, you can store any variable (lists, maps, structs, etc..)

To make use of `assigns`, we normally need to use 
the `mount/3` callback function. 

### The `mount/3` callback 
LiveView sends information via **callbacks** ( _functions that run when an **event** happens_).

The `mount/3` callback runs when the LiveView is initialized.

It takes three arguments:

```elixir
def mount(_params, _session, socket) do
  socket = assign(socket, name: "R2-D2")
  {:ok, socket}
end
```
We'll talk about the socket next,
but for now let's break down the parameters being passed in:

+ `params` are parameters coming from the URL 
(e.g. `/users/:id` where `:id` would be one of the params)
+ `session` is data from the current browsing session,
useful for authentication
+ `socket` is our socket data struct that we just spoke about,
it contains data from the current session and holds the `assigns` map

> Note: as we didn't use `params` or `session` in our code above we let 
> phoenix know this with the underscore: `_params` 

Notice that the `mount/3` returns the tuple `{:ok, socket}` if successful.
+ The `:ok` lets the system know that the mount was successful 
+ The `socket` gives us access to the new data  

### The `%Socket{}` data struct

State management revolves around modifying state of the `socket`. 
Let's use the [`.dbg/2`](https://hexdocs.pm/elixir/debugging.html#dbg-2)
macro to examine what happens to our assigns map when we modify the socket:

```elixir
def mount(_params, _session, socket) do
  socket.assigns |> dbg
  socket = assign(socket, name: "R2-D2")
  socket.assigns |> dbg
  {:ok, socket}
end
```
> Notice that we have to declare a new socket to store the new data?
> This is because data in Elixir is immutable. 

The first debug message returns the unaltered `assigns`:

```
socket.assigns #=> %{__changed__: %{}, flash: %{}, live_action: :index}
```

And the next returns the modified socket with the new `assigns`: 

```
socket.assigns #=> %{name: "R2-D2", __changed__: %{name: true}, f
lash: %{}, live_action: :index}
```

As we can see, assigns are just a map with some data about your LiveView.
Let's look at its components: 

+ `name` is the map we added
+ `__changed__` is a map to explain updates to HTML rendering engine
+ `flash` is a map to send info, success and alert messages to the user
+ `live_action` use this data to know where we are in the application  
(we will see more of this when covering routers)

Ok, so we've seen how data is stored and what its stored in.  
Let's look at how we were render that data.

### Rendering `assigns`
We render assigns in LiveView using tags: `<%= %>`.  

```elixir
def render(assigns) do
  ~H"""
  Hello <%= @name %>
  """
end
```

Here we're accessing the `name` key from the assigns map using `@name`.  
This is exactly the same as `assigns.name`. 

If we stored an name in assigns when we used the `mount/3` function to 
declare a socket, then the code above would render the name, e.g.
"Hello R2-D2".


### Recap 
We now understand the following: 

```elixir

defmodule PageLive do
    use OurProjectWeb, :live_view

    def mount(_params, _session, socket) do
      socket = assign(socket, name: "R2-D2")
      {:ok, socket}
    end

    def render(assigns) do
      ~H"""
      Hello <%= @name %>
      """
    end
end
```

+ The `mount/3` callbacks run when LiveView is initializing
+ The `socket` struct contains data about the LiveView
+ `assigns/2` takes the current socket and the new data
+ We redeclare the socket due to immutability
+ `render/1` has the shortcut `@name` for `assigns.name`

## Modifying state with events

### How do they work?
For each event in your HEEx, you need a corresponding event handler function:

```elixir
def handle_event("your_event", _params, socket)
```

It takes:
+ The name of the event you wish to handle
+ The event parameters
+ The state of the Socket of the current user

It expects the return of `{:noreply, socket}`, which is basically saying
"Everything is ok! Here is the initial socket"

> _(Similar to `mount/3`'s `{:ok, socket}`, but `mount/3` followers 
> the Elixir pattern)_

Let's see it in action.

### The `phx-click` event

Following the pattern of events in the HEEx code, and handling the 
event in a corresponding function we have: 

```elixir
defmodule PageLive do
  use OurProjectWebWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, name: "R2-D2")
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      Hello <%= @name %>

      <input type="button" value="Reverse" phx-click="reverse" >
    </div>
    """
  end

  def handle_event("reverse", _params, socket) do
    socket = assign(socket, name: String.reverse(socket.assigns.name))
    {:noreply, socket}
  end
end
```

So whats going on here? 

In Phoenix, `phx-click` generates an event of your choosing when the element 
is clicked (shocking, I know).

Let's break down a use case of the code above:

1. The LiveView is initialized, calling `mount/3` and passing the assigns 
with our data `name` to the socket
2. The web page displays "Hello R2-D2"
3. The user clicks on the button, triggering our `phx-click` which generates
event with the name `reverse`
4. Our `handle_event/3` callback is activated, which reverses the string 
stored in our assign and stores it in a new socket struct
5. The `handle_event/3` returns the new socket
6. The webpage displays "Hello 2D-2R"

With barely any code, we've triggered and handle an event, and re-rendered the 
page. Elegant right? 

### Recap 
+ Adding `phx-click="event_name"`triggers event when clicked
+ For each event on HEEx, you need a corresponding `handle_event/3` callback
+ The `mount/3` callback returns `{:ok, socket}` 
+ The `handle_event/3` returns `{:noreply, socket}`

<br>
<br>
<br>

# 2. HEEx 

## HEEx is not HTML
The `sigil_H` in the `render` function returns a data struct called HEEx.  
It is the Phoenix template language, HTML + EEX, where EEx is Embedded Elixir, 
an Elixir template engine.

> Optimized to know when something has been modified based on its assigns
> and sends the minimum amount of data form server to client

`assigns` is just one of its superpowers.

## HEEx basics 
Some basic rules of HEEx are as follows: 

+ Using the `<%= %>` tag renders Elixir code that is 
[Phoenix.HTML.safe](https://hexdocs.pm/phoenix_html/Phoenix.HTML.Safe.html)
+ Using the `<% %>` tag executes elixir code but does not render anything 
+ `nil` values do not render 

Seeing this in action:

```elixir
def render(assigns) do
    ~H"""
    <h2>Hello <%= "R2-D2" %></h2>
    <h2>Hello <%= 1 + 1 %></h2>
    <h2>Hello <%= "C-3PO," <> " " <> "Human cyborg relations" %></h2>
    <h2>Hello <% "Not the droids you're looking for" |> IO.puts() %></h2>
    """
  end
```

Case by case renders:

1. The string "R2-D2"
2. The integer 2
3. The third case just uses the string concatenation operator 
<> whose result is "C-3PO, Human cyborg relations".
4. Nothing! Because of the tags do not include the `=` sign,
the code is executed and because of `IO.puts` you can see the result 
in the terminal 

## Conditional Rendering 

### Using `if-else` for simple cases

```elixir 
~H"""
<div>
  <%= if @need_id? do %>
    <p>Let's see some identification</p>
  <% else %>
    <p>Move along!</p>
  <% end %>
</div>
"""
```

Notice:
+ Need the `=` for the `if` tag
+ The `else` and `end` tags don't need `=`
+ We're getting the assign with `@`
+ In Elixir we display booleans with `boolean?` 

If no `else` block is needed, can simply omit it. 

But there is a better way..

### The special `:if` attribute

When you only need an `if`, you can place the special `:if` attribute
directly inside a HTML tag:

```elixir
~H"""
<p :if={@need_id?}>Let's see some identification</p>
"""
```

### Using `case` for complex cases

Elixir doesn't have `else-if`, so instead we use `case`. 

Let's look at a full LiveView module to see this in action:

```elixir
defmodule PageLive do
  use OurProjectWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, tab: "home")
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= case @tab do %>
        <% "home" -> %>
          <p>You're on my personal page!</p>
        <% "about" -> %>
          <p>Hi, I'm a LiveView developer!</p>
        <% "contact" -> %>
          <p>Mail me to bot [at] company [dot] com</p>
      <% end %>
    </div>

    <input disabled={@tab == "home"} 
      type="button" value="Open Home" phx-click="show_home" />

    <input disabled={@tab == "about"} 
      type="button" value="Open About" phx-click="show_about" />

    <input disabled={@tab == "contact"} 
      type="button" value="Open Contact" phx-click="show_contact" />
    """
  end

  def handle_event("show_" <> tab, _params, socket) do
    socket = assign(socket, tab: tab)
    {:noreply, socket}
  end
end
```

This is showcasing a combination of previous topics as well `case`.
To go over what we've seen before:

+ Our assign is `tab` and initialized as "home"
and given to the socket with `mount/3`
+ Using `phx-click="show_{tab_name}"`
+ Our `handle_event/3` can use 
[pattern matching](https://hexdocs.pm/elixir/pattern-matching.html)
and string concatenation to change the assigns all in one function 
+ We can use HTML `disabled` property to disable a button 
if we're on the correct tab

Let's now talk about the `case`:

+ Start with the `=` tag just like `if`
+ Each condition is checking `@tab == value`
+ Each condition we do `<% "expected value" -> %>`
+ Note: We can add a default clause with `<% _ -> %>`


### Condition chaining with `cond`

When rendering something based on a condition that is not about
equality we use `cond` which follows the logic:

+ Each clause returns `true` or `false`
+ First condition that returns true ends the flow 
and renders the prescribed html 
+ To add a standard clause add `true ->` at the **end**

For example:

```elixir
~H"""
<div>
  Current accuracy: <%= @accuracy_percentage %>%
</div>

<div>
  <%= cond do %>
    <% @accuracy_percentage > 70 -> %>
      <p>Clone</p>

    <% @accuracy_percentage > 40 -> %>
      <p>Rebel</p>

    <% @accuracy_percentage > 10 -> %>
      <p>Tusken</p>

    <% @accuracy_percentage > 0 -> %>
      <p>Clankers</p>

    <% true -> %>
      <p>Stormtrooper</p>
  <% end %>
</div>
```

### Recap 
+ For `if-else` use `<%= if condition do %>` and `<% else %>`
+ For only `if` use special if-attribute `:if={condition}` in html tag
+ For multiple comparisons of the same variable
use `<%= case value of %>`
+ For multiple conditions that don't involve comparing equality 
use `<%= cond do %>` 
+ In all cases, have the `=` in the **first** tag 


## List rendering 

### Using `for` comprehension and `:for` attribute

You can use the special attribute `:for` to render simple lists,
like so:

```elixir
defmodule PageLive do
  use OurProjectWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, foods: ["apple", "banana", "carrot"])
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <ul>
      <li :for={food <- @foods}><%= food %></li>
    </ul>
    """
  end
end
```

But there are two main disadvantages for this approach:

1. Loop will be executed **every** time **any** assign changes
2. List of elements will be saved in memory in LiveView while
LiveView is alive

These can solved with streams.

### Efficient rendering with streams

Phoenix's efficient way to handle large (or infinite) lists.

> Note: In the following code our assign looks clunky since 
> we have to include an id to use streams.  
>In reality, this is not an issue as if the data is from a database
> an id will be included.

```elixir
defmodule PageLive do
  use OurProjectWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      stream(socket, :foods, [
        %{id: 1, name: "apple"},
        %{id: 2, name: "banana"},
        %{id: 3, name: "carrot"}
      ])

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <ul id="food-stream" phx-update="stream">
      <li :for={{dom_id, food} <- @streams.foods} id={dom_id}>
        <%= food.name %>
      </li>
    </ul>
    """
  end
end
```

Let's break it down:

+ We use the 
[`stream/4`](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html#stream/4)
function to define a stream
+ `stream/4` recieves our socket, the name of the stream as an atom
and the initial value
+ Our unordered list (or any parent element of the list) must have 
a unique id, in this case `food-stream`
+ Must add `phx-update="stream"` to parent element (to define that
children are part of a stream)
+ Use special assign `@streams.food`, every time a stream is created 
with `:some_name` you generate a special assign `@streams.some_name`
+ `:for` now loops with two elements inside a tuple. The id
is useful when wanting to update / delete elements

### Recap

+ Combining `for` comprehension and special `:for` attribute 
provides simple, readable rendering
+ LiveView provides efficient rendering for large or infinite
data using streams

<br>
<br>
<br>

# 3. Events

## Using phx-value

In the accuracy example, what if we want to include a button 
to increment and decrement different by different amounts?

We can actually handle that very neatly in one function as seen below: 

```elixir
defmodule PageLive do
  use OurProjectWebWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, accuracy_percentage: 30)
    {:ok, socket}
  end

  def handle_event("add", %{"amount" => amount}, socket) do
    amount = String.to_integer(amount)
    socket = assign(socket, accuracy_percentage: 
      socket.assigns.accuracy_percentage + amount)
    {:noreply, socket}
  end

  def render(assigns) do 
    ~H"""
    <div>
      Current accuracy: <%= @accuracy_percentage %>%
    </div>

    <div>
      <%= cond do %>
        <% @accuracy_percentage > 70 -> %>
          <p>Clone</p>

        <% @accuracy_percentage > 40 -> %>
          <p>Rebel</p>

        <% @accuracy_percentage > 10 -> %>
          <p>Tusken</p>

        <% @accuracy_percentage > 0 -> %>
          <p>Clankers</p>

        <% true -> %>
          <p>Stormtrooper</p>
      <% end %>
    </div>

    <input type="button" value="+5" phx-click="add" phx-value-amount={+5} />
    <input type="button" value="+10" phx-click="add" phx-value-amount={+10} />
    <input type="button" value="-5" phx-click="add" phx-value-amount={-5} />
    <input type="button" value="-10" phx-click="add" phx-value-amount={-10} />
    """
  end

end
```

Pretty neat right? The buttons activate a generic event named "add" 
that receives a `phx-value-amount` which is a number. 

The `handle_event/3` is called and receives `{"amount" => amount}` 
as a second parameter, allowing us to increment / decrement the 
accuracy_percentage by different amounts.

> Note that numbers coming from HTML come in String format, 
> which is why we convert the amount in `handle_event/3`

## Using `JS.push/1`

Allows us to push events with a value that is **integer**. 

For the previous example where we used the `phx-value` to obtain 
a number but in string format, we could make the change to: 

```elixir
~H"""
<input 
  type="button" 
  value="+5" 
  phx-click={JS.push("add", value: %{amount: +5})}
/> 
"""
```

Simple! 

We are pushing the `"add"` event and the value will be `%{amount: INTEGER}`.

## More than one event triggered

JS commands can be combined using the pipe operator. Say we had a button 
that increases the score for two teams: 

```elixir
~H"""
JS.push("add_points", value: %{team: :blue, amount: +1})
|> JS.push("add_points", value: %{team: :red, amount: +1})
"""
```

With this approach we can chain as many as is necessary, but that would get
quite messy. So.. 

### Custom JS commands

The neater approach would look something like the following.

In the render:

```elixir
~H"""
phx-click={add_points(:red, 1) |> add_points(:blue, 1)}
"""
```

and then of course handling the events:

```elixir
defp add_points(js \\ %JS{}, team, amount) do
  JS.push(js, "add_points", value: %{team: team, amount: amount})
end

def handle_event("add_points", %{"team" => team, "amount" => amount}, socket) do
  team_atom = String.to_existing_atom(team)
  current_points = socket.assigns[team_atom]
  socket = assign(socket, team_atom, current_points + amount)
  {:noreply, socket}
end
```

Our custom JS command `add_points/3` starts with the default empty JS struct. 
This is just part of how 
[JS.push](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.JS.html#push/1)
works behind the scenes, 
so when we make a custom JS command we have to include this.

The `handle_event/3` receives the `value` map from our `add_points` 
function, so we can handle the team value and the points accordingly.

<br>
<br>
<br>

# 4. Navigation 

## Structure of a LiveView

### Phoenix router 

**Every** Phoenix app requires a router.  

They are auto-generated by Phoenix during set-up with the name
`YourProject.Router`. 

An example of how they've looked so far: 

```elixir
defmodule OurProjectWeb.Router do
  use OurProjectWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
  end

  scope "/" do
    pipe_through :browser

    live "/", PageLive, :index
  end
end
```

What are we looking at then?

+ `use OurProjectWeb, :router` imports functions and macros for 
creating routes
+ `pipeline :browser do` block defines a set of plugs for routes 
(like configurations) of type `:browser`. Here we only define a route that
uses HMTL
+ `scope "/" do` the routes in this block are rendered 
in the root of the website
+ `pipe_through :browser` activates the pipeline called browser

And then **most importantly**: 

+ Using the 
[`live/4`](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.Router.html#live/4)
macro we define the home page (`"/"`) the `PageLive` module will
be rendered with Live Action `:index` (more on that later).

### Multiple LiveViews
What if our web app has multiple pages? Say, an `IndexLive` and 
`SecondPageLive`. Then our router would have to include the following code:

```elixir
defmodule OurProjectWeb.Router do 
  use OurProjectWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
  end

  scope "/" do
    pipe_through :browser

    live "/", IndexLive, :index
    live "/other", SecondPageLive, :index
  end
end

```
> Note: The full `router.ex` file may contain more auto-generated code

So each LiveView would have their own `.ex` file and `defmodule` with
the corresponding `render/1` (at a minimum) and maybe their own `mount/3`
and event handling functions etc. 

>Note: The LiveViews could be named anything we want 

But how would we change between LiveViews in the application?

### The `<.link>` component

Our `IndexLive` could navigate to the `SecondPageLive` like so:

```elixir
defmodule IndexLive do
  use OurProjectWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>IndexLive</h1>
    <.link navigate={~p"/other"}>Go to second page</.link>
    """
  end
end
```

Here we have a bare bones LiveView with some new elements. Let's discuss:

+ **Components** are displayed with HTML tags with a `.` in the opening tag,
more on those later
+ The `<.link>` component is specialized in navigating between pages
using `navigate={~p"/destination"}`

But what's that `~p`?

### Verified Phoenix routes
Using [`sigil_p`](https://hexdocs.pm/phoenix/Phoenix.VerifiedRoutes.html)
when specifying routes means Phoenix will warn us if we try to use 
a route that does not exist. A super handy quality of life feature!


### Recap 
+ Every Phoenix application has a Router
+ Define LiveView routes using `live/4` macro
+ HTML tags with `.` indicate a component 
+ Use `<.link navigate={~p"/route"}>` to efficiently navigate between
routes
+ Using `sigil_p` means Phoenix will warn us if we try to use a route
that does not exist

## Route Parameters

It will be quite common that in a route you need to handle variables 
coming from the URL (parameters).

Let us first see what that looks like in the router:

```elixir
defmodule OurProjectWeb.Router do 
  use OurProjectWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
  end

  scope "/" do
    pipe_through :browser

    live "/", IndexLive, :index
    live "/blog/:slug", BlogLive, :index
  end
end
```

Notice the path includes `/:slug` variable. We can now have access to it
in our LiveView which allows us to do something like the following:

Our first LiveView:
```elixir 
defmodule IndexLive do
  use OurProjectWebWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Welcome to my Website!</h1>
    <ul>
      <li><.link navigate={~p"/blog/goblins"}>Read about goblins</.link></li>
      <li><.link navigate={~p"/blog/elves"}>Read about elves</.link></li>
    </ul>
    """
  end
end
```

So from our `IndexLive` we are navigating to the paths `/blog/goblins`
and `/blog/elves`, i.e we're using our slug variable to add interactivity.

We can use the parameter as follows:

```elixir
defmodule BlogLive do
  use OurProjectWebWeb, :live_view

  def mount(%{"slug" => slug}, _session, socket) do
    socket = assign(socket, :slug, slug)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>Reading about <%= @slug %></h1>
    """
  end
end
```
So `BlogLive` receives in its first argument the map `%{"slug" => slug}`,
which we can the use to create an assign.

> Remember how the first argument of `mount/3` is normally an ignored 
> params argument `_params`?

### Recap

+ The `live/4` macro lets us create parameters in the URL 
using the `:variable_name` format.
+ These parameters become a key in `params` map in our LiveView 

## Generic parameters with query string  

Can also pass data from query string to `params`. 

E.g. if a user passes the query string `?admin_mode=secret123` we could 
set up our LiveView to display content only for admins. Like so:

```elixir
defmodule PageLive do
  use OurProjectWeb, :live_view

  def mount(params, _session, socket) do
    admin? = params["admin_mode"] == "secret123"
    socket = assign(socket, :admin?, admin?)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>Welcome to my Website!</h1>
    <.link :if={@admin?} navigate={~p"/admin"}>Go to admin panel</.link>
    """
  end
end
```
Here the `<.link>` component is only rendered if `admin?` is true,
which is only the case if the path contained the query string
`?admin_mode=secret123`.

> Note: we're accessing the value for the "admin_mode" using Elixir map 
> notation

### Recap 

+ The 'params' variable receives anything in the query string in key-value format
+ E.g. `?x=10&y=12`
+ `params` is a map, so we can access the value with `params[key]`

## Navigating to the same route

Let's improve upon our previous tab example. 
Last time, we used a variable called `tab` to determine what we should render.
This time, we will be using URL parameters and a special `patch` command to 
navigate onto the _same_ page with different rendering being determined by 
the parameter. 

Router to start:
```elixir
defmodule OurProjectWeb.Router do
  use OurProjectWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
  end

  scope "/" do
    pipe_through :browser

    live "/", TabLive, :show
    live "/tab/:tab", TabLive, :show
  end
end
```
Notice that our parameter is `:tab`, and that we have the **same**
LiveView in both routes. Whaaat?

Our LiveView in question:

```elixir
defmodule TabLive do
  use OurProjectWebWeb, :live_view

  def handle_params(params, _uri, socket) do
    tab = params["tab"] || "home"
    socket = assign(socket, tab: tab)
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= case @tab do %>
        <% "home" -> %>
          <p>You're on my personal page!</p>
        <% "about" -> %>
          <p>Hi, I'm a LiveView developer!</p>
        <% "contact" -> %>
          <p>Mail me to bot [at] company [dot] com</p>
      <% end %>
    </div>

    <.link :if={@tab != "home"} patch={~p"/"}>Go to home</.link>
    <.link :if={@tab != "about"} patch={~p"/tab/about"}>Go to about</.link>
    <.link :if={@tab != "contact"} patch={~p"/tab/contact"}>Go to contact</.link>
    """
  end
end
```

Let's first address the elephant in the room. No `mount/3` !?

That's because we're using 
[`handle_params/3`](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html#c:handle_params/3):
+ Callback very similar to `mount/3`
+ Second argument contains URI of current page
+ Must return `{:noreply, socket}`
+ LiveView executes `mount/3` if it exists, then `handle_params/3` 
if it exists
+ This means we can remove `mount/3` completely

Cool! Now addressing the code inside the function, the line 
`tab = params["tab"] || "home"` saves the tab from the parameter as 
a variable, with home being the default if there is no parameter passed
(like in our first `<.link>`).

Ok, now the main point. **Why** are we using `handle_params/3`? 
Well, notice that instead of using `navigate={..}` inside our
link component we use `patch={...}`. 
This approach is optimized for a transition going to the 
same LiveView (hence why we had two routes with the same LiveView).

What does all this mean? We now have the URL parameter 
determining what we should render on our **singular** LiveView, 
which on top of being less code also has it's own optimized transition.
Cool!

### Recap

+ A LiveView can be used on more than one route.
+ We can take advantage of URLs to persist data in cases such as tabs.
+ `handle_params/3` is a callback that is executed right after `mount/3.`
+ One way to optimize page changes for the same LiveView 
is to use patch in the `<.link>` components.
+ Using patch we execute `handle_params/3.`

<br>
<br>
<br>

# 5. Components 

Components offer a way of reusing HEEx, avoiding duplication keeping
the code base clean and efficient. 

## Functional components  

In this example we will be making use of a `<.button>` component 
to eliminate writing the same tailwind classes over and over,
using an **attribute** to customize each button,
and making use of **slots** to render different inner content.

Let's see it all in action:

```elixir
defmodule PageLive do
  use OurProjectWeb, :live_view

  def render(assigns) do
    ~H"""
    <.button color="blue">Default</.button>
    <.button color="green">Green</.button>
    <.button color="red">Red</.button>
    <.button color="yellow">Yellow</.button>
    """
  end


  def button(assigns) do
    ~H"""
    <button
      type="button"
      class={"text-white bg-#{@color}-700 hover:bg-#{@color}-800
      focus:ring-4 focus:ring-#{@color}-300 font-medium rounded-lg
      text-sm px-5 py-2.5 me-2 mb-2 dark:bg-#{@color}-600
      dark:hover:bg-#{@color}-700 focus:outline-none 
      dark:focus:ring-#{@color}-800"}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end
end
```

So the code above does exactly what was just described with 
minimal lines. 

Lets talk about the component:
+ The component function `def button` takes an `assigns` and renders HEEx.
+ We access the color for the tailwind class with `#{@color}`, 
meaning each button will have an assign of color
+ We use 
[`render_slot/2`](https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html#render_slot/2)
by passing the assign `@inner_block`, which is a **slot** and 
contains all the HTML inside our `<.component>`


Now examining how this works in the `render/1`
+ Opening tag starts with `.` (like `<.link>`)
+ Inside the `<.button .. >` opening tag we pass the color attribute
+ In between the tags (the inner block) we have text that each button 
will display.

Nice!

## Validating components

We can use ExDoc to add documentation and validation to our components.
See below:

### ExDoc, examples, and macros

```elixir
defmodule PageLive do
  use OurProjectWeb, :live_view

  def render(assigns) do
    ~H"""
    <.button color="blue">Welcome</.button>
    """
  end

  @doc """
  Renders a button

  ## Examples

      <.button>Save data</.button>
      <.button color="red">Delete account</.button>
  """
  attr :color, :string, required: true
  slot :inner_block, required: true

  def button(assigns) do
    ~H"""
    <button
      type="button"
      class={"text-white bg-#{@color}-700 hover:bg-#{@color}-800
      focus:ring-4 focus:ring-#{@color}-300 font-medium rounded-lg
      text-sm px-5 py-2.5 me-2 mb-2 dark:bg-#{@color}-600
      dark:hover:bg-#{@color}-700 focus:outline-none 
      dark:focus:ring-#{@color}-800"}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end
end
```

Ok, so we're using the `@doc` tag to explain what the component does,
and add a few examples. 

We then use the 
[`attr/3`](https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html#attr/3)
and 
[`slot/2`](https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html#slot/2) 
macros, defining what the component is
expected to receive. The compiler will **validate** whether that
is the case, providing an extra layer of validation.

We can add default and required values to our ExDoc:

```elixir
 @doc """
  Renders a button

  ## Examples

      <.button>Save data</.button>
      <.button color="red">Delete account</.button>
  """
  attr :color, :string, default: "blue"
  slot :inner_block, required: true
```

This way, if a button component is written without the color attribute,
it will have a default of "blue" and be styled accordingly.

### Possible values with `attr/3`

You can also add accepted values to the `attr/3` properties as well:

``` 
attr :color, :string, default: "blue", values: ~w(blue red yellow green)
```

This way a warning will be produced if wrong values are being used.

> Note: `sigil_w` creates string lists. So ["blue", "green"] can be
> written as ~w(blue green)

### Classes with `attr/3`

If we want to be able to add tailwind classes to our component from 
the `render/1` function, we can add a class attribute in our ExDoc as such: 

```elixir
defmodule PageLive do
  use OurProjectWebWeb, :live_view

  def render(assigns) do
    ~H"""
    <.button class="text-red-500">Default</.button>
    """
  end

  @doc """
  Renders a button

  ## Examples

      <.button>Save data</.button>
      <.button class="text-blue-500">Save data</.button>
      <.button color="red">Delete account</.button>
  """
  attr :color, :string, default: "blue", examples: ~w(blue red yellow green)
  attr :class, :string, default: nil
  slot :inner_block, required: true

  def button(assigns) do
    ~H"""
    <button
      type="button"
      class={[
        "text-white bg-#{@color}-700 hover:bg-#{@color}-800
        focus:ring-4 focus:ring-#{@color}-300 font-medium rounded-lg
        text-sm px-5 py-2.5 me-2 mb-2 dark:bg-#{@color}-600
        dark:hover:bg-#{@color}-700 focus:outline-none 
        dark:focus:ring-#{@color}-800",
        @class
      ]}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end
```

Here we added the class attribute to the ExDoc with a default of `nil`
(to allow cases when we don't need it),
and then used a `@class` assign **after** our tailwind classes in 
the button component. This way, any class we pass to assigns in our
`render/1` will override any matching previous classes. 

### Recap

You can use @doc to document your component and show examples.  
Using attr/3 you can document and enhance your component:
+ You can set a value as `required`.
+ You can set a default value if something is not passed using `default`.
+ You can limit the possible values using `values`.

## Core Components

What if we have components we want to access and use
in multiple locations? For example, multiple LiveViews that use
a `<.button..>` component? 

Phoenix projects auto generates a file called `YourWebApp.CoreComponents`.

If we create our button component inside that file, we can simply import 
`CoreComponents` into any module that needs buttons 
and use the component as normal in our `render/1`.

Super handy!

## Multiple slots

In our last example we only used the `@inner_block` slot, 
but what if we want our component to have multiple sections, 
say a title, subtitle and content of a hero section? 

This is where customs slots come in.

### Custom slots

Lets use custom slots to implement a hero section as detailed above.

First we will create a `hero` component in the CoreComponents file:

```elixir
slot :title
slot :subtitle
slot :inner_block

def hero(assigns) do
  ~H"""
  <div class="bg-gray-800 text-white py-20">
    <div class="container mx-auto text-center">
      <h1 class="text-4xl font-bold"><%= render_slot(@title) %></h1>
      <p class="mt-4 text-lg"><%= render_slot(@subtitle) %></p>
      <%= render_slot(@inner_block) %>
    </div>
  </div>
  """
end
```
In here we have provided the styling for each of the custom 
slots, and will be accessing them with assigns:

```
<%= render_slot(@title) %>
```

Just like with the `inner_block` from before.

Then in our LiveView we'd use the slots like so:

```elixir
defmodule IndexLive do
  use OurProjectWebWeb, :live_view
  import CoreComponents

  def render(assigns) do
    ~H"""
    <.hero>
      <:title>IndexLive</:title>
      <:subtitle>Welcome to my personal website!</:subtitle>
      <.link
        class="mt-8 bg-blue-500 hover:bg-blue-600
        text-white font-bold py-2 px-4 rounded"
        navigate={~p"/other"}
      >
        Get Started
      </.link>
    </.hero>
    <.link navigate={~p"/other"}>Go to other</.link>
    """
  end
end
```
Similar to using a component, to use the slots we alter the opening
tag but this time with a `:`. The HTML inside the `<:title></:title>`
tags will be rendered in the `title` slot (and the same for subtitle).

Any HTML not inside a named slot will be rendered into the `@inner_block`. 

> Notice that we imported the CoreComponents to be able to use our
> `<.hero>` component 

## Slots with attributes

### Understanding slots

Slots are just a special assigns (which is why we access them with 
`@slot_name`), which means **every** slot is a list of maps.

### Rendering attributes with slots

The point of understanding what slots are is because if slots are 
_lists_ then we can **loop** through them, and if they contain _maps_ 
then we can access **properties** from them. 

We'll work through an example.  
Starting within CoreComponents:

```elixir
attr :terms, :list, required: true
slot :dt, required: true
slot :dd, required: true

def dl(assigns) do
  ~H"""
  <dl class="max-w-xs mx-auto">
    <div class="grid grid-cols-1 gap-y-2">
      <div :for={item <- @terms} class="border-b border-gray-300">
        <dt class="text-lg font-semibold"><%= render_slot(@dt, item) %></dt>
        <dd class="text-gray-600"><%= render_slot(@dd, item) %></dd>
      </div>
    </div>
  </dl>
  """
end
```

Breakdown:

+ Customized version of the 
[`<dl>`](https://www.w3schools.com/tags/tag_dl.asp) tag
+ Slots names mimic the HTML (description title and description detail)
+ Loop the assigns with `:for` 
+ **Key difference**: passed a second argument to `render_slot/2`

So why the second argument? Notice that the second argument passed is
the current item in the loop.

That allows us to do the following:

```elixir
defmodule PageLive do
  use OurProjectWeb, :live_view
  import CoreComponents

  def mount(_params, _session, socket) do
    boxing_terms = [
      %{term: "Jab", 
      definition: "A quick, straight punch thrown with the lead hand."},
      %{
        term: "Hook",
        definition:
          "A punch thrown in a circular motion targeting the side of
          the opponent's head or body."
      },
      %{
        term: "Cross",
        definition:
          "A powerful punch thrown with the rear hand across the body,
          traveling straight toward the opponent."
      }
    ]

    socket = assign(socket, boxing_terms: boxing_terms)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.dl terms={@boxing_terms}>
      <:dt :let={item}><%= item.term %></:dt>
      <:dd :let={item}><%= item.definition %></:dd>
    </.dl>
    """
  end
end
```

By using the looped item into the `render_slot/2` we can utilize
the special attribute `:let={item}` and store the current looped 
element `item`.

This way, we can access the data specific to each `item`, 
in this case the `term` and `definition` from each item in 
our `boxing_terms` list which we stored in assigns. 

This makes our `render/1` function super clean!
