import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Product Details',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Column(
            children: [
              Image.network(
                product.imageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons
                      .error); // Display an error icon if the image fails to load
                },
              ),
              Text(product.title, style: TextStyle(fontSize: 24)),
              Text(product.description, style: TextStyle(fontSize: 16)),
              Text('\$${product.price}', style: TextStyle(fontSize: 20)),
            ],
          ),
        ));
  }
}
