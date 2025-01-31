import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class BookService {
  static const String baseUrl = 'https://www.dbooks.org/api';

  Future<List<Book>> fetchRecentBooks() async {
    final response = await http.get(Uri.parse('$baseUrl/recent'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> booksJson = data['books'];
      return booksJson.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<Book> fetchBookDetails(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/book/$id'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Book.fromJson(data);
    } else {
      throw Exception('Failed to load book details');
    }
  }
}