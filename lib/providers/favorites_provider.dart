import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  // List of favorited books
  final List<Map<String, String>> _favoritedBooks = [];

  // Getter for favorited books
  List<Map<String, String>> get favoritedBooks => _favoritedBooks;

  // Add a book to favorites
  void addToFavorites(Map<String, String> book) {
    _favoritedBooks.add(book);
    notifyListeners(); // Notify listeners to update the UI
  }

  // Remove a book from favorites
  void removeFromFavorites(Map<String, String> book) {
    _favoritedBooks.remove(book);
    notifyListeners(); // Notify listeners to update the UI
  }

  // Check if a book is favorited
  bool isBookFavorited(Map<String, String> book) {
    return _favoritedBooks.contains(book);
  }
}