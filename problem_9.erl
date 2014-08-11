%%%
%%% Exercise N.9
%%% Pack consecutive duplicates of list 
%%% elements into sublists. 
%%% If a list contains repeated elements 
%%% they should be placed in separate sublists.
%%% [a, a, a, a, b, c, c, a, a, d, e, e, e, e] -->
%%% [[a, a, a, a], [b], [c, c], [a, a],  [d], [e, e, e, e]] 
%%%

-module(problem_9).
-export([pack/1]).
-include_lib("eunit/include/eunit.hrl").

pack([]) ->
    [];
pack(List) ->
    pack_helper(List, [], []).

pack_helper([], LastPack, Acc) ->
    reverse([LastPack|Acc]);
pack_helper([Head|Tail], [Head|PackTail], Acc) ->
    pack_helper(Tail, [Head, Head|PackTail], Acc);
pack_helper([Head|Tail], [], Acc) ->
    pack_helper(Tail, [Head], Acc);
pack_helper([Head|Tail], Pack, Acc) ->
    pack_helper(Tail, [Head], [Pack|Acc]).

reverse(List) ->
    reverse_helper(List, []).

reverse_helper([], Acc) ->
    Acc;
reverse_helper([Head|Tail], Acc) ->
    reverse_helper(Tail, [Head|Acc]).

-ifdef(TEST).

should_pack_list_elements_test_() ->
    [
     ?_assertEqual(
	[[a, a, a, a], [b], [c, c], [a, a],  [d], [e, e, e, e]],
	problem_9:pack(
	  [a, a, a, a, b, c, c, a, a, d, e, e, e, e]
	  )
       ),
     ?_assertEqual([], problem_9:pack([]))
    ].

-endif.
