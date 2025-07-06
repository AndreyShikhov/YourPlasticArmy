import 'package:flutter/material.dart';
import 'package:ypa/buttons.dart';

void main() {
  runApp( Container(
    color: Colors.white,
    padding: EdgeInsets.only(top: 40),
    child: const MyStatelessWidget(
        myChild : Text('XUI',
          style: TextStyle(fontSize: 22,color: Colors.redAccent),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        ),
        myColor: Colors.tealAccent,
    ),

  ));
}

class MyApp extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrangeAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text('data'),
          centerTitle:  true,
        ),
        body: Center(
          child: Text('stupid tex', style:TextStyle(
              fontSize: 20,
              color: Colors.red,
              fontFamily: 'Times New roman'
          )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () { print('Click Blyat'); },
          backgroundColor:  Colors.black,
          child: Text('Click'),
          
        ),
      )
    );
  }
}



class MyStatelessWidget extends StatelessWidget{
  final Widget  myChild;
  final Color  myColor;


  const MyStatelessWidget({ Key? key,  required this.myChild ,   this.myColor = Colors.white }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      child: myChild,
    );

  }
}