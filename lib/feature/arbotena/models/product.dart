class Product {
  final String id;
  final String title;
  final String description;
  final int incompatibilities;
  final bool hasWarning;

  Product({
    required this.id,
    required this.title,
    required this.description,
    this.incompatibilities = 0,
    this.hasWarning = false,
  });

  String get subtitle {
    if (incompatibilities == 0) {
      return 'Keine';
    }
    return '$incompatibilities Nahrungsmittelunverträglichkeits';
  }
}
