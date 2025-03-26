import 'package:flutter/material.dart';
import 'package:project/model/Item.dart';
import 'package:project/pages/showCart.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({Key? key}) : super(key: key);

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final quanController = TextEditingController();
  List<Items> cart = [];

  void addItem() {
    if (nameController.text.isEmpty ||
        priceController.text.isEmpty ||
        quanController.text.isEmpty) {
      return;
    }

    // Safe number parsing with error handling
    final price = double.tryParse(priceController.text) ?? 0.0;
    final quantity = int.tryParse(quanController.text) ?? 0;

    setState(() {
      cart.add(Items(
          name: nameController.text,
          price: price,
          quantity: quantity,
          total: price * quantity));
      nameController.clear();
      priceController.clear();
      quanController.clear();
    });
  }

  void removeItem(int index) {
    setState(() {
      cart.removeAt(index);
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    quanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Grocery List",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: [
          // Input section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Name field
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Item name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Price field
                Expanded(
                  child: TextField(
                    controller: priceController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: "Price",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Quantity field
                Expanded(
                  child: TextField(
                    controller: quanController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Qty",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Add button
                IconButton(
                  onPressed: addItem,
                  icon: const Icon(Icons.add),
                  color: Colors.green,
                ),
              ],
            ),
          ),

          // List of items
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("No items added yet"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('\Rs${item.price.toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('${item.quantity}'),
                            IconButton(
                              onPressed: () => removeItem(index),
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          // Add to Cart button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowCart(cart: cart),
                  ),
                );
              },
              child: const Text(
                "Add to Cart",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.lightGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
