import 'package:flutter/material.dart';
import 'package:nyt_book_api/views/homePage.dart';
import 'package:http/http.dart' as http;

Future<void> main () async {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
