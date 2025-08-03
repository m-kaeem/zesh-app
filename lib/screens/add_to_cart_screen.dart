
import 'package:flutter/material.dart';
import '../models/product.dart';
import 'checkout_screen.dart';

class AddToCartScreen extends StatefulWidget {
  final Product product;

  const AddToCartScreen({super.key, required this.product});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  int _quantity = 1;
  String _selectedSize = '3.5ml';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProductImage(),
                      SizedBox(height: 20),
                      _buildProductDetails(),
                      SizedBox(height: 20),
                      _buildDescription(),
                      SizedBox(height: 20),
                      _buildSizeAndQuantity(),
                    ],
                  ),
                ),
              ),
            ),
            _buildAddToCartButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 16),
            label: Text('Back', style: TextStyle(color: Colors.black, fontSize: 16)),
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey[200],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Row(
            children: [
              IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
              IconButton(
                icon: Icon(Icons.shopping_bag_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.product.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('By, zésh', style: TextStyle(color: Colors.grey[600])),
          ],
        ),
        Text('৳${widget.product.price.toInt()}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Row(
          children: List.generate(5, (index) => Icon(Icons.star, color: Colors.amber, size: 18)),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(
          'Dior Sauvage is a bold and fresh fragrance, blending spicy bergamot with warm Amberwood and earthy notes. It exudes rugged elegance and masculine intensity, inspired by wild, open landscapes.',
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildSizeAndQuantity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Available Sizes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildSizeSelector(),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text('Quantity', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildQuantitySelector(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSizeSelector() {
    final sizes = ['3.5ml', '6ml', '10ml', '30ml', '50ml', '100ml'];
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: sizes.map((size) {
        final isSelected = _selectedSize == size;
        return ChoiceChip(
          label: Text(size),
          selected: isSelected,
          onSelected: (selected) {
            if (selected) {
              setState(() {
                _selectedSize = size;
              });
            }
          },
          backgroundColor: Colors.grey[200],
          selectedColor: Color(0xFF1A2A3A),
          labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
        );
      }).toList(),
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        IconButton(onPressed: () => setState(() => _quantity++), icon: Icon(Icons.add)),
        Text('$_quantity', style: TextStyle(fontSize: 18)),
        IconButton(onPressed: () => setState(() => _quantity > 1 ? _quantity-- : null), icon: Icon(Icons.remove)),
      ],
    );
  }

  Widget _buildAddToCartButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // TODO: Add to cart logic
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1A2A3A),
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text('Add to Cart', style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
