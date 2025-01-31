import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import 'book_details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favoriteBooks = favoritesProvider.favoriteBooks;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks',
          style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
          ),
        ),
      ),
      body: favoriteBooks.isEmpty
          ? Center(
              child: Text(
                'No favorites yet!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favoriteBooks.length,
              itemBuilder: (context, index) {
                final book = favoriteBooks[index];
                return ListTile(
                  leading: Container(
                    width: 50,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(book.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(book.title),
                  subtitle: Text(book.authors),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.bookmark,
                      color: Colors.green.shade800,
                    ),
                    onPressed: () {
                      favoritesProvider.removeFromFavorites(book);
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailsScreen(book: book),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}