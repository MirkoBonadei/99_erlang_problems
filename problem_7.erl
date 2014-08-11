%%%
%%% Exercise N.7
%%% Flatten a nested list structure.
%%% Transform a list, possibly holding lists as elements into 
%%% a "flat" list by replacing each list with its elements 
%%% (recursively). 
%%% [a, [b, [c, d], e]] ---> [a, b, c, d, e]
%%%

-module(problem_7).
-export([flatten/1]).
-include_lib("eunit/include/eunit.hrl").

flatten(List) ->
    flatten_helper(List, []).

flatten_helper([Head|Tail], Acc) when is_list(Head) ->
    flatten_helper(Head, flatten_helper(Tail, Acc));
flatten_helper([Head|Tail], Acc) ->
    [Head|flatten_helper(Tail, Acc)];
flatten_helper([], Acc) ->
    Acc.

-ifdef(TEST).

should_flatten_a_nested_list_test_() ->
    [
     ?_assertEqual(
	[a, b, c, d, e], 
	problem_7:flatten([a, [b, [c, d], e]])
       ),
     ?_assertEqual(
	[],
	problem_7:flatten([])
       ),
     ?_assertEqual(
	[a, b, c, d, e, f, g, h, i],
	problem_7:flatten([[a], [b, [c, [d], [e]], f], g, [h], [i]])
       )
    ].

-endif.
