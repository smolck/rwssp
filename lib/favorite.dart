class Favorite {
  // final int id;
  final String reference;

  Favorite(/* this.id, */ this.reference);

  Map<String, dynamic> toMap() => {
        // 'id': id,
        'reference': reference,
      };
}
