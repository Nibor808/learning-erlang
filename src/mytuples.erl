%%%-------------------------------------------------------------------
%%% @author robin
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Oct. 2023 8:34 a.m.
%%%-------------------------------------------------------------------
-module(mytuples).
-author("robin").

%% API
-export([convert/1, convert/2]).

convert(F, fahrenheit) ->
  (F -32) * 5/9;
convert(C, celsius) ->
  C * 9 / 5 + 32.

convert({fahrenheit, X}) ->
  Y = (X - 32) * 5 / 9,
  {celsius, Y};
convert({celsius, X}) ->
  Y = X * 5/ 9 + 32,
  {fahrenheit, Y}.
