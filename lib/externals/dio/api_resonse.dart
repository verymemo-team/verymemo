import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verymemo/common/types/typedef.dart';
part 'api_resonse.freezed.dart';
part 'api_resonse.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class ApiResonse<T> with _$ApiResonse<T> {
  factory ApiResonse({
    T? data,
  }) = _ApiResponse;

  factory ApiResonse.fromJson(MAP map, T Function(Object?) mapper) =>
      _$ApiResonseFromJson(map, mapper);
}
