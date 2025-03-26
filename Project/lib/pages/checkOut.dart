import 'package:flutter/material.dart';

class checkOut extends StatelessWidget {
  const checkOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thanks for shopping",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT41prDl3r6MLcg_2W5kQKnFQJZpN0ISjbvsQ&s'),
      ),
    );
  }
}
