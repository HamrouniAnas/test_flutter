import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'book_details_screen.dart';
import 'favorites_screen.dart';
import '../providers/favorites_provider.dart';

class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  int _selectedIndex = 0;

  final List<Map<String, String>> books = [
    {
      'title': 'The Economics of Big Science',
      'author': 'Panagiotis',
      'description': 'Essays by Leading Scientists and Policymakers',
      'image': 'https://via.placeholder.com/150', // Placeholder image URL
    },
    {
      'title': 'Beginning Excel 2019',
      'author': 'Norene Brown',
      'description': 'A Beginner\'s Guide to Excel',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'Building Democracy for All',
      'author': 'Robert W. Maloy, Torrey Trust',
      'description': 'A Guide to Political Life',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        // Navigate to Favorites Screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavoritesScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

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
            // Highlights Section
            Text(
              'Highlights',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),

            // Featured Books (Horizontally Scrollable Cards)
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  final isBookmarked = favoritesProvider.isBookFavorited(book);

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailsScreen(book: book),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(book['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Text(
                              book['title']!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: IconButton(
                              icon: Icon(
                                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                                color: isBookmarked ? Colors.green.shade800 : Colors.white,
                              ),
                              onPressed: () {
                                if (isBookmarked) {
                                  favoritesProvider.removeFromFavorites(book);
                                } else {
                                  favoritesProvider.addToFavorites(book);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            // Books List Section
            Text(
              'Books',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),

            // Book List
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  final isBookmarked = favoritesProvider.isBookFavorited(book);

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
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: isBookmarked ? Colors.green.shade800 : Colors.grey,
                      ),
                      onPressed: () {
                        if (isBookmarked) {
                          favoritesProvider.removeFromFavorites(book);
                        } else {
                          favoritesProvider.addToFavorites(book);
                        }
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
              icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.green : Colors.grey),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.bookmark, color: _selectedIndex == 1 ? Colors.green : Colors.grey),
              onPressed: () => _onItemTapped(1),
            ),
          ],
        ),
      ),
    );
  }
}