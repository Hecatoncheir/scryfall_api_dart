// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_named_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardsNamedResult _$CardsNamedResultFromJson(Map<String, dynamic> json) =>
    CardsNamedResult(
      object: json['object'] as String?,
      id: json['id'] as String?,
      oracleId: json['oracle_id'] as String?,
      multiverseIds: (json['multiverse_ids'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      mtgoId: json['mtgo_id'] as int?,
      mtgoFoilId: json['mtgo_foil_id'] as int?,
      tcgplayerId: json['tcgplayer_id'] as int?,
      cardmarketId: json['cardmarket_id'] as int?,
      name: json['name'] as String?,
      lang: json['lang'] as String?,
      releasedAt: CardsNamedResult._releasedAtDateTimeFromJson(
          json['released_at'] as String?),
      uri: json['uri'] as String?,
      scryfallUri: json['scryfall_uri'] as String?,
    );

Map<String, dynamic> _$CardsNamedResultToJson(CardsNamedResult instance) =>
    <String, dynamic>{
      'object': instance.object,
      'id': instance.id,
      'oracle_id': instance.oracleId,
      'multiverse_ids': instance.multiverseIds,
      'mtgo_id': instance.mtgoId,
      'mtgo_foil_id': instance.mtgoFoilId,
      'tcgplayer_id': instance.tcgplayerId,
      'cardmarket_id': instance.cardmarketId,
      'name': instance.name,
      'lang': instance.lang,
      'released_at':
          CardsNamedResult._releasedAtDateTimeToJson(instance.releasedAt),
      'uri': instance.uri,
      'scryfall_uri': instance.scryfallUri,
    };
