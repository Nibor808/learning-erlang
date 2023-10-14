%%%-------------------------------------------------------------------
%%% @author robin
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Oct. 2023 7:45 a.m.

% -module - container for functions - name = hw
% "."- EOL
% -export marker for module - which functions are public? func name + arity
%%%-------------------------------------------------------------------
-module(hw).
-author("robin").

%% API
-export([helloworld/0, helloworld/1]).

%% open shell erl -> c(hw). = compile file
helloworld() ->
  "Hello World!".

helloworld(X) ->
  "Hello " ++ X.
