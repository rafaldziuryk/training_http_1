import 'package:json_annotation/json_annotation.dart';

part 'cat_fact.g.dart';

@JsonSerializable()
class CatFact {
  @JsonKey(
    name: 'fact',
  )
  final String fact;

  @JsonKey(name: 'length')
  final int length;

  const CatFact({
    required this.fact,
    required this.length,
  });

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory CatFact.fromJson(Map<String, dynamic> json) => _$CatFactFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$CatFactToJson(this);
}
