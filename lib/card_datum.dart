enum CardType { banner, profile, squareImage, titleAndSub }

class CardDatum {
  /// json 변환용 CardType
  String type;
  dynamic data;

  CardDatum({
    required this.type,
    required this.data,
  });

  CardDatum.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        data = json['data'];

  Map<String, dynamic> toJson() => {
        'type': type,
        'data': data,
      };

  factory CardDatum.fromMap(Map<String, dynamic> map) {
    return CardDatum(
      type: map['type'],
      data: map['data'],
    );
  }

  CardType? cardType() {
    for (CardType element in CardType.values) {
      if (element.toString() == "CardType.$type") return element;
    }
    return null;
  }
}
