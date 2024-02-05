How to use:

```dart
import 'package:scryfall_api_dart/scryfall_api.dart' as ScryfallApi;

void main() {
    final card = await ScryfallApi.Cards.named(fuzzy: "Bloodline Keeper");
    assert(card?.name == "Bloodline Keeper");
}
```
