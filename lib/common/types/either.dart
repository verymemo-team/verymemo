sealed class Either<L, R> {
  const Either();
  factory Either.left(L l) => Left(l);
  factory Either.right(R r) => Right(r);

  // Either.fromJson(Map<String, dynamic> map);
  factory Either.fromJson(Map<String, dynamic> map) {
    if (map.containsKey('left')) {
      return Either.left(map['left']);
    } else {
      return Either.right(map['right']);
    }
  }

  T fold<T>(T Function(L) left, T Function(R) right) => switch (this) {
        Left(:final value) => left(value),
        Right(:final value) => right(value),
      };
  bool isLeft() => switch (this) {
        Left() => true,
        Right() => false,
      };
  bool isRight() => !isLeft();
}

class Left<L, R> extends Either<L, R> {
  final L _l;
  const Left(this._l);
  L get value => _l;
}

class Right<L, R> extends Either<L, R> {
  final R _r;
  const Right(this._r);
  R get value => _r;
}
