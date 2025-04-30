import 'package:flutter/material.dart';

class planes extends StatelessWidget {
  const planes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('planes'),
      ),
      body: Center(child: Text('planes content!')),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.bike_scooter),
          label: 'bike',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'cars')
      ]),
    );
  }
}
