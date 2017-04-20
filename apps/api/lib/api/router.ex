defmodule API.Router do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  post "/v1/event/:realm/:domain/:entity_id/:event_type/:event_id" do
    send_resp(conn, 204, "")
    # send_resp(conn, 200, Poison.encode!(%{
    #   realm: realm,  # "nike"
    #   domain: domain,  # "challenge"
    #   entity_id: entity_id,  # group by these
    #   event_type: event_type,  # FSM?  start, stop, edit, delete, actual goal
    #   event_id: event_id
    # }))
  end

  post "/v1/events/:realm" do
    send_resp(conn, 204, "")
    # send_resp(conn, 200, Poison.encode!(%{
    #   count: 0
    # }))
  end

  match _ do
    send_resp(conn, 404, "Invalid Route")
  end
end