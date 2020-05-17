class Favorite {
  final String text;
  final String reference;

  Favorite(this.reference, this.text);

  Map<String, dynamic> toMap() => {
        'text': text,
        'reference': reference,
      };
}
