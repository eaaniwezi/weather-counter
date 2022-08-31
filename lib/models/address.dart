import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  String? label;

  Address({
    this.label,
  });
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
