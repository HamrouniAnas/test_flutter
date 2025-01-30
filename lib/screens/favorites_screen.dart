import 'package:flutter/material.dart';
import 'book_details_screen.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  // Mock list of favorited books
  final List<Map<String, String>> favoritedBooks = [
    {
      'title': 'The Economics of Big Science',
      'author': 'Panagiotis',
      'description': 'Essays by Leading Scientists and Policymakers',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'Beginning Excel 2019',
      'author': 'Norene Brown',
      'description': 'A Beginner\'s Guide to Excel',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  void _removeFromFavorites(int index) {
    setState(() {
      favoritedBooks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.shade800,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'DEV',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
            Icon(Icons.menu, color: Colors.black),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title: Bookmarks
            Text(
              'Bookmarks',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // List of Favorited Books
            Expanded(
              child: ListView.builder(
                itemCount: favoritedBooks.length,
                itemBuilder: (context, index) {
                  final book = favoritedBooks[index];
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    leading: Container(
                      width: 50,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(book['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      book['title']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(book['author']!),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.bookmark,
                        color: Colors.green.shade800,
                      ),
                      onPressed: () => _removeFromFavorites(index),
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
            ),
          ],
        ),
      ),

      // Floating Bottom Navigation Bar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 60,
        width: 150,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.grey),
              onPressed: () {
                Navigator.pop(context); // Navigate back to the home screen
              },
            ),
            IconButton(
              icon: Icon(Icons.bookmark, color: Colors.green.shade800),
              onPressed: () {
                // Already on the favorites screen
              },
            ),
          ],
        ),
      ),
    );
  }
}