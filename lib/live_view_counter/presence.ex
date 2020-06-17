defmodule LiveViewCounter.Presence do
  use Phoenix.Presence,
    otp_app: :live_view_counter,
    pubsub_server: LiveViewCounter.PubSub
end
