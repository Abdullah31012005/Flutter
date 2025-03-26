import 'package:flutter/material.dart';
import 'package:project/pages/ItemList.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text(
            'Wellcome',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0),
          child: Center(
              child: Column(
            children: [
              Image.network(
                  "https://t4.ftcdn.net/jpg/05/51/27/97/360_F_551279793_AHrJK7JitJlMvYKiPrMnZWb6eACRzOvx.jpg"),
              Padding(padding: EdgeInsets.all(80.0)),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    print('Button pressed!');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GroceryList()),
                    );
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                  ),
                ),
              ),
            ],
          )),
        ));
  }
}
