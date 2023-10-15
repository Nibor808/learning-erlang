%%%-------------------------------------------------------------------
%%% @author robin
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Oct. 2023 2:37 p.m.
%%%-------------------------------------------------------------------
-module(data).
-author("robin").

%% API
-export([getAllData/0, getPriceForCar/1, getCar/1]).
-define(PRICES, #{"BMW i8" => 15000, "Lamborghini Huracan" => 500000, "Ferrari f12" => 700000}).
-define(CARS, ["BMW i8", "Lamborghini Huracan", "Ferrari f12"]).

getAllData() ->
  {ok, #{"Prices" => ?PRICES, "Cars" => ?CARS}}.

getCar(Car) ->
  lists:filter(fun(X) -> X == Car end,  ?CARS).

getPriceForCar(Car) ->
  case getCar(Car) of
    []  -> {error, no_car_found};
    [FoundCar] -> maps:get(FoundCar, ?PRICES)
end.


