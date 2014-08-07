%%%
%%% Exercise N.1
%%% Find the last but one element of a list
%%% [1,2,3,4] ---> 3
%%% [] ----> empty_list
%%% [1] ----> list_too_short
%%%

-module(problem_2).
-export([find_last_but_one_element/1]).
-include_lib("eunit/include/eunit.hrl").

find_last_but_one_element([]) ->
    throw(empty_list);
find_last_but_one_element([_Elem]) ->
    throw(list_too_short);
find_last_but_one_element([LastButOne|[_LastElement]]) ->
  LastButOne;
find_last_but_one_element([_Head|Tail]) ->
  find_last_but_one_element(Tail).

-ifdef(TEST).

last_but_one_element_of_a_non_empty_list_test() ->
    ?assertEqual(3, problem_2:find_last_but_one_element([1, 2, 3, 4])).

last_but_one_element_of_an_empty_list_test() ->
    ?assertThrow(empty_list, problem_2:find_last_but_one_element([])).

last_but_one_element_of_a_one_element_list_test() ->
    ?assertThrow(list_too_short, problem_2:find_last_but_one_element([1])).

-endif.
