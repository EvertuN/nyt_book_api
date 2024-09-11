import 'package:flutter/material.dart';
import '../models/modelBook.dart';
import '../services/nytService.dart';
import 'bookPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BookRank> books = [];

  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }

  Future<void> _fetchBooks() async {
    BookService bookService = BookService();
    List<BookRank> fetchedBooks = await bookService.fetchBooks();
    setState(() {
      books = fetchedBooks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.red,
          title: const Text(
            'New York Time Best-Seller',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: books.isEmpty
              ? const Center(child: Text('Nenhum livro encontrado'))
              : ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    // return ListTile(
                    //   leading: Image.network(
                    //     book.thumbnail,
                    //     errorBuilder: (context, error, stackTrace) =>
                    //         const Icon(Icons.book),
                    //     width: 50,
                    //   ),
                    //   title: Text(book.title),
                    //   subtitle: Text(book.author),
                    //   //isThreeLine: true,
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => BookPage(book: book),
                    //         ));
                    //   },
                    // );
                    return Center(
                      child: SizedBox(
                        width: 400,
                        height: 120,
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookPage(book: book),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    book.thumbnail,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.book),
                                    width: 50,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          book.title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text('Autor: ${book.author}'),
                                        Text(
                                          'Descrição: ${book.description}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ));
  }
}
