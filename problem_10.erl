%%%
%%% Exercise N.10
%%% Run-length encoding of a list. 
%%% Use the result of problem P09 to implement the 
%%% so-called run-length encoding data compression method. 
%%% Consecutive duplicates of elements are encoded 
%%% as lists (N E) where N is the number of duplicates of 
%%% the element E.
%%% [a, a, a, a, b, c, c, a, a, d, e, e, e, e] -->
%%% [[4, a], [1, b], [2, c], [2, a], [1, d], [4, e]]
%%%

-module(problem_10).
-export([encode/1]).
-include_lib("eunit/include/eunit.hrl").

encode(List) ->
    PackedLists = problem_9:pack(List),
    map(PackedLists, fun(PackedList) ->
			    [count(PackedList), first(PackedList)]
		     end).

map(List, Fun) ->
    [Fun(Elem) || Elem <- List].

count(List) ->
    count_helper(List, 0).

count_helper([], Counter) ->
    Counter;
count_helper([_|Tail], Counter) ->
    count_helper(Tail, Counter + 1).

first([Head|_Tail]) ->
    Head.


-ifdef(TEST).

should_encode_list_test() ->
    ?assertEqual(
       [[4, a], [1, b], [2, c], [2, a], [1, d], [4, e]],
       problem_10:encode(
	 [a, a, a, a, b, c, c, a, a, d, e, e, e, e]
	)
      ).

-endif.
