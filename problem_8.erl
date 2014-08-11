%%%
%%% Exercise N.8
%%% Eliminate consecutive duplicates of list elements.
%%% If a list contains repeated elements they should be 
%%% replaced with a single copy of the element. 
%%% The order of the elements should not be changed. 
%%% [a, a, a, a, b, c, c, a, a, d, e, e, e, e] --> [a, b, c, a, d, e]
%%%

-module(problem_8).
-export([drop_consecutive_dups/1]).
-include_lib("eunit/include/eunit.hrl").

drop_consecutive_dups(List) ->
    drop_consecutive_dups_helper(List, []).

drop_consecutive_dups_helper([], Acc) ->
    reverse(Acc);
drop_consecutive_dups_helper([Head|Tail], [Head|TailAcc]) ->
    drop_consecutive_dups_helper(Tail, [Head|TailAcc]);
drop_consecutive_dups_helper([Head|Tail], Acc) ->
    drop_consecutive_dups_helper(Tail, [Head|Acc]).

reverse(List) ->
    reverse_helper(List, []).

reverse_helper([], Acc) ->
    Acc;
reverse_helper([Head|Tail], Acc) ->
    reverse_helper(Tail, [Head|Acc]).



-ifdef(TEST).

should_drop_consecutive_duplicates_test_() ->
    [
     ?_assertEqual(
	[a, b, c], 
	problem_8:drop_consecutive_dups([a, a, a, b, c, c, c])
       ),
     ?_assertEqual(
	[],
	problem_8:drop_consecutive_dups([])
	)
    ].

-endif.
