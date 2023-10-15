%%%-------------------------------------------------------------------
%%% @author robin
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Oct. 2023 2:02 p.m.
%%%-------------------------------------------------------------------
-module(myprocess).
-author("robin").

%% API
-export([run/0, say/2]).

say(_What, 0) ->
  done;
say(What, Times) ->
  io:fwrite(What ++ "\n"),
  say(What, Times - 1).

%% spawn can only access functions in the module that are exported
%% so we have ot export "say" even though it's used internally
run() ->
  spawn(myprocess, say, ["Hi", 3]),
  spawn(myprocess, say, ["Bye", 3]).
