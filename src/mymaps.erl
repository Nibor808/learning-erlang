%%%-------------------------------------------------------------------
%%% @author robin
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Oct. 2023 8:47 a.m.

%%%-------------------------------------------------------------------
-module(mymaps).
-author("robin").

%% API
-export([getAge/1]).

getAge(Name) ->
  AgeMap = #{"Alice" => 23, "Bob" => 25, "Carol" => 29},
  maps:get(Name, AgeMap, -1).
