%%%-------------------------------------------------------------------
%%% @author robin
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Oct. 2023 10:19 a.m.
%%%-------------------------------------------------------------------
-module(myguards).
-author("robin").

%% API
-export([getType/1]).

getType(N) when N < 13 ->
  child;
getType(N) when N < 18 ->
  teen;
getType(_N) ->
  adult.
