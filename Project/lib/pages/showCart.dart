import 'package:flutter/material.dart';
import 'package:project/model/Item.dart';
import 'package:project/pages/checkOut.dart';

class ShowCart extends StatelessWidget {
  final List<Items> cart;

  const ShowCart({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate total price
    double totalPrice = 0;
    for (var item in cart) {
      totalPrice += item.price * item.quantity;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout Cart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // List of cart items - simplest version
          if (cart.isEmpty)
            const Expanded(
              child: Center(
                child: Text(
                  'Your cart is empty',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          else
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (final item in cart)
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            // Quantity display (simple text instead of CircleAvatar)
                            Text('${item.quantity}x '),

                            // Item name and price
                            Expanded(child: Text(item.name)),
                            Text(
                              '\Rs${(item.price * item.quantity).toStringAsFixed(2)}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),

          // Total and checkout section
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      '\Rs${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                if (totalPrice > 0)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => checkOut()));
                    },
                    child: Text(
                      "Proceed to checkout!",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen),
                  )
                else
                  Text("cart empty"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
