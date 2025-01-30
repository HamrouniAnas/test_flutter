import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider with ChangeNotifier {
  List<Map<String, String>> _favoritedBooks = [];

  List<Map<String, String>> get favoritedBooks => _favoritedBooks;

  static const String _favoritesKey = 'favoritedBooks';

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList(_favoritesKey) ?? [];

    _favoritedBooks = favoritesJson.map((json) {
      final Map<String, dynamic> bookMap = Map<String, dynamic>.from(json as Map);
      return Map<String, String>.from(bookMap);
    }).toList();

    notifyListeners();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = _favoritedBooks.map((book) => book.toString()).toList();
    await prefs.setStringList(_favoritesKey, favoritesJson);
  }

  Future<void> addToFavorites(Map<String, String> book) async {
    _favoritedBooks.add(book);
    await _saveFavorites();
    notifyListeners();
  }

  Future<void> removeFromFavorites(Map<String, String> book) async {
    _favoritedBooks.remove(book);
    await _saveFavorites();
    notifyListeners();
  }

  bool isBookFavorited(Map<String, String> book) {
    return _favoritedBooks.contains(book);
  }
}