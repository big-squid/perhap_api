defmodule Service.StatsTest do
  use ExUnit.Case
  doctest Service.Stats

  alias DB.Event
  alias Reducer.State

  setup_all _context do
    {:ok, [
      apa_event: %DB.Event{
        domain: "stats",
        entity_id: "81bc429d-d055-4002-a64f-59e1af501236",
        event_id: "9c49b546-6336-11e7-bbc6-4de700000259",
        kv: "dev_events/9c49b546-6336-11e7-bbc6-4de700000259",
        kv_time: "2017-07-07T17=>06=>25.954951Z",
        meta: [
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "14.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "11232", "challenge_id"=> "1039", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "24.0", "complete_units"=> "76.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-17", "finish_datetime"=> "2017-06-17T15=>11=>09", "full_name"=> "Audrey Ray", "goal_minutes"=> "30.4", "goal_units"=> "76", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "011232", "small_photo"=> "\\N", "start_date"=> "2017-06-17", "start_datetime"=> "2017-06-17T09=>46=>59", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "125", "Store Name"=> "Commerce", "UPH"=> "111.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "71156", "challenge_id"=> "1080", "challenge_type"=> "cph", "coach_edit"=> "0", "complete_minutes"=> "29.0", "complete_units"=> "111.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-27", "finish_datetime"=> "2017-06-27T11=>23=>05", "full_name"=> "William Price", "goal_minutes"=> "48.96", "goal_units"=> "102", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "071156", "small_photo"=> "\\N", "start_date"=> "2017-06-27", "start_datetime"=> "2017-06-27T10=>53=>12", "store_id"=> "2", "team_challenge"=> "1", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "54.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1026", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "57.0", "complete_units"=> "52.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-05", "finish_datetime"=> "2017-06-05T10=>08=>22", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "34.67", "goal_units"=> "52", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "1", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-05", "start_datetime"=> "2017-06-05T09=>11=>10", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "72.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1029", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "49.0", "complete_units"=> "60.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-06", "finish_datetime"=> "2017-06-06T08=>57=>04", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "24.0", "goal_units"=> "60", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "1", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-06", "start_datetime"=> "2017-06-06T08=>07=>36", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "55.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1043", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "21.0", "complete_units"=> "75.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-19", "finish_datetime"=> "2017-06-19T06=>32=>14", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "50.0", "goal_units"=> "75", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-19", "start_datetime"=> "2017-06-19T05=>10=>37", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "84.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1049", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "49.0", "complete_units"=> "70.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-20", "finish_datetime"=> "2017-06-20T07=>08=>49", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "28.0", "goal_units"=> "70", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "1", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-20", "start_datetime"=> "2017-06-20T06=>19=>06", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "250", "Store Name"=> "Commerce", "UPH"=> "207.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1056", "challenge_type"=> "equipment", "coach_edit"=> "0", "complete_minutes"=> "15.0", "complete_units"=> "53.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-21", "finish_datetime"=> "2017-06-21T07=>03=>52", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "60.0", "goal_units"=> "250", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-21", "start_datetime"=> "2017-06-21T06=>48=>32", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "125", "Store Name"=> "Commerce", "UPH"=> "107.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1057", "challenge_type"=> "cph", "coach_edit"=> "0", "complete_minutes"=> "7.0", "complete_units"=> "42.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-21", "finish_datetime"=> "2017-06-21T07=>12=>45", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "60.0", "goal_units"=> "125", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-21", "start_datetime"=> "2017-06-21T07=>04=>55", "store_id"=> "2", "team_challenge"=> "1", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "99.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1058", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "15.0", "complete_units"=> "125.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-21", "finish_datetime"=> "2017-06-21T08=>39=>12", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "60.0", "goal_units"=> "90", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-21", "start_datetime"=> "2017-06-21T07=>23=>52", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "125", "Store Name"=> "Commerce", "UPH"=> "105.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1063", "challenge_type"=> "cph", "coach_edit"=> "0", "complete_minutes"=> "19.0", "complete_units"=> "101.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-22", "finish_datetime"=> "2017-06-22T10=>50=>59", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "49.44", "goal_units"=> "103", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-22", "start_datetime"=> "2017-06-22T10=>31=>47", "store_id"=> "2", "team_challenge"=> "1", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "264.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1064", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "36.0", "complete_units"=> "163.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-23", "finish_datetime"=> "2017-06-23T04=>09=>51", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "38.8", "goal_units"=> "97", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-23", "start_datetime"=> "2017-06-23T03=>32=>51", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "59.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1067", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "30.0", "complete_units"=> "90.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-23", "finish_datetime"=> "2017-06-23T11=>47=>12", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "60.0", "goal_units"=> "90", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "1", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-23", "start_datetime"=> "2017-06-23T10=>16=>50", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "117.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1071", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "38.0", "complete_units"=> "75.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-26", "finish_datetime"=> "2017-06-26T04=>32=>45", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "45.0", "goal_units"=> "75", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-26", "start_datetime"=> "2017-06-26T03=>54=>19", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "269.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1074", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "25.0", "complete_units"=> "115.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-26", "finish_datetime"=> "2017-06-26T11=>11=>36", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "46.0", "goal_units"=> "115", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-26", "start_datetime"=> "2017-06-26T10=>46=>02", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "131.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1075", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "25.0", "complete_units"=> "55.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-27", "finish_datetime"=> "2017-06-27T06=>32=>46", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "33.0", "goal_units"=> "55", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-27", "start_datetime"=> "2017-06-27T06=>07=>40", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "137.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1076", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "26.0", "complete_units"=> "60.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-27", "finish_datetime"=> "2017-06-27T07=>25=>15", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "24.0", "goal_units"=> "60", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-27", "start_datetime"=> "2017-06-27T06=>59=>04", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "91.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1077", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "16.0", "complete_units"=> "25.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-27", "finish_datetime"=> "2017-06-27T07=>43=>35", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "60.0", "goal_units"=> "90", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-27", "start_datetime"=> "2017-06-27T07=>27=>11", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "125", "Store Name"=> "Commerce", "UPH"=> "184.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1078", "challenge_type"=> "cph", "coach_edit"=> "0", "complete_minutes"=> "4.0", "complete_units"=> "13.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-27", "finish_datetime"=> "2017-06-27T07=>49=>06", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "6.24", "goal_units"=> "13", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-27", "start_datetime"=> "2017-06-27T07=>44=>52", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "114.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1079", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "26.0", "complete_units"=> "50.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-27", "finish_datetime"=> "2017-06-27T09=>50=>45", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "60.0", "goal_units"=> "90", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-27", "start_datetime"=> "2017-06-27T09=>24=>28", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "125", "Store Name"=> "Commerce", "UPH"=> "111.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1080", "challenge_type"=> "cph", "coach_edit"=> "0", "complete_minutes"=> "29.0", "complete_units"=> "111.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-27", "finish_datetime"=> "2017-06-27T11=>23=>05", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "48.96", "goal_units"=> "102", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-06-27", "start_datetime"=> "2017-06-27T10=>53=>12", "store_id"=> "2", "team_challenge"=> "1", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "1.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1094", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "11.0", "complete_units"=> "90.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-06", "finish_datetime"=> "2017-07-06T07=>35=>16", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "60.0", "goal_units"=> "90", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-07-04", "start_datetime"=> "2017-07-04T03=>23=>23", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "130.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1106", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "9.0", "complete_units"=> "150.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-07", "finish_datetime"=> "2017-07-07T02=>28=>30", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-07-07", "start_datetime"=> "2017-07-07T01=>19=>18", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "112.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "120688", "challenge_id"=> "1107", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "53.0", "complete_units"=> "100.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-07", "finish_datetime"=> "2017-07-07T03=>23=>53", "full_name"=> "Stephanie Hendrick", "goal_minutes"=> "40.0", "goal_units"=> "100", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "120688", "small_photo"=> "\\N", "start_date"=> "2017-07-07", "start_datetime"=> "2017-07-07T02=>30=>31", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "125", "Store Name"=> "Commerce", "UPH"=> "107.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "124369", "challenge_id"=> "1057", "challenge_type"=> "cph", "coach_edit"=> "0", "complete_minutes"=> "7.0", "complete_units"=> "42.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-21", "finish_datetime"=> "2017-06-21T07=>12=>45", "full_name"=> "Lilith Hightower", "goal_minutes"=> "60.0", "goal_units"=> "125", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "124369", "small_photo"=> "\\N", "start_date"=> "2017-06-21", "start_datetime"=> "2017-06-21T07=>04=>55", "store_id"=> "2", "team_challenge"=> "1", "territory"=> "Southeast" },
          %{ "Goal"=> "125", "Store Name"=> "Commerce", "UPH"=> "105.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "124369", "challenge_id"=> "1063", "challenge_type"=> "cph", "coach_edit"=> "0", "complete_minutes"=> "19.0", "complete_units"=> "101.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-22", "finish_datetime"=> "2017-06-22T10=>50=>59", "full_name"=> "Lilith Hightower", "goal_minutes"=> "49.44", "goal_units"=> "103", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "124369", "small_photo"=> "\\N", "start_date"=> "2017-06-22", "start_datetime"=> "2017-06-22T10=>31=>47", "store_id"=> "2", "team_challenge"=> "1", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "121.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "124369", "challenge_id"=> "1097", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "44.0", "complete_units"=> "90.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-05", "finish_datetime"=> "2017-07-05T07=>28=>17", "full_name"=> "Lilith Hightower", "goal_minutes"=> "60.0", "goal_units"=> "90", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "124369", "small_photo"=> "\\N", "start_date"=> "2017-07-05", "start_datetime"=> "2017-07-05T06=>43=>49", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "64.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "124369", "challenge_id"=> "1105", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "19.0", "complete_units"=> "86.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-07", "finish_datetime"=> "2017-07-07T02=>38=>11", "full_name"=> "Lilith Hightower", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "1", "issue_space"=> "1", "issue_vas"=> "0", "six_digit_login"=> "124369", "small_photo"=> "\\N", "start_date"=> "2017-07-07", "start_datetime"=> "2017-07-07T01=>18=>26", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "260.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "229378", "challenge_id"=> "1052", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "20.0", "complete_units"=> "90.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-21", "finish_datetime"=> "2017-06-21T03=>26=>16", "full_name"=> "Brittany Hewell", "goal_minutes"=> "54.0", "goal_units"=> "90", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "229378", "small_photo"=> "\\N", "start_date"=> "2017-06-21", "start_datetime"=> "2017-06-21T03=>05=>33", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "150.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "250573", "challenge_id"=> "1041", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "47.0", "complete_units"=> "270.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-18", "finish_datetime"=> "2017-06-18T10=>28=>29", "full_name"=> "Megan Hatfield", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "250573", "small_photo"=> "\\N", "start_date"=> "2017-06-18", "start_datetime"=> "2017-06-18T08=>40=>34", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "250", "Store Name"=> "Commerce", "UPH"=> "420.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "250573", "challenge_id"=> "1042", "challenge_type"=> "equipment", "coach_edit"=> "0", "complete_minutes"=> "10.0", "complete_units"=> "72.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-18", "finish_datetime"=> "2017-06-18T11=>15=>20", "full_name"=> "Megan Hatfield", "goal_minutes"=> "17.28", "goal_units"=> "72", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "250573", "small_photo"=> "\\N", "start_date"=> "2017-06-18", "start_datetime"=> "2017-06-18T11=>05=>04", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "310.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "250573", "challenge_id"=> "1045", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "18.0", "complete_units"=> "96.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-20", "finish_datetime"=> "2017-06-20T03=>58=>29", "full_name"=> "Megan Hatfield", "goal_minutes"=> "38.4", "goal_units"=> "96", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "250573", "small_photo"=> "\\N", "start_date"=> "2017-06-20", "start_datetime"=> "2017-06-20T03=>39=>58", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "125.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "250573", "challenge_id"=> "1046", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "40.0", "complete_units"=> "84.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-20", "finish_datetime"=> "2017-06-20T04=>40=>53", "full_name"=> "Megan Hatfield", "goal_minutes"=> "33.6", "goal_units"=> "84", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "250573", "small_photo"=> "\\N", "start_date"=> "2017-06-20", "start_datetime"=> "2017-06-20T04=>00=>36", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "175.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "250573", "challenge_id"=> "1047", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "24.0", "complete_units"=> "72.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-20", "finish_datetime"=> "2017-06-20T05=>09=>34", "full_name"=> "Megan Hatfield", "goal_minutes"=> "28.8", "goal_units"=> "72", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "250573", "small_photo"=> "\\N", "start_date"=> "2017-06-20", "start_datetime"=> "2017-06-20T04=>44=>59", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "183.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "250573", "challenge_id"=> "1048", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "31.0", "complete_units"=> "96.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-20", "finish_datetime"=> "2017-06-20T06=>15=>01", "full_name"=> "Megan Hatfield", "goal_minutes"=> "38.4", "goal_units"=> "96", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "250573", "small_photo"=> "\\N", "start_date"=> "2017-06-20", "start_datetime"=> "2017-06-20T05=>43=>42", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "125", "Store Name"=> "Commerce", "UPH"=> "242.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "250573", "challenge_id"=> "1062", "challenge_type"=> "cph", "coach_edit"=> "0", "complete_minutes"=> "3.0", "complete_units"=> "16.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-22", "finish_datetime"=> "2017-06-22T06=>49=>05", "full_name"=> "Megan Hatfield", "goal_minutes"=> "7.68", "goal_units"=> "16", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "250573", "small_photo"=> "\\N", "start_date"=> "2017-06-22", "start_datetime"=> "2017-06-22T06=>45=>08", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "173.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "250573", "challenge_id"=> "1068", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "18.0", "complete_units"=> "227.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-23", "finish_datetime"=> "2017-06-23T15=>40=>26", "full_name"=> "Megan Hatfield", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "250573", "small_photo"=> "\\N", "start_date"=> "2017-06-23", "start_datetime"=> "2017-06-23T14=>22=>01", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "222.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "250573", "challenge_id"=> "1087", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "20.0", "complete_units"=> "75.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-02", "finish_datetime"=> "2017-07-02T09=>49=>32", "full_name"=> "Megan Hatfield", "goal_minutes"=> "133.33", "goal_units"=> "200", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "250573", "small_photo"=> "\\N", "start_date"=> "2017-07-02", "start_datetime"=> "2017-07-02T09=>29=>17", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "250", "Store Name"=> "Commerce", "UPH"=> "283.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "250573", "challenge_id"=> "1088", "challenge_type"=> "equipment", "coach_edit"=> "0", "complete_minutes"=> "59.0", "complete_units"=> "282.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-02", "finish_datetime"=> "2017-07-02T11=>17=>04", "full_name"=> "Megan Hatfield", "goal_minutes"=> "60.0", "goal_units"=> "250", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "250573", "small_photo"=> "\\N", "start_date"=> "2017-07-02", "start_datetime"=> "2017-07-02T10=>17=>21", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "250", "Store Name"=> "Commerce", "UPH"=> "2.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "250573", "challenge_id"=> "1089", "challenge_type"=> "equipment", "coach_edit"=> "0", "complete_minutes"=> "19.0", "complete_units"=> "250.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-06", "finish_datetime"=> "2017-07-06T08=>33=>37", "full_name"=> "Megan Hatfield", "goal_minutes"=> "60.0", "goal_units"=> "250", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "250573", "small_photo"=> "\\N", "start_date"=> "2017-07-02", "start_datetime"=> "2017-07-02T14=>14=>36", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "30.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "250573", "challenge_id"=> "1104", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "19.0", "complete_units"=> "100.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-06", "finish_datetime"=> "2017-07-06T11=>53=>05", "full_name"=> "Megan Hatfield", "goal_minutes"=> "40.0", "goal_units"=> "100", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "250573", "small_photo"=> "\\N", "start_date"=> "2017-07-06", "start_datetime"=> "2017-07-06T08=>33=>48", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "143.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "302658", "challenge_id"=> "1021", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "37.0", "complete_units"=> "90.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-04", "finish_datetime"=> "2017-06-04T05=>03=>03", "full_name"=> "Morgan Pruitt", "goal_minutes"=> "60.0", "goal_units"=> "90", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "302658", "small_photo"=> "\\N", "start_date"=> "2017-06-04", "start_datetime"=> "2017-06-04T04=>25=>24", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "124.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "336000", "challenge_id"=> "1020", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "12.0", "complete_units"=> "150.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-04", "finish_datetime"=> "2017-06-04T04=>19=>30", "full_name"=> "Kayla Thomas", "goal_minutes"=> "60.0", "goal_units"=> "100", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "336000", "small_photo"=> "\\N", "start_date"=> "2017-06-04", "start_datetime"=> "2017-06-04T03=>07=>11", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "168.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "342014", "challenge_id"=> "1022", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "32.0", "complete_units"=> "90.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-04", "finish_datetime"=> "2017-06-04T05=>02=>35", "full_name"=> "Madison Holcomb", "goal_minutes"=> "60.0", "goal_units"=> "90", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "347947", "small_photo"=> "\\N", "start_date"=> "2017-06-04", "start_datetime"=> "2017-06-04T04=>30=>33", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "269.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "342014", "challenge_id"=> "1051", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "22.0", "complete_units"=> "100.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-21", "finish_datetime"=> "2017-06-21T03=>25=>09", "full_name"=> "Madison Holcomb", "goal_minutes"=> "60.0", "goal_units"=> "100", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "347947", "small_photo"=> "\\N", "start_date"=> "2017-06-21", "start_datetime"=> "2017-06-21T03=>02=>54", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "88.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "342015", "challenge_id"=> "1017", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "8.0", "complete_units"=> "100.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-02", "finish_datetime"=> "2017-06-02T04=>12=>09", "full_name"=> "Makensy Holcomb", "goal_minutes"=> "60.0", "goal_units"=> "100", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "347992", "small_photo"=> "\\N", "start_date"=> "2017-06-02", "start_datetime"=> "2017-06-02T03=>04=>04", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "54.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "342021", "challenge_id"=> "1098", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "6.0", "complete_units"=> "60.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-05", "finish_datetime"=> "2017-07-05T09=>24=>03", "full_name"=> "Carlie Morris", "goal_minutes"=> "40.0", "goal_units"=> "60", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "335289", "small_photo"=> "\\N", "start_date"=> "2017-07-05", "start_datetime"=> "2017-07-05T08=>17=>42", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "74.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "342479", "challenge_id"=> "1031", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "20.0", "complete_units"=> "100.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-07", "finish_datetime"=> "2017-06-07T04=>35=>02", "full_name"=> "Denise Clark", "goal_minutes"=> "60.0", "goal_units"=> "100", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "351819", "small_photo"=> "\\N", "start_date"=> "2017-06-07", "start_datetime"=> "2017-06-07T03=>14=>35", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "198.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "354797", "challenge_id"=> "1027", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "24.0", "complete_units"=> "80.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-05", "finish_datetime"=> "2017-06-05T16=>04=>18", "full_name"=> "Jasmine Campa", "goal_minutes"=> "60.0", "goal_units"=> "100", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "353219", "small_photo"=> "\\N", "start_date"=> "2017-06-05", "start_datetime"=> "2017-06-05T15=>40=>09", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "98.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "354797", "challenge_id"=> "1032", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "47.0", "complete_units"=> "78.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-07", "finish_datetime"=> "2017-06-07T11=>40=>05", "full_name"=> "Jasmine Campa", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "353219", "small_photo"=> "\\N", "start_date"=> "2017-06-07", "start_datetime"=> "2017-06-07T10=>52=>47", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "250", "Store Name"=> "Commerce", "UPH"=> "188.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "354797", "challenge_id"=> "1033", "challenge_type"=> "equipment", "coach_edit"=> "0", "complete_minutes"=> "34.0", "complete_units"=> "110.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-07", "finish_datetime"=> "2017-06-07T16=>41=>41", "full_name"=> "Jasmine Campa", "goal_minutes"=> "60.0", "goal_units"=> "250", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "353219", "small_photo"=> "\\N", "start_date"=> "2017-06-07", "start_datetime"=> "2017-06-07T16=>06=>44", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "76.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "354797", "challenge_id"=> "1036", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "23.0", "complete_units"=> "30.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-08", "finish_datetime"=> "2017-06-08T10=>12=>05", "full_name"=> "Jasmine Campa", "goal_minutes"=> "60.0", "goal_units"=> "90", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "353219", "small_photo"=> "\\N", "start_date"=> "2017-06-08", "start_datetime"=> "2017-06-08T09=>48=>24", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "91.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "354797", "challenge_id"=> "1037", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "44.0", "complete_units"=> "67.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-08", "finish_datetime"=> "2017-06-08T12=>58=>37", "full_name"=> "Jasmine Campa", "goal_minutes"=> "60.0", "goal_units"=> "90", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "353219", "small_photo"=> "\\N", "start_date"=> "2017-06-08", "start_datetime"=> "2017-06-08T12=>14=>36", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "61.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "354797", "challenge_id"=> "1044", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "12.0", "complete_units"=> "136.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-19", "finish_datetime"=> "2017-06-19T13=>31=>39", "full_name"=> "Jasmine Campa", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "353219", "small_photo"=> "\\N", "start_date"=> "2017-06-19", "start_datetime"=> "2017-06-19T11=>18=>41", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "94.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "354797", "challenge_id"=> "1055", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "28.0", "complete_units"=> "140.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-21", "finish_datetime"=> "2017-06-21T08=>10=>12", "full_name"=> "Jasmine Campa", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "353219", "small_photo"=> "\\N", "start_date"=> "2017-06-21", "start_datetime"=> "2017-06-21T06=>41=>20", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "70.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "354797", "challenge_id"=> "1059", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "58.0", "complete_units"=> "68.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-22", "finish_datetime"=> "2017-06-22T06=>18=>22", "full_name"=> "Jasmine Campa", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "353219", "small_photo"=> "\\N", "start_date"=> "2017-06-22", "start_datetime"=> "2017-06-22T05=>20=>08", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "261.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "354797", "challenge_id"=> "1085", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "1.0", "complete_units"=> "267.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-01", "finish_datetime"=> "2017-07-01T04=>06=>05", "full_name"=> "Jasmine Campa", "goal_minutes"=> "60.0", "goal_units"=> "100", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "353219", "small_photo"=> "\\N", "start_date"=> "2017-07-01", "start_datetime"=> "2017-07-01T03=>04=>44", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "100.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "354797", "challenge_id"=> "1096", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "53.0", "complete_units"=> "90.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-05", "finish_datetime"=> "2017-07-05T07=>27=>36", "full_name"=> "Jasmine Campa", "goal_minutes"=> "60.0", "goal_units"=> "90", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "353219", "small_photo"=> "\\N", "start_date"=> "2017-07-05", "start_datetime"=> "2017-07-05T06=>34=>00", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "125", "Store Name"=> "Commerce", "UPH"=> "83.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "354797", "challenge_id"=> "1097", "challenge_type"=> "cph", "coach_edit"=> "0", "complete_minutes"=> "38.0", "complete_units"=> "108.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-05", "finish_datetime"=> "2017-07-05T08=>07=>45", "full_name"=> "Jasmine Campa", "goal_minutes"=> "60.0", "goal_units"=> "125", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "353219", "small_photo"=> "\\N", "start_date"=> "2017-07-05", "start_datetime"=> "2017-07-05T07=>28=>57", "store_id"=> "2", "team_challenge"=> "1", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "181.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "354797", "challenge_id"=> "1103", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "49.0", "complete_units"=> "150.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-06", "finish_datetime"=> "2017-07-06T06=>02=>38", "full_name"=> "Jasmine Campa", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "353219", "small_photo"=> "\\N", "start_date"=> "2017-07-06", "start_datetime"=> "2017-07-06T05=>13=>02", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "184.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356182", "challenge_id"=> "1018", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "22.0", "complete_units"=> "68.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-02", "finish_datetime"=> "2017-06-02T05=>53=>27", "full_name"=> "Jessica P", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "1", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "284238", "small_photo"=> "\\N", "start_date"=> "2017-06-02", "start_datetime"=> "2017-06-02T05=>31=>20", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "118.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356182", "challenge_id"=> "1019", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "19.0", "complete_units"=> "157.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-02", "finish_datetime"=> "2017-06-02T07=>13=>37", "full_name"=> "Jessica P", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "1", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "284238", "small_photo"=> "\\N", "start_date"=> "2017-06-02", "start_datetime"=> "2017-06-02T05=>54=>11", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "361.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356182", "challenge_id"=> "1023", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "5.0", "complete_units"=> "35.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-04", "finish_datetime"=> "2017-06-04T09=>55=>21", "full_name"=> "Jessica P", "goal_minutes"=> "23.33", "goal_units"=> "35", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "1", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "284238", "small_photo"=> "\\N", "start_date"=> "2017-06-04", "start_datetime"=> "2017-06-04T09=>49=>32", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "102.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356182", "challenge_id"=> "1030", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "0.0", "complete_units"=> "103.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-06", "finish_datetime"=> "2017-06-06T13=>10=>29", "full_name"=> "Jessica P", "goal_minutes"=> "41.2", "goal_units"=> "103", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "1", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "284238", "small_photo"=> "\\N", "start_date"=> "2017-06-06", "start_datetime"=> "2017-06-06T12=>10=>15", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "120.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356182", "challenge_id"=> "1035", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "0.0", "complete_units"=> "122.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-08", "finish_datetime"=> "2017-06-08T06=>12=>05", "full_name"=> "Jessica P", "goal_minutes"=> "81.33", "goal_units"=> "122", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "284238", "small_photo"=> "\\N", "start_date"=> "2017-06-08", "start_datetime"=> "2017-06-08T05=>11=>26", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "136.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356182", "challenge_id"=> "1053", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "22.0", "complete_units"=> "50.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-21", "finish_datetime"=> "2017-06-21T05=>59=>30", "full_name"=> "Jessica P", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "284238", "small_photo"=> "\\N", "start_date"=> "2017-06-21", "start_datetime"=> "2017-06-21T05=>37=>28", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "101.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356182", "challenge_id"=> "1054", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "42.0", "complete_units"=> "72.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-21", "finish_datetime"=> "2017-06-21T07=>01=>15", "full_name"=> "Jessica P", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "284238", "small_photo"=> "\\N", "start_date"=> "2017-06-21", "start_datetime"=> "2017-06-21T06=>18=>50", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "125", "Store Name"=> "Commerce", "UPH"=> "107.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356182", "challenge_id"=> "1057", "challenge_type"=> "cph", "coach_edit"=> "0", "complete_minutes"=> "7.0", "complete_units"=> "42.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-21", "finish_datetime"=> "2017-06-21T07=>12=>45", "full_name"=> "Jessica P", "goal_minutes"=> "60.0", "goal_units"=> "125", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "284238", "small_photo"=> "\\N", "start_date"=> "2017-06-21", "start_datetime"=> "2017-06-21T07=>04=>55", "store_id"=> "2", "team_challenge"=> "1", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "227.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356182", "challenge_id"=> "1060", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "19.0", "complete_units"=> "75.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-22", "finish_datetime"=> "2017-06-22T05=>40=>33", "full_name"=> "Jessica P", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "284238", "small_photo"=> "\\N", "start_date"=> "2017-06-22", "start_datetime"=> "2017-06-22T05=>20=>46", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "78.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356182", "challenge_id"=> "1072", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "8.0", "complete_units"=> "90.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-26", "finish_datetime"=> "2017-06-26T06=>43=>21", "full_name"=> "Jessica P", "goal_minutes"=> "60.0", "goal_units"=> "90", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "284238", "small_photo"=> "\\N", "start_date"=> "2017-06-26", "start_datetime"=> "2017-06-26T05=>34=>51", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "156.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356182", "challenge_id"=> "1073", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "20.0", "complete_units"=> "54.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-26", "finish_datetime"=> "2017-06-26T07=>47=>50", "full_name"=> "Jessica P", "goal_minutes"=> "36.0", "goal_units"=> "54", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "284238", "small_photo"=> "\\N", "start_date"=> "2017-06-26", "start_datetime"=> "2017-06-26T07=>27=>04", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "82.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356182", "challenge_id"=> "1081", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "3.0", "complete_units"=> "87.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-27", "finish_datetime"=> "2017-06-27T12=>47=>50", "full_name"=> "Jessica P", "goal_minutes"=> "34.8", "goal_units"=> "87", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "284238", "small_photo"=> "\\N", "start_date"=> "2017-06-27", "start_datetime"=> "2017-06-27T11=>44=>24", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "115.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356182", "challenge_id"=> "1082", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "0.0", "complete_units"=> "116.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-27", "finish_datetime"=> "2017-06-27T13=>49=>48", "full_name"=> "Jessica P", "goal_minutes"=> "46.4", "goal_units"=> "116", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "1", "issue_vas"=> "0", "six_digit_login"=> "284238", "small_photo"=> "\\N", "start_date"=> "2017-06-27", "start_datetime"=> "2017-06-27T12=>49=>27", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "464.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356182", "challenge_id"=> "1083", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "13.0", "complete_units"=> "107.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-27", "finish_datetime"=> "2017-06-27T14=>30=>08", "full_name"=> "Jessica P", "goal_minutes"=> "42.8", "goal_units"=> "107", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "284238", "small_photo"=> "\\N", "start_date"=> "2017-06-27", "start_datetime"=> "2017-06-27T14=>16=>18", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "365.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356182", "challenge_id"=> "1084", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "14.0", "complete_units"=> "87.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-27", "finish_datetime"=> "2017-06-27T14=>45=>11", "full_name"=> "Jessica P", "goal_minutes"=> "34.8", "goal_units"=> "87", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "284238", "small_photo"=> "\\N", "start_date"=> "2017-06-27", "start_datetime"=> "2017-06-27T14=>30=>53", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "1.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356383", "challenge_id"=> "1016", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "10.0", "complete_units"=> "100.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-06", "finish_datetime"=> "2017-06-06T06=>14=>49", "full_name"=> "Hunter Ramsey", "goal_minutes"=> "60.0", "goal_units"=> "100", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "296077", "small_photo"=> "\\N", "start_date"=> "2017-06-02", "start_datetime"=> "2017-06-02T03=>03=>49", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "90.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356383", "challenge_id"=> "1028", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "59.0", "complete_units"=> "90.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-06", "finish_datetime"=> "2017-06-06T07=>15=>22", "full_name"=> "Hunter Ramsey", "goal_minutes"=> "60.0", "goal_units"=> "90", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "1", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "296077", "small_photo"=> "\\N", "start_date"=> "2017-06-06", "start_datetime"=> "2017-06-06T06=>15=>36", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "110.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356383", "challenge_id"=> "1038", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "54.0", "complete_units"=> "100.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-11", "finish_datetime"=> "2017-06-11T13=>10=>07", "full_name"=> "Hunter Ramsey", "goal_minutes"=> "60.0", "goal_units"=> "100", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "1", "issue_space"=> "1", "issue_vas"=> "0", "six_digit_login"=> "296077", "small_photo"=> "\\N", "start_date"=> "2017-06-11", "start_datetime"=> "2017-06-11T12=>15=>50", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "125", "Store Name"=> "Commerce", "UPH"=> "105.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356383", "challenge_id"=> "1063", "challenge_type"=> "cph", "coach_edit"=> "0", "complete_minutes"=> "19.0", "complete_units"=> "101.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-22", "finish_datetime"=> "2017-06-22T10=>50=>59", "full_name"=> "Hunter Ramsey", "goal_minutes"=> "49.44", "goal_units"=> "103", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "296077", "small_photo"=> "\\N", "start_date"=> "2017-06-22", "start_datetime"=> "2017-06-22T10=>31=>47", "store_id"=> "2", "team_challenge"=> "1", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "175.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356383", "challenge_id"=> "1069", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "29.0", "complete_units"=> "263.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-25", "finish_datetime"=> "2017-06-25T10=>43=>48", "full_name"=> "Hunter Ramsey", "goal_minutes"=> "157.8", "goal_units"=> "263", "issue_capacity"=> "1", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "1", "issue_vas"=> "0", "six_digit_login"=> "296077", "small_photo"=> "\\N", "start_date"=> "2017-06-25", "start_datetime"=> "2017-06-25T09=>13=>53", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "126.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356383", "challenge_id"=> "1070", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "0.0", "complete_units"=> "128.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-25", "finish_datetime"=> "2017-06-25T12=>13=>34", "full_name"=> "Hunter Ramsey", "goal_minutes"=> "76.8", "goal_units"=> "128", "issue_capacity"=> "1", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "1", "issue_vas"=> "0", "six_digit_login"=> "296077", "small_photo"=> "\\N", "start_date"=> "2017-06-25", "start_datetime"=> "2017-06-25T11=>12=>38", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "136.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356383", "challenge_id"=> "1090", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "10.0", "complete_units"=> "23.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-03", "finish_datetime"=> "2017-07-03T03=>48=>11", "full_name"=> "Hunter Ramsey", "goal_minutes"=> "13.8", "goal_units"=> "23", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "296077", "small_photo"=> "\\N", "start_date"=> "2017-07-03", "start_datetime"=> "2017-07-03T03=>38=>06", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "156.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356383", "challenge_id"=> "1093", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "14.0", "complete_units"=> "37.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-03", "finish_datetime"=> "2017-07-03T04=>04=>58", "full_name"=> "Hunter Ramsey", "goal_minutes"=> "22.2", "goal_units"=> "37", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "296077", "small_photo"=> "\\N", "start_date"=> "2017-07-03", "start_datetime"=> "2017-07-03T03=>50=>48", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "66.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356454", "challenge_id"=> "1025", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "36.0", "complete_units"=> "40.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-05", "finish_datetime"=> "2017-06-05T09=>44=>41", "full_name"=> "Cale Garrison", "goal_minutes"=> "60.0", "goal_units"=> "90", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "367198", "small_photo"=> "\\N", "start_date"=> "2017-06-05", "start_datetime"=> "2017-06-05T09=>08=>26", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "157.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356454", "challenge_id"=> "1065", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "29.0", "complete_units"=> "78.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-23", "finish_datetime"=> "2017-06-23T04=>03=>01", "full_name"=> "Cale Garrison", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "367198", "small_photo"=> "\\N", "start_date"=> "2017-06-23", "start_datetime"=> "2017-06-23T03=>33=>15", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "111.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356454", "challenge_id"=> "1099", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "48.0", "complete_units"=> "90.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-05", "finish_datetime"=> "2017-07-05T10=>02=>42", "full_name"=> "Cale Garrison", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "367198", "small_photo"=> "\\N", "start_date"=> "2017-07-05", "start_datetime"=> "2017-07-05T09=>14=>25", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "109.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356455", "challenge_id"=> "1092", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "27.0", "complete_units"=> "160.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-03", "finish_datetime"=> "2017-07-03T05=>07=>44", "full_name"=> "Will South", "goal_minutes"=> "96.0", "goal_units"=> "160", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "366603", "small_photo"=> "\\N", "start_date"=> "2017-07-03", "start_datetime"=> "2017-07-03T03=>40=>09", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "27.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356847", "challenge_id"=> "1040", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "22.0", "complete_units"=> "150.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-17", "finish_datetime"=> "2017-06-17T15=>10=>56", "full_name"=> "Derrick Williams", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "367328", "small_photo"=> "\\N", "start_date"=> "2017-06-17", "start_datetime"=> "2017-06-17T09=>48=>50", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "90", "Store Name"=> "Commerce", "UPH"=> "164.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356847", "challenge_id"=> "1086", "challenge_type"=> "apparel", "coach_edit"=> "0", "complete_minutes"=> "31.0", "complete_units"=> "250.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-02", "finish_datetime"=> "2017-07-02T10=>37=>50", "full_name"=> "Derrick Williams", "goal_minutes"=> "100.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "367328", "small_photo"=> "\\N", "start_date"=> "2017-07-02", "start_datetime"=> "2017-07-02T09=>06=>25", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "150", "Store Name"=> "Commerce", "UPH"=> "2.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "356847", "challenge_id"=> "1095", "challenge_type"=> "footwear", "coach_edit"=> "0", "complete_minutes"=> "51.0", "complete_units"=> "150.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-07", "finish_datetime"=> "2017-07-07T03=>27=>22", "full_name"=> "Derrick Williams", "goal_minutes"=> "60.0", "goal_units"=> "150", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "367328", "small_photo"=> "\\N", "start_date"=> "2017-07-04", "start_datetime"=> "2017-07-04T04=>35=>38", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "250", "Store Name"=> "Commerce", "UPH"=> "322.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "357297", "challenge_id"=> "1034", "challenge_type"=> "equipment", "coach_edit"=> "0", "complete_minutes"=> "46.0", "complete_units"=> "250.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-06-07", "finish_datetime"=> "2017-06-07T16=>56=>48", "full_name"=> "Marie Perez", "goal_minutes"=> "60.0", "goal_units"=> "250", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "370034", "small_photo"=> "\\N", "start_date"=> "2017-06-07", "start_datetime"=> "2017-06-07T16=>10=>17", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast" },
          %{ "Goal"=> "100", "Store Name"=> "Commerce", "UPH"=> "58.0", "UPH Standard"=> "Factory EAS", "athlete_id"=> "358702", "challenge_id"=> "1102", "challenge_type"=> "product refill", "coach_edit"=> "0", "complete_minutes"=> "1.0", "complete_units"=> "60.0", "dimension"=> "Factory", "district"=> "FS21", "finish_date"=> "2017-07-06", "finish_datetime"=> "2017-07-06T04=>38=>18", "full_name"=> "Brittany Tran", "goal_minutes"=> "36.0", "goal_units"=> "60", "issue_capacity"=> "0", "issue_other"=> "0", "issue_pulled"=> "0", "issue_space"=> "0", "issue_vas"=> "0", "six_digit_login"=> "373519", "small_photo"=> "\\N", "start_date"=> "2017-07-06", "start_datetime"=> "2017-07-06T03=>37=>15", "store_id"=> "2", "team_challenge"=> "0", "territory"=> "Southeast"}
        ],
        parents: "",
        realm: "nike",
        remote_ip: "127.0.0.1",
        type: "challenge"
      },
      actuals_per_store: %DB.Event{
        domain: "stats",
        entity_id: "81bc429d-d055-4002-a64f-59e1af501236",
        event_id: "5a0c95a6-6334-11e7-92f2-4de700000259",
        kv: "dev_events/5a0c95a6-6334-11e7-92f2-4de700000259",
        kv_time: "2017-07-07T16=>50=>15.831287Z",
        meta: [
          %{"Count"=> "400", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-02" },
          %{"Count"=> "534", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-02" },
          %{"Count"=> "\\N", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-03" },
          %{"Count"=> "822", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-03" },
          %{"Count"=> "1", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-04" },
          %{"Count"=> "776", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-04" },
          %{"Count"=> "1495", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-05" },
          %{"Count"=> "463", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-05" },
          %{"Count"=> "754", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-06" },
          %{"Count"=> "416", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-06" },
          %{"Count"=> "197", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-07" },
          %{"Count"=> "393", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-07" },
          %{"Count"=> "367", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-08" },
          %{"Count"=> "486", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-08" },
          %{"Count"=> "186", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-09" },
          %{"Count"=> "1003", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-09" },
          %{"Count"=> "35", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-10" },
          %{"Count"=> "1086", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-10" },
          %{"Count"=> "\\N", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-11" },
          %{"Count"=> "1042", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-11" },
          %{"Count"=> "151", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-12" },
          %{"Count"=> "546", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-12" },
          %{"Count"=> "25", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-13" },
          %{"Count"=> "574", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-13" },
          %{"Count"=> "\\N", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-14" },
          %{"Count"=> "535", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-14" },
          %{"Count"=> "\\N", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-15" },
          %{"Count"=> "584", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-15" },
          %{"Count"=> "3088", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-16" },
          %{"Count"=> "730", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-16" },
          %{"Count"=> "\\N", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-17" },
          %{"Count"=> "1184", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-17" },
          %{"Count"=> "\\N", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-18" },
          %{"Count"=> "1027", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-18" },
          %{"Count"=> "1165", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-19" },
          %{"Count"=> "326", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-19" },
          %{"Count"=> "780", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-20" },
          %{"Count"=> "392", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-20" },
          %{"Count"=> "1315", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-21" },
          %{"Count"=> "271", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-21" },
          %{"Count"=> "1114", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-22" },
          %{"Count"=> "308", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-22" },
          %{"Count"=> " 914.00", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-23" },
          %{"Count"=> "623", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-23" },
          %{"Count"=> "\\N", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-24" },
          %{"Count"=> "1029", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-24" },
          %{"Count"=> "\\N", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-25" },
          %{"Count"=> "1041", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-25" },
          %{"Count"=> "1391", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-26" },
          %{"Count"=> "1342", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-27" },
          %{"Count"=> "765", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-28" },
          %{"Count"=> "280", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-26" },
          %{"Count"=> "273", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-27" },
          %{"Count"=> "306", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-28" },
          %{"Count"=> "1259", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-29" },
          %{"Count"=> "329", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-29" },
          %{"Count"=> "1833", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-06-30" },
          %{"Count"=> "\\N", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-07-01" },
          %{"Count"=> "\\N", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-07-02" },
          %{"Count"=> "2995", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-07-03" },
          %{"Count"=> "649", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-06-30" },
          %{"Count"=> "1082", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-07-01" },
          %{"Count"=> "995", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-07-02" },
          %{"Count"=> "806", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-07-03" },
          %{"Count"=> "\\N", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-07-04" },
          %{"Count"=> "2223", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-07-05" },
          %{"Count"=> "684", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-07-04" },
          %{"Count"=> "292", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-07-05" },
          %{"Count"=> "2514", "Metrics"=> "Actual Receipts", "Store"=> "2", "Week"=> "2017-07-06" },
          %{"Count"=> "889", "Metrics"=> "Actual Units Sold", "Store"=> "2", "Week"=> "2017-07-06" }
        ],
        parents: "",
        realm: "nike",
        remote_ip: "127.0.0.1",
        type: "actuals"
      },
      bin_audit_per_store: %DB.Event{domain: "stats", entity_id: "81bc429d-d055-4002-a64f-59e1af501236",
       event_id: "13cbdab4-6331-11e7-80ab-4de700000259",
       kv: "dev_events/13cbdab4-6331-11e7-80ab-4de700000259",
       kv_time: "2017-07-07T16:26:49.476370Z",
       meta: [%{"BIN_COUNT_TOTAL" => "0", "BIN_PERCENTAGE" => "0.0", "DATE" => "\\N",
          "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "0", "PASSED_BIN_COUNT" => "0", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "1",
          "_BATCH_LAST_RUN_" => "2017-01-18T22:21:04", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "20", "BIN_PERCENTAGE" => "65.0",
          "DATE" => "2017-01-25", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "13", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "2",
          "_BATCH_LAST_RUN_" => "2017-01-30T22:39:54", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "40", "BIN_PERCENTAGE" => "70.0",
          "DATE" => "2017-02-06", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "2", "PASSED_BIN_COUNT" => "28", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "3",
          "_BATCH_LAST_RUN_" => "2017-02-14T23:38:17", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "20", "BIN_PERCENTAGE" => "75.0",
          "DATE" => "2017-02-10", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "15", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "3",
          "_BATCH_LAST_RUN_" => "2017-02-14T23:38:17", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "20", "BIN_PERCENTAGE" => "50.0",
          "DATE" => "2017-02-16", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "10", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "4",
          "_BATCH_LAST_RUN_" => "2017-02-21T18:21:43", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "20", "BIN_PERCENTAGE" => "55.0",
          "DATE" => "2017-02-17", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "11", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "4",
          "_BATCH_LAST_RUN_" => "2017-02-21T18:21:43", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "20", "BIN_PERCENTAGE" => "35.0",
          "DATE" => "2017-02-25", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "7", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "5",
          "_BATCH_LAST_RUN_" => "2017-02-27T22:19:09", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "44", "BIN_PERCENTAGE" => "36.3636363",
          "DATE" => "2017-03-02", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "3", "PASSED_BIN_COUNT" => "16", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "6",
          "_BATCH_LAST_RUN_" => "2017-03-08T17:15:47", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "20", "BIN_PERCENTAGE" => "50.0",
          "DATE" => "2017-03-06", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "10", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "7",
          "_BATCH_LAST_RUN_" => "2017-03-13T18:10:26", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "20", "BIN_PERCENTAGE" => "40.0",
          "DATE" => "2017-03-13", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "8", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "8",
          "_BATCH_LAST_RUN_" => "2017-03-21T18:02:51", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "20", "BIN_PERCENTAGE" => "45.0",
          "DATE" => "2017-03-23", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "9", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "9",
          "_BATCH_LAST_RUN_" => "2017-03-30T16:31:01", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "20", "BIN_PERCENTAGE" => "55.0",
          "DATE" => "2017-03-27", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "11", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "10",
          "_BATCH_LAST_RUN_" => "2017-04-03T22:41:27", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "20", "BIN_PERCENTAGE" => "60.0",
          "DATE" => "2017-04-18", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "12", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "11",
          "_BATCH_LAST_RUN_" => "2017-04-24T22:08:31", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "20", "BIN_PERCENTAGE" => "60.0",
          "DATE" => "2017-04-18", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "12", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "12",
          "_BATCH_LAST_RUN_" => "2017-04-24T22:08:33", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "22", "BIN_PERCENTAGE" => "45.4545454",
          "DATE" => "2017-05-01", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "2", "PASSED_BIN_COUNT" => "10", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "13",
          "_BATCH_LAST_RUN_" => "2017-05-09T19:09:09", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "20", "BIN_PERCENTAGE" => "45.0",
          "DATE" => "2017-05-09", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "9", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "14",
          "_BATCH_LAST_RUN_" => "2017-05-15T18:16:13", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "20", "BIN_PERCENTAGE" => "35.0",
          "DATE" => "2017-05-16", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "7", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "15",
          "_BATCH_LAST_RUN_" => "2017-05-22T16:51:21", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "25", "BIN_PERCENTAGE" => "52.0",
          "DATE" => "2017-05-23", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "2", "PASSED_BIN_COUNT" => "13", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "16",
          "_BATCH_LAST_RUN_" => "2017-06-07T18:17:28", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "20", "BIN_PERCENTAGE" => "70.0",
          "DATE" => "2017-06-07", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "14", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "17",
          "_BATCH_LAST_RUN_" => "2017-06-13T19:30:13", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "4", "BIN_PERCENTAGE" => "100.0",
          "DATE" => "2017-06-13", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "4", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "18",
          "_BATCH_LAST_RUN_" => "2017-06-19T16:28:32", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "20", "BIN_PERCENTAGE" => "65.0",
          "DATE" => "2017-06-21", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "13", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "19",
          "_BATCH_LAST_RUN_" => "2017-06-26T18:05:05", "store_id" => "2"},
        %{"BIN_COUNT_TOTAL" => "20", "BIN_PERCENTAGE" => "75.0",
          "DATE" => "2017-06-27", "Dimension" => "Factory", "District" => "FS21",
          "NO_OF_AUDITS_PERFORMED" => "1", "PASSED_BIN_COUNT" => "15", "STORE" => "2",
          "Store Name" => "Commerce", "Territory" => "Southeast",
          "UPH Standard" => "Factory EAS", "_BATCH_ID_" => "20",
          "_BATCH_LAST_RUN_" => "2017-07-05T21:07:49", "store_id" => "2"}],
       parents: "", realm: "nike", remote_ip: "127.0.0.1", type: "bin_audit"},

        ]}
    end






























#   test "points 89" do
#     assert(Service.Stats.percentage_score(0.89) == 0)
#   end
#
#   test "points 90" do
#     assert(Service.Stats.percentage_score(0.9) == 5)
#   end
#
#   test "points 100" do
#     assert(Service.Stats.percentage_score(1.0) == 10)
#   end
#
#   test "points 120" do
#     assert(Service.Stats.percentage_score(1.2) == 15)
#   end
#
#
#   test "date" do
#     assert(Service.Stats.date("5/30/2017") == 1496160000000)
#   end
#
#   test "get_timestamp", context do
#     assert(Service.Stats.get_timestamp({:pre_challenge, context[:stats_delete_event]})==1497634860000)
#   end
#
#   test "get timestamp bin_audit", context do
#     assert(Service.Stats.get_timestamp({:bin_audit, context[:stats_bin_audit_event]}) == 1497715200000)
#   end
#
#   test "get timestamp actual", context do
#     assert(Service.Stats.get_timestamp({:actuals, context[:stats_pre_actual_event]}) == 1497715200000)
#   end
#
#   test "find_period" do
#     assert(Service.Stats.find_period(1497855700000, Season1periods)== "season1week1")
#   end
#
#   test "get_period_model" do
#     assert(Service.Stats.get_period_model("season1week5",
#     %{
#       "store_id" => 567,
#       "season" => 1,
#       "stats" => %{
#         "season1week4" => %{"pre" => "somedata"},
#         "season1week5" => %{"pre" => "somedifferentdata"}
#       }
#       }) == %{"pre" => "somedifferentdata"})
#   end
#
#   test "get_period_model no match" do
#     assert(Service.Stats.get_period_model("season1week2",
#     %{
#       "store_id" => 567,
#       "season" => 1,
#       "stats" => %{
#         "season1week4" => %{"pre" => "somedata"},
#         "season1week5" => %{"pre" => "somedifferentdata"}
#       }
#       }) == %{})
#   end
#
#
#
# test " get timestamp and find period", context do
#   assert(Service.Stats.get_timestamp(context[:event_from_perhap])
#   |> Service.Stats.find_period(Application.get_env(:reducers, :current_periods))== "season1preseason")
# end
#
# test "date 2017-05-06" do
#   assert(Service.Stats.date("2017-05-06")== 1494086400000)
# end
#
# test "date 0" do
#   assert(Service.Stats.date("0")== 1494287000000)
# end
#
# test "date 05/23/2017" do
#   assert(Service.Stats.date("05/23/2017")== 1495555200000)
# end
#
# test "get store id" do
#   event = %{
#     domain: "stats",
#     entity_id: "e38de111-d823-4345-a509-61b9a23ac7d0",
#     event_id: "0d6af038-4f4f-11e7-8ca9-abb700000255",
#     kv: "prodevents/0d6af038-4f4f-11e7-8ca9-abb700000255",
#     kv_time: "",
#     data: %{
#       "Count"=> "",
#       "Metrics"=> "Actual Receipts",
#       "Store"=> "100049",
#       "Week"=> "2017-06-07"
#     },
#     realm: "nike",
#     remote_ip: "127.0.0.1",
#     type: "actuals"
#   }
#
#   assert(Service.Stats.get_store_num({:pre_actual, event})==100049)
# end
#

end
