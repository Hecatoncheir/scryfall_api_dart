import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:scryfall_api_dart/scryfall_api.dart' as ScryfallApi;
import 'package:test/test.dart';

void main() {
  group("CardsNamedFinder", () {
    group("find card by name", () {
      late final Uint8List encodedJson;
      setUpAll(() {
        const filePath = 'test/cards_named_finder/cards_named_result.json';
        encodedJson = File(filePath).readAsBytesSync();
      });

      late final http.Client httpClient;
      setUpAll(() {
        httpClient = MockClient((request) async {
          return request.url.toString() ==
                  'https://api.scryfall.com/cards/named?fuzzy=Bloodline+Keeper'
              ? http.Response.bytes(encodedJson, 200)
              : http.Response('', 404);
        });
      });

      test('without language', () async {
        await http.runWithClient(() async {
          final card = await ScryfallApi.Cards.named(fuzzy: "Bloodline Keeper");
          expect(card, isNotNull);
          expect(card!.multiverseIds!.length, equals(2));
          expect(card.multiverseIds!.first, equals(227061));
          expect(card.multiverseIds!.last, equals(227072));
        }, () => httpClient);
      });
    });
  });
}
