How to use:

```dart
import 'package:magicthegathering_api_dart/magicthegathering_api.dart'
    as MagicTheGatheringApi;

void main() {
    final card = await MagicTheGatheringApi.Card.find(433277);
    assert(card?.name == "Edgar Markov");

    final cards = await MagicTheGatheringApi.Card.where(
      name: 'Edgar Markov',
      language: Language.English,
    );
}
```
