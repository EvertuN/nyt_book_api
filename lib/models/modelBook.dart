class BookRank {
  final String title;
  final String description;
  final String contributor;
  final String author;
  //final String price;
  final String publisher;
  final String thumbnail;
  final String amazon_product_url;//string mesmo?

  BookRank({
    required this.title,
    required this.description,
    required this.contributor,
    required this.author,
    // required this.price,
    required this.publisher,
    required this.thumbnail,
    required this.amazon_product_url,
  });

  // factory BookRank.fromMap(Map<String, dynamic> json) {
  //   return BookRank(
  //     title: json['title'] ?? 'Sem título',
  //     description: json['description'] ?? 'Sem descrição',
  //     contributor: json['contributor'] ?? 'Sem contributor',
  //     author: json['author'] ?? 'Sem autor',
  //     // price: json['price'],
  //     publisher: json['publisher'] ?? 'Sem Publicadora',
  //     thumbnail: '',
  //   );
  // }
}