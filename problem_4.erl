%%%
%%% Exercise N.4
%%% Find the number of elements of a list.
%%% [a, b, c, d, e] ---> 5
%%% "Hello, world!" ----> 13
%%% [] ---> 0
%%%

-module(problem_4).
-export([lenght/1]).
-include_lib("eunit/include/eunit.hrl").

lenght(List) ->
  lenght_app(List, 0).

lenght_app([], Counter) ->
  Counter;
lenght_app([_Head|Tail], Counter) ->
  lenght_app(Tail, Counter + 1).

-ifdef(TEST).

should_count_the_lenght_of_a_list_test_() ->
    [
        ?_assertEqual(0, problem_4:lenght([])),
        ?_assertEqual(1, problem_4:lenght([a])),
        ?_assertEqual(4, problem_4:lenght([a, b, c, d]))
    ].

should_count_the_lenght_of_a_string_test_() ->
    [
        ?_assertEqual(0, problem_4:lenght("")),
        ?_assertEqual(1, problem_4:lenght("a")),
        ?_assertEqual(13, problem_4:lenght("Hello, world!"))
    ].

-endif.
