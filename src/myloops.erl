%%%-------------------------------------------------------------------
%%% @author robin
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Oct. 2023 10:49 a.m.
%%%-------------------------------------------------------------------
-module(myloops).
-author("robin").

%% API
-export([greet/1]).

%% no loops -> recursive
%% stop condition
greet([]) ->
  {done, true};

greet([First | Rest]) ->
  erlang:display("LOG ===> " ++ First),
  greet(Rest).
