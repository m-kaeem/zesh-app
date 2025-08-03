import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utils/constants.dart';
import 'profile_screen.dart';
import 'search_results_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            _buildHeader(),
            _buildSearchBar(context),
            _buildLogo(),
            _buildPerfumeSeries(),
            _buildProductCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, size: 30),
          Icon(Icons.lock_outline, size: 30),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        onSubmitted: (value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchResultsScreen(searchQuery: value),
            ),
          );
        },
        decoration: InputDecoration(
          hintText: 'Search Here...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Image.asset('assets/logo.png', height: 150),
    );
  }

  Widget _buildPerfumeSeries() {
    return Column(
      children: [
        Image.asset('assets/banner.png'),
        SizedBox(height: 20),
        /*Text(
          'NEW PERFUME',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
        ),
        Text(
          'SERIES',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'The zésh Perfume Series is a bold expression of elegance and individuality. Crafted with premium ingredients.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),*/
      ],
    );
  }

  Widget _buildProductCarousel() {
    return SizedBox(
      height: 350,
      child: PageView.builder(
        itemCount: demoProducts.length,
        itemBuilder: (context, index) {
          final product = demoProducts[index];
          return _buildProductCard(product);
        },
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Column(
      children: [
        Image.asset(product.image, height: 200),
        SizedBox(height: 10),
        Text(
          product.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          product.description,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[600]),
        ),
        SizedBox(height: 10),
        Text(
          '৳${product.price.toInt()}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Icon(Icons.shopping_cart_outlined),
      ],
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.brown,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.star_border), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
      ],
    );
  }
}
