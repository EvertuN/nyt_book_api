import 'package:dio/dio.dart';
import '../models/modelBook.dart';

class BookService {
  final Dio _dio = Dio();

  Future<List<BookRank>> fetchBooks() async {
    try {
      final response = await _dio.get(
        'https://api.nytimes.com/svc/books/v3/lists/full-overview.json',
        queryParameters: {
          'api-key': 'WCWmBkSxfIcLUy5X9UfgI5Jm7X5ackkK',
        },
      );

      if (response.statusCode == 200) {
        print(response.data);

        final data = response.data;
        final booksData = data['results']['lists'][0]['books'] as List;

        List<BookRank> books = booksData.map((item) {
          return BookRank(
            title: item['title'] ?? 'Titulo Indisponível',
            author: item['author'] ?? 'Autor Indisponível',
            contributor: item['contributor'] ?? 'Contribuinte Indisponível',
            publisher: item['publisher'] ?? 'Publisher Indisponível',
            description: item['description'] ?? '',
            thumbnail: item['book_image'] ?? '',
            amazon_product_url: item['amazon_product_url'] ?? '',
          );
        }).toList();

        return books;
      } else {
        throw Exception('Erro ao carregar a lista: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Erro de resposta: ${e.response?.data}');
      } else {
        print('Erro de requisição: ${e.message}');
      }
      throw Exception('Falha ao carregar a lista');
    }
  }
}
