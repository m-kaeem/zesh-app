import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;

  const ProductCarousel({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        itemCount: products.length,
        controller: PageController(viewportFraction: 0.8),
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Image.asset(product.image, height: 120),
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      product.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '৳${product.price}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.shopping_cart_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
