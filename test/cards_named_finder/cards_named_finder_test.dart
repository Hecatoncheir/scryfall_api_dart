import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:scryfall_api_dart/cards_named_finder/cards_named_finder.dart';
import 'package:test/test.dart';

main() {
  group('CardsByNameFinder', () {
    late final Uint8List encodedJson;
    setUpAll(() async {
      const filePath = 'test/cards_named_finder/cards_named_result.json';
      encodedJson = File(filePath).readAsBytesSync();
    });

    group('without language', () {
      late final http.Client httpClient;
      setUpAll(() {
        httpClient = MockClient((request) async {
          print(request.toString());
          return request.url.toString() ==
                  'https://api.scryfall.com/cards/named?fuzzy=Bloodline+Keeper'
              ? http.Response.bytes(encodedJson, 200)
              : http.Response('', 404);
        });
      });

      test('can find card by name', () async {
        await http.runWithClient(() async {
          final card = await CardsNamedFinder.named(fuzzy: "Bloodline Keeper");
          expect(card, isNotNull);
          expect(card!.multiverseIds!.length, equals(2));
          expect(card.multiverseIds!.first, equals(227061));
          expect(card.multiverseIds!.last, equals(227072));
        }, () => httpClient);
      });
    });
  });
}
