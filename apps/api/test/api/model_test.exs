defmodule ModelTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias DB.Reducer.State, as: RS

  @api_router_opts API.Router.init([])

  setup do
    domain = :uuid.uuid_to_string(:uuid.get_v4(:strong))
    entity_id = :uuid.uuid_to_string(:uuid.get_v4(:strong))
    state = %Reducer.State{deferred_events: [],
      model: %{"123456" => %{"start_time" => 1492712720633, "status" => "running"},
      "456789" => %{"start_time" => 1492712720633, "status" => "running"},
      "234567" => %{"start_time" => 1492712720633, "status" => "running"},
      "#{domain}_benchmark" => 250, "#{domain}_type" => "stuff",
      "domain" => "#{domain}",
      "entity_id" => "#{entity_id}",
      "last_played" => "some old event id",
      "store_id" => 12345}, new_events: []}

    reducer_state_key = "#{domain}_#{entity_id}_service.#{domain}"
    %RS{state_id: reducer_state_key, data: state.model} |> RS.save
    on_exit fn ->
      RS.delete(reducer_state_key)
      :ok
    end
    [domain: domain, entity_id: entity_id]
  end

  test "query model, :not_found" do
    conn = conn(:get, "https://example.com/v1/model/not_found_domain/fake_entity_id")
    conn = API.Router.call(conn, @api_router_opts)
    assert conn.state == :sent
    assert conn.status == 404
  end

  test "query model, :found", context do
    conn = conn(:get, "https://example.com/v1/model/#{context[:domain]}/#{context[:entity_id]}")
    conn = API.Router.call(conn, @api_router_opts)
    assert conn.state == :sent
    assert conn.status == 200
  end
end