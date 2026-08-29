extension IntExtension on int {
  String ordinal() => this >= 11 && this <= 13
      ? "${this}th"
      : switch (this % 10) {
          1 => "${this}st",
          2 => "${this}nd",
          3 => "${this}rd",
          _ => "${this}th",
        };

  String singleDigitAsText() => switch (this) {
    0 => "zero",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    _ => toStringWithSign(),
  };

  String toStringWithSign() => this >= 0 ? "+$this" : toString();
}
