%%%
%%% Exercise N.5
%%% Reverse a list.
%%% "A man, a plan, a canal, panama!" ---> "!amanap ,lanac a ,nalp a ,nam A"
%%% [1, 2, 3, 4] ---> [4, 3, 2, 1]
%%%

-module(problem_5).
-export([reverse/1]).
-include_lib("eunit/include/eunit.hrl").

reverse(List) ->
    reverse_acc(List, []).

reverse_acc([], ReversedList) ->
    ReversedList;
reverse_acc([Head|Tail], ReversedList) ->
    reverse_acc(Tail, [Head|ReversedList]).

-ifdef(TEST).

should_reverse_a_list_test_() ->
    [
        ?_assertEqual([], problem_5:reverse([])),
        ?_assertEqual([1], problem_5:reverse([1])),
        ?_assertEqual([4, 3, 2, 1], problem_5:reverse([1, 2, 3, 4]))
    ].

should_reverse_a_string_test_() ->
    [
        ?_assertEqual("", problem_5:reverse("")),
        ?_assertEqual("a", problem_5:reverse("a")),
        ?_assertEqual(
            "!amanap ,lanac a ,nalp a ,nam A",
            problem_5:reverse("A man, a plan, a canal, panama!")
        )
    ].

-endif.
