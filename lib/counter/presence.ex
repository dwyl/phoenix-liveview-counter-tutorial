defmodule Counter.Presence do
  use Phoenix.Presence,
    otp_app: :counter,
    pubsub_server: Counter.PubSub
end
