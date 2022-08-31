import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  dynamic temp;
  dynamic feels;

  Weather({
    this.feels,
    this.temp,
  });
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
