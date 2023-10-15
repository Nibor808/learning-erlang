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
-export([getConvertedPricesForCar/1]).
-define(CURRENCIES, [eur, gbp]).

formatPrice(Price) ->
  "$" ++ integer_to_list(Price).


convert(Currency, Price) ->
  case Currency of
    eur -> {Currency, formatPrice(round(Price * 0.9))};
    gbp -> {Currency, formatPrice(round(Price * 1.2))};
    _ -> Price
end.

getConvertedPricesForCar(Car) ->
  Price = getPriceForCar(Car),
  erlang:display(Price),
  lists:map(fun(X) -> convert(X, Price) end, ?CURRENCIES).



