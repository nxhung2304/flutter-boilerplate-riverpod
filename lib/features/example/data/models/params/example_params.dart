import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_params.freezed.dart';
part 'example_params.g.dart';

@freezed
sealed class ExampleParams with _$ExampleParams {
  const factory ExampleParams({required String title}) = _ExampleParams;

  factory ExampleParams.fromJson(Map<String, dynamic> json) =>
      _$ExampleParamsFromJson(json);
}
