import 'package:flutter/material.dart';

void main() {
  runApp(  MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter=0;
  String msg="Current Bid is: ";
  void increaseBid() {
    setState(() {
      counter+=50;
    });
  }
   void decreaseBid(){
    setState(() {
      if(counter==0){
        return;
      }
      counter-=50;
    });
   }
  void isSold(){
    setState(() {
       msg="Item Sold for ";
    });
  }
  void reset(){
    setState(() {
      counter=0;
      msg="Current Bid is: ";
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.lightBlue,
            appBar: AppBar(
              centerTitle: true,
              title: Text('Assignment-1', style: TextStyle(fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),
              backgroundColor: Colors.blue,
            ),
            body: Center(
              child: Stack(
                children: [
                 Container(
                width: 650,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(

                      image:AssetImage('assets/bmw.jpg'),

                      fit: BoxFit.contain,

                  ),

                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Colors.black,
                      width: 2

                  ),
                ),
                child: Center(
                  child: Text(
                     msg+"$counter",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                  ),

                ),
              ),
                  Positioned(
                  bottom: 16,
                  right: 16,
                  child: FloatingActionButton(
                    backgroundColor: Colors.yellow,
                      onPressed: increaseBid,
                    tooltip: 'Increase',
                    child: Icon(Icons.add),

                  ),
                  ),
                  
                  Positioned(
                      bottom: 16,
                      left: 16,
                      child:FloatingActionButton(
                        backgroundColor: Colors.yellow,
                          onPressed: decreaseBid,
                        tooltip: 'decrease',
                        child: Icon(Icons.remove),
                      )
                      ),
                  Positioned(
                      bottom: 16,
                      left: 280,
                      width: 100,
                      height: 50,
                      child:FloatingActionButton.extended(
                        label: Text('buy'),
                        backgroundColor: Colors.yellow,
                        icon: Icon(Icons.add_box),
                          onPressed:isSold,
                        tooltip: 'Buy',
                      ),
                  ),
                  Positioned(
                    top: 16,
                      right: 16,
                      child:FloatingActionButton(
                          onPressed:reset,
                        backgroundColor: Colors.yellow,
                        tooltip: 'reset',
                        child: Icon(Icons.close)
                      )
                  )
                    ],
              ),
            )


        )
    );
  }

}
