import 'cards_named_finder/cards_named_finder.dart';

class Cards {
  const Cards();

  static Future<CardsNamedResult?> named({
    String? exact,
    String? fuzzy,
    String? set,
    String? format,
    String? face,
    String? version,
    bool? pretty,
  }) {
    assert(exact != null || fuzzy != null);
    return CardsNamedFinder.named(
      exact: exact,
      fuzzy: fuzzy,
      set: set,
      format: format,
      face: face,
      version: version,
      pretty: pretty,
    );
  }
}
