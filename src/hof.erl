%%%-------------------------------------------------------------------
%%% @author robin
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Oct. 2023 10:26 a.m.
%%%-------------------------------------------------------------------
-module(hof).
-author("robin").

%% API
-export([double/0]).

double() ->
  F = fun(X) -> 2 * X end,
  map(F, [1,2,5,7,4,6]).

map(_F, []) ->
  [];
map(F, [First | Rest]) ->
  [F(First) | map(F, Rest)].
