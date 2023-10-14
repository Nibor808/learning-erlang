%%%-------------------------------------------------------------------
%%% @author robin
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Oct. 2023 8:20 a.m.
%%%-------------------------------------------------------------------
-module(myatoms).
-author("robin").

%% API
-export([convert/2]).

%% Capital case for variables
%% lower case for atoms - just a name, does not take assignment
%% temp:convert(10, kelvin).
%% ** exception error: no function clause matching temp:convert(10,kelvin) (temp.erl, line 15)

%% funcs are first class
%% 21> temp:convert(temp:convert(100, fahrenheit), celsius).
%% 100.0
convert(F, fahrenheit) ->
  (F -32) * 5/9;
convert(C, celsius) ->
  C * 9 / 5 + 32.
