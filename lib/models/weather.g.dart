// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      feels: json['feels'],
      temp: json['temp'],
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels': instance.feels,
    };
