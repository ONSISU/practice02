import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Inform extends StatefulWidget {
  const Inform({super.key});

  @override
  State<Inform> createState() => _InformState();
}

class _InformState extends State<Inform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('알림',style: TextStyle(color: Color(0xff2BAE66),fontSize: 19),),
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Color(0xff2BAE66),), onPressed: (){
          Navigator.pop(context);
        }),
          // color: Color(0xff2BAE66),

        ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}