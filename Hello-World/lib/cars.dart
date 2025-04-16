import 'package:flutter/material.dart';

class cars extends StatelessWidget {
  const cars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
      ),
      body: Center(child: Text('Cars content!')),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.bike_scooter),
          label: 'bike',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.air), label: 'planes')
      ]),
    );
  }
}
