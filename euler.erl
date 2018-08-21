-module(euler). 
-export([
         p1/0, 
         p2/0, 
         p3/0,
         p4/0,
         p5/0
]).

p1() ->
	lists:sum([X || X <- lists:seq(1, 1000 - 1), X rem 5 == 0 orelse X rem 3 == 0]).

p2() ->
	p2(1, 1, 0).
p2(P, T, Am) when T < 4000000 andalso T rem 2 == 0 ->
	NT = P + T,
	p2(T, NT, Am + T);
p2(P, T, Am) when T < 4000000 ->
	NT = P + T,
	p2(T, NT, Am);
p2(_, _, Am) -> Am.

p3() ->
  p3(600851475143, 2).
p3(N, I) ->
  miller_rabin:is_prime(I) andalso N rem I == 0 andalso io:fwrite("~p~n", [I]),
  p3(N, I+1).

p4() ->
  Size = 999,
  p4(Size, Size).
p4(N, M) when N > 900 andalso M > 900 ->
  Total = N * M,
  {A, B} = lists:split(3, integer_to_list(Total)),
  case A == lists:reverse(B) of
    true -> {N, M, Total};
    _ -> p4(N - 1, M)
  end;
p4(N, M) when N == 900 -> p4(999, M-1);
p4(_, _) -> true.

p5() ->
  p5(lists:seq(1, 20), 21).
p5(Numbers, Number) -> 
  io:fwrite("~p ~n", [Number]),
  p5([false || X <- Numbers, Number rem X /= 0], Numbers, Number).
p5([_|_], Numbers, Number) -> 
  p5(Numbers, Number + 1);
p5([], _, N) -> N.
