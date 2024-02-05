import 'package:http/http.dart' as http;

import 'dart:convert';

import 'cards_named_result/cards_named_result.dart';
export 'cards_named_result/cards_named_result.dart';

class CardsNamedFinder {
  static const String url = 'https://api.scryfall.com/cards/named';
  const CardsNamedFinder();

  static Future<CardsNamedResult?> named({
    String? exact,
    String? fuzzy,
    String? set,
    String? format,
    String? face,
    String? version,
    bool? pretty,
  }) async {
    assert(exact != null || fuzzy != null);

    Uri uri = Uri.parse("$url");
    uri = uri.replace(queryParameters: {
      if (exact != null) 'exact': exact,
      if (fuzzy != null) 'fuzzy': fuzzy,
      if (set != null) 'set': set,
      if (format != null) 'format': format,
      if (face != null) 'face': face,
      if (version != null) 'veresion': version,
      if (pretty != null) 'pretty': pretty,
    });

    final response = await http.get(uri);

    const httpStatusOk = 200;
    if (response.statusCode != httpStatusOk) return null;

    final encodedJson = response.body;
    final decodedJson = json.decode(encodedJson);

    return CardsNamedResult.fromJson(decodedJson);
  }
}
