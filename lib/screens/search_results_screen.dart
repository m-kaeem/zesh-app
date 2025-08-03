
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utils/constants.dart';
import 'add_to_cart_screen.dart';

class SearchResultsScreen extends StatelessWidget {
  final String searchQuery;

  const SearchResultsScreen({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Search Results', style: TextStyle(color: Colors.black)),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('You\'ve searched "$searchQuery"', style: TextStyle(fontSize: 16)),
          ),
          _buildSortBy(),
          ...demoProducts.map((product) => _buildProductListItem(context, product)),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildSortBy() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('Sort by', style: TextStyle(color: Colors.grey[600])),
              SizedBox(width: 5),
              Text('Newest', style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          Icon(Icons.filter_list),
        ],
      ),
    );
  }

  Widget _buildProductListItem(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddToCartScreen(product: product)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Image.asset(product.image, height: 100, width: 100),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(product.description, style: TextStyle(color: Colors.grey[600])),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('৳${product.price.toInt()}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Icon(Icons.favorite_border),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.shopping_cart_outlined, size: 16),
                      SizedBox(width: 5),
                      Text('Add to Cart'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

    Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 2,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.star_border), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
      ],
    );
  }
}
