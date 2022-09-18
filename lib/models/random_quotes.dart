import 'package:game_of_thrones_api/models/characters.dart';

class Quotes {
  String? sentence;
  Character? character;

  Quotes({this.sentence, this.character});

  Quotes.fromJson(Map<String, dynamic> json) {
    sentence = json['sentence'];
    character = json['character'] != null
        ? Character.fromJson(json['character'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sentence'] = sentence;
    if (character != null) {
      data['character'] = character!.toJson();
    }
    return data;
  }
}
