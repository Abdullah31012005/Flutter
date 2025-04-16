import 'package:flutter/material.dart';

class bikes extends StatelessWidget {
  const bikes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bikes'),
      ),
      body: Center(child: Text('bikes content!')),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.car_rental),
          label: 'car',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.air), label: 'planes')
      ]),
    );
  }
}
