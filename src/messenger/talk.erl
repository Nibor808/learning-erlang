%%%-------------------------------------------------------------------
%%% @author robin
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Oct. 2023 2:12 p.m.
%%%-------------------------------------------------------------------
-module(talk).
-author("robin").

%% API
-export([run/0, alice/0, bob/1]).

alice() ->
%% receive a message and pattern match on it
  receive
    message ->
      io:fwrite("Alice got a message\n"),
      bob ! message,
%% restart alice func to listen for more messages
      alice();
    finished ->
      io:fwrite("ALice is finished\n")
  end.

%% guard
bob(0) ->
  alice ! finished,
  io:fwrite("Bob is finished\n");

bob(N) ->
%%  send a message to the PId alias "alice" using the "!" operator
  alice ! message,
  receive
    message ->
      io:fwrite("Bob got a message\n")
  end,
  bob(N-1).



run() ->
%%  register(atom, Pid)
%%  uses atoms to refer to PIds instead of passing Pid around
%%  register doesn't return a PId the same way spawn does
  register(alice, spawn(talk, alice, [])),
  register(bob, spawn(talk, bob, [3])).

%%  Passing PId
%%  start alice listening
%%  PId = spawn(talk, alice, []),
%%  start bob talking to alice passing alice's PId
%%  spawn(talk, bob, [3, PId]).
