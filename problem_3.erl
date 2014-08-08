%%%
%%% Exercise N.3
%%% Find the K'th element of a list.
%%% The first element in the list is number 1.
%%% [a, b, c, d, e], 3 ---> c
%%% [a], 5 ----> list_too_short
%%%

-module(problem_3).
-export([kth_element/2]).
-include_lib("eunit/include/eunit.hrl").

kth_element(_Position, []) ->
  throw(list_too_short);
kth_element(1, [Head|_Tail]) ->
  Head;
kth_element(Position, [_Head|Tail]) ->
  kth_element(Position - 1, Tail).

-ifdef(TEST).

should_find_the_kth_element_of_a_list_test_() ->
    [
        ?_assertEqual(a, problem_3:kth_element(1, [a])),
        ?_assertEqual(b, problem_3:kth_element(2, [a, b, c])),
        ?_assertEqual(c, problem_3:kth_element(3, [a, b, c, d, e])),
        ?_assertEqual(d, problem_3:kth_element(4, [a, b, c, d]))
    ].

should_throw_list_too_short_test_() ->
    [
        ?_assertThrow(list_too_short, problem_3:kth_element(10, [a, b, c])),
        ?_assertThrow(list_too_short, problem_3:kth_element(5, [a]))
    ].

-endif.
