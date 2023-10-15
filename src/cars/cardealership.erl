%%%-------------------------------------------------------------------
%%% @author robin
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Oct. 2023 11:10 a.m.
%%%-------------------------------------------------------------------
-module(cardealership).
-author("robin").

%% IMPORTS
-import(data, [getPriceForCar/1]).

%% API
-export([listPrices/1, getPricesForCar/1]).
-define(CURRENCIES, [eur, gbp]).

formatPrice(Price) ->
  "$" ++ integer_to_list(Price).

convert(Currency, Price) ->
  case Currency of
    eur -> formatPrice(round(Price * 0.9));
    gbp -> formatPrice(round(Price * 0.75));
    _ -> formatPrice(Price)
end.

getPricesForCar(Car) ->
  case getPriceForCar(Car) of
      {error, no_car_found} -> {error, "Cannot find " ++ Car};
      Price ->  lists:map(fun(X) -> {X, convert(X, Price)} end, ?CURRENCIES)
  end.

listPrices(Currency) ->
  CarList = data:getCars(),
  printPrice(CarList, Currency).

printPrice([], _Currency) ->
  true;
printPrice([Car | Rest], Currency) ->
  PriceMap = data:getPrices(),
  Price = maps:get(Car, PriceMap),
  ConvertedPrice = convert(Currency, Price),
  io:fwrite("THe price for " ++ Car ++ " is " ++ ConvertedPrice ++ "\n"),
  printPrice(Rest, Currency).




