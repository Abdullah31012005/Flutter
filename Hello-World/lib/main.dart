import 'package:flutter/material.dart';

import 'cars.dart';
import 'bikes.dart';
import 'planes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Assignment-3😒")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: CircleAvatar(
                radius: 30,
                // Replace with your image path
                child: Icon(
                  Icons.face,
                ),

                backgroundColor: Colors.white, // Optional: no background color
              ),
            ),
            ListTile(
              leading: Icon(Icons.car_rental),
              title: Text("Cars"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const cars()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.bike_scooter),
              title: Text("Bikes"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const bikes()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.air),
              title: Text("Planes"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const planes()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text("Main Page"),
      ),
    );
  }
}
