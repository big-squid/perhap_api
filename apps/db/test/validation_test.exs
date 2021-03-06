alias DB.Event

defmodule ValidationTest do
  use ExUnit.Case, async: true
  alias DB.Validation, as: V

  setup do
    {uuid_v1, _} = :uuid.get_v1(:uuid.new(self(), :erlang))
    uuid_v1_string = to_string(:uuid.uuid_to_string(uuid_v1))
    uuid_v4_string = to_string(:uuid.uuid_to_string(:uuid.get_v4(:strong)))
    on_exit fn ->
      :ok
    end
    [uuid_v1: uuid_v1_string, uuid_v4: uuid_v4_string]
  end

  test "event is valid", ctx do
    e = %Event{event_id: ctx[:uuid_v1], entity_id: ctx[:uuid_v4]}
    assert true == V.valid_event(e)
  end

  test "event is not valid", ctx do
    e = %Event{event_id: ctx[:uuid_v1], entity_id: nil}
    assert false == V.valid_event(e)
  end

  test "nil is not a valid uuid" do
    assert false == V.is_uuid_v1(nil)
    assert false == V.is_uuid_v4(nil)
  end

  test "can test a string for comforming to uuid_v4", ctx do
    assert false == V.is_uuid_v4("not a uuid v4")
    assert false == V.is_uuid_v4(ctx[:uuid_v1])
    assert true == V.is_uuid_v4(ctx[:uuid_v4])
    assert true == V.is_uuid_v4(to_string(ctx[:uuid_v4]))
  end

  test "can test a string for comforming to uuid_v1", ctx do
    assert false == V.is_uuid_v1("not a uuid v1")
    assert true == V.is_uuid_v1(ctx[:uuid_v1])
    assert true == V.is_uuid_v1(to_string(ctx[:uuid_v1]))
  end

  test "can flip v1 uuid", ctx do
    assert true == V.flip_v1_uuid(ctx[:uuid_v1]) |> V.is_flipped?
    assert true == V.flip_v1_uuid(to_string(ctx[:uuid_v1])) |> V.is_flipped?
    assert false == ctx[:uuid_v1] |> V.is_flipped?
  end

  test "can extract time from v1 uuid" do
    uuid = 'e1c3029a-2a96-11e7-93ae-92361f002671'
    assert "2017-04-26T15:41:57.920425Z" == V.extract_datetime("#{uuid}")
    assert "2017-04-26T15:41:57.920425Z" == V.extract_datetime(uuid)
  end

end
