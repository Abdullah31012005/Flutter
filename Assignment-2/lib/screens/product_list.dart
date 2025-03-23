import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_tile.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      title: 'Apple Iphone 16 Pro Max(512 GB)',
      description: 'Desert Titanium Design',
      price: 1499.99,
      imageUrl:
          "https://www.dxomark.com/wp-content/uploads/drafts/post-178568/Apple-iPhone-16-Pro-Max_featured-image-packshot-review.png",
    ),
    Product(
      id: '2',
      title: 'Samsung Galaxy S25 Ultra(1TB)',
      description:
          'Stunning display, Advanced camera system, Powerful performance',
      price: 1299.99,
      imageUrl:
          "https://www.pakmobizone.pk/wp-content/uploads/2025/01/Samsung-Galaxy-S25-Ultra-Titanium-SilverBlue-1.jpg",
    ),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(
          'Product List',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductTile(product: products[index]);
        },
      ),
    );
  }
}
