%%%
%%% Exercise N.1
%%% Find the last element of a list
%%% [1,2,3,4] ---> 4
%%% [] ----> empty_list
%%%

-module(problem_1).
-export([find_last_element/1]).
-include_lib("eunit/include/eunit.hrl").

find_last_element([]) ->
    throw(empty_list);
find_last_element([LastElement]) ->
    LastElement;
find_last_element([_Head|Tail]) ->
    find_last_element(Tail).

-ifdef(TEST).

last_element_of_a_non_empty_list_test_() ->
    [
        ?_assertEqual(4, problem_1:find_last_element([1, 2, 3, 4])),
        ?_assertEqual(1, problem_1:find_last_element([1]))
    ].

last_element_of_an_empty_list_test() ->
  ?assertThrow(empty_list, problem_1:find_last_element([])).

-endif.
