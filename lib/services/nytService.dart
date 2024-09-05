import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../models/modelBook.dart';

class BookService {
  Future<List<BookRank>> fetchBooks() async {
    final response = await http.get(Uri.parse(
        'https://api.nytimes.com/svc/books/v3/lists/full-overview.json?api-key=WCWmBkSxfIcLUy5X9UfgI5Jm7X5ackkK'));

    if (response.statusCode == 200) {
      print(response.body);
      final data = json.decode(response.body);
      final booksData = data['results']['lists'][0]['books'] as List;

      List<BookRank> books = booksData.map((item) {
        return BookRank(
          title: item['title'] ?? 'Titulo Indisponível',
          author: item['author'] ?? 'Autor Indisponível',
          contributor: item['contributor'] ?? 'Contribuinte Indisponível',
          publisher: item['publisher'] ?? 'Publisher Indisponível',
          description: item['description'] ?? '',
          thumbnail: item['book_image'] ?? '',
          amazon_product_url: item['amazon_product_url'] ?? '',//ta certo isso?
        );
      }).toList();

      return books;
    } else {
      print('Erro ao carregar a lista: ${response.statusCode}');
      throw Exception('Falha ao carregar a lista');
    }
  }
}
