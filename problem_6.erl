%%%
%%% Exercise N.6
%%% Find out whether a list is a palindrome.
%%% A palindrome can be read forward or backward; e.g. (x a m a x).
%%% [1, 2, 3] --> false
%%% "madamimadam" --> true
%%% [1,2,4,8,16,8,4,2,1] --> true
%%%

-module(problem_6).
-export([is_palindrome/1]).
-include_lib("eunit/include/eunit.hrl").

is_palindrome(List) ->
    is_palindrome_helper(List, reverse(List)).

is_palindrome_helper(List, List) ->
    true;
is_palindrome_helper(_, _) ->
    false.

reverse(List) ->
    reverse_helper(List, []).

reverse_helper([], ReversedList) ->
    ReversedList;
reverse_helper([Head|Tail], ReversedList) ->
    reverse_helper(Tail, [Head|ReversedList]).


-ifdef(TEST).

should_detect_palindrome_list_test_() ->
    [
        ?_assert(not(problem_6:is_palindrome([1, 2, 3]))),
        ?_assert(not(problem_6:is_palindrome([a, b, a, c]))),
        ?_assert(problem_6:is_palindrome([a, b, a])),
        ?_assert(problem_6:is_palindrome([a])),
        ?_assert(problem_6:is_palindrome([]))
    ].

should_detect_palindrome_string_test_() ->
    [
        ?_assert(not(problem_6:is_palindrome("123"))),
        ?_assert(not(problem_6:is_palindrome("abac"))),
        ?_assert(problem_6:is_palindrome("madamimadam")),
        ?_assert(problem_6:is_palindrome("a")),
        ?_assert(problem_6:is_palindrome(""))
    ].

-endif.
