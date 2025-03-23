import 'package:assignment2/screens/product_detail.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.imageUrl,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
              Icons.error); // Display an error icon if the image fails to load
        },
      ),
      title: Text(product.title),
      subtitle: Text(product.description),
      trailing: Text('\$${product.price}'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
    );
  }
}
