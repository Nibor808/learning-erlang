%%%-------------------------------------------------------------------
%%% @author robin
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Oct. 2023 8:07 a.m.
%%%-------------------------------------------------------------------
-module(myfunctions).
-author("robin").

%% API
-export([factorial/1, factorialR/1]).

%% multi clause function - can be used instead of overloading
factorial(1) ->
  1;
factorial(N) ->
  N.

%% recursive function
factorialR(1) ->
  1;
factorialR(N) ->
  N * factorialR(N-1).
