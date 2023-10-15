%%%-------------------------------------------------------------------
%%% @author robin
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Oct. 2023 2:39 p.m.
%%%-------------------------------------------------------------------
-module(longdistance).
-author("robin").

%% API
-export([alice/0, bob/2, startAlice/0, startBob/1]).

alice() ->
%% receive a message and pattern match on it to get the return Node
  receive
    {message, BobNode} ->
      io:fwrite("Alice got a message\n"),
      BobNode ! message,
%% restart alice func to listen for more messages
      alice();
    finished ->
      io:fwrite("ALice is finished\n")
  end.

%% guard
bob(0, AliceNode) ->
  {alice, AliceNode} ! finished,
  io:fwrite("Bob is finished\n");

bob(N, AliceNode) ->
%%  send a message to the the "AliceNode" machine
  {alice, AliceNode} ! {message, self()},
  receive
    message ->
      io:fwrite("Bob got a message\n")
  end,
  bob(N-1, AliceNode).

startAlice() ->
  register(alice, spawn(longdistance, alice, [])).

%% "AliceNode" is a Node/host address. Any machine with an IP address.
startBob(AliceNode) ->
  spawn(longdistance, bob, [3, AliceNode]).

