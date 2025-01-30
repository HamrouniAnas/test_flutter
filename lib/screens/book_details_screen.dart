import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';

class BookDetailsScreen extends StatefulWidget {
  final Map<String, String> book;

  BookDetailsScreen({required this.book});

  @override
  _BookDetailsScreenState createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isBookmarked = favoritesProvider.isBookFavorited(widget.book);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Return Button (Invisible Arrow)
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.transparent),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              // Book Image
              Center(
                child: Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(widget.book['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Author (Small in Green)
              Text(
                widget.book['author']!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green.shade800,
                ),
              ),
              SizedBox(height: 10),

              // Title and Bookmark Button
              Row(
                children: [
                  // Title (Bold and Big)
                  Expanded(
                    child: Text(
                      widget.book['title']!,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  // Bookmark Button
                  IconButton(
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: isBookmarked ? Colors.green.shade800 : Colors.grey,
                      size: 30,
                    ),
                    onPressed: () {
                      if (isBookmarked) {
                        favoritesProvider.removeFromFavorites(widget.book);
                      } else {
                        favoritesProvider.addToFavorites(widget.book);
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Subtitle
              if (widget.book['subtitle'] != null && widget.book['subtitle']!.isNotEmpty)
                Text(
                  widget.book['subtitle']!,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              SizedBox(height: 20),

              // Description
              Text(
                widget.book['description']!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 20),

              // Year and Pages (Small)
              Row(
                children: [
                  Text(
                    'Year: ${widget.book['year'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Pages: ${widget.book['pages'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),

              // Download Button
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle download logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Download',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}