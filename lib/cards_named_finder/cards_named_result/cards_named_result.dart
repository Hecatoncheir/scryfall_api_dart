import 'package:json_annotation/json_annotation.dart';

part 'cards_named_result.g.dart';

@JsonSerializable()
class CardsNamedResult {
  @JsonKey(name: 'object')
  final String? object;

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'oracle_id')
  final String? oracleId;

  @JsonKey(name: 'multiverse_ids')
  final List<int>? multiverseIds;

  @JsonKey(name: 'mtgo_id')
  final int? mtgoId;

  @JsonKey(name: 'mtgo_foil_id')
  final int? mtgoFoilId;

  @JsonKey(name: 'tcgplayer_id')
  final int? tcgplayerId;

  @JsonKey(name: 'cardmarket_id')
  final int? cardmarketId;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'lang')
  final String? lang;

  @JsonKey(
    name: 'released_at',
    fromJson: _releasedAtDateTimeFromJson,
    toJson: _releasedAtDateTimeToJson,
  )
  final DateTime? releasedAt;

  @JsonKey(name: 'uri')
  final String? uri;

  @JsonKey(name: 'scryfall_uri')
  final String? scryfallUri;

  CardsNamedResult({
    this.object,
    this.id,
    this.oracleId,
    this.multiverseIds,
    this.mtgoId,
    this.mtgoFoilId,
    this.tcgplayerId,
    this.cardmarketId,
    this.name,
    this.lang,
    this.releasedAt,
    this.uri,
    this.scryfallUri,
  });

  factory CardsNamedResult.fromJson(Map<String, dynamic> json) =>
      _$CardsNamedResultFromJson(json);

  Map<String, dynamic> toJson() => _$CardsNamedResultToJson(this);

  static _releasedAtDateTimeFromJson(String? encodedDate) {
    if (encodedDate == null) return null;
    return DateTime.parse(encodedDate);
  }

  static _releasedAtDateTimeToJson(DateTime? dateTime) {
    return dateTime?.toIso8601String();
  }
}
