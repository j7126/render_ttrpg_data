extension IntExtension on int {
  String ordinal() => this >= 11 && this <= 13
      ? "${this}th"
      : switch (this % 10) {
          1 => "${this}st",
          2 => "${this}nd",
          3 => "${this}rd",
          _ => "${this}th",
        };
}
