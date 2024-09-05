import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/modelBook.dart';

class BookPage extends StatelessWidget {
  final BookRank book;

  const BookPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          book.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Image.network(
              //'assets/unnamed.jpg',
              book.thumbnail,
              width: double.infinity,
              height: 300,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.book),
            ),
            const SizedBox(width: 16), //nao funciona// arruma
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    book.title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                Text('Autor: ${book.author}', style: const TextStyle(
                  fontSize: 16)),
                const SizedBox(height: 8),
                Text('Contribuinte: ${book.contributor}', style: const TextStyle(
                    fontSize: 16)),
                const SizedBox(height: 8),
                Text('Editora: ${book.publisher}', style: const TextStyle(
                    fontSize: 16)),
                const SizedBox(height: 8),
                Text(
                  'Descrição: ${book.description}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        launchUrl(book.amazon_product_url as Uri);
                      },
                      child: const Text('Comprar')),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
