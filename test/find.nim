import unittest
include nre

suite "find":
  test "find text":
    check("3213a".find(initRegex(r"[a-z]")).get.match == "a")
    check("1 2 3 4 5 6 7 8 ".findAll(initRegex(r" ", "S")).map(
      proc (a: RegexMatch): string = a.match
    ) == @[" ", " ", " ", " ", " ", " ", " ", " "])

  test "find bounds":
    check("1 2 3 4 5 ".findAll(initRegex(r" ", "S")).map(
      proc (a: RegexMatch): Slice[int] = a.matchBounds
    ) == @[1..2, 3..4, 5..6, 7..8, 9..10])