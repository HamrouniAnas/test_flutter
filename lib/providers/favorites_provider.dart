import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/book.dart';
class FavoritesProvider with ChangeNotifier {
  List<Book> _favoriteBooks = [];
  static const String _favoritesKey = 'favoriteBooks';

  List<Book> get favoriteBooks => _favoriteBooks;

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList(_favoritesKey) ?? [];

    _favoriteBooks = favoritesJson.map((json) {
      final bookMap = jsonDecode(json);
      return Book.fromJson(bookMap);
    }).toList();

    notifyListeners();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = _favoriteBooks.map((book) => jsonEncode(book.toJson())).toList();
    await prefs.setStringList(_favoritesKey, favoritesJson);
  }

  void addToFavorites(Book book) {
    if (!_favoriteBooks.any((b) => b.id == book.id)) {
      _favoriteBooks.add(book);
      notifyListeners();
      _saveFavorites();
    }
  }

  void removeFromFavorites(Book book) {
    _favoriteBooks.removeWhere((b) => b.id == book.id);
    notifyListeners();
    _saveFavorites();
  }

  bool isFavorite(Book book) {
    return _favoriteBooks.any((b) => b.id == book.id);
  }
}