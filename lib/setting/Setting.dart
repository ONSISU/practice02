import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정',style: TextStyle(color: Color(0xff2BAE66),fontSize: 19),),
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Color(0xff2BAE66),), onPressed: (){
          Navigator.pop(context);
        }),
          // color: Color(0xff2BAE66),
        ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color.fromRGBO(136, 135, 135, 0.34)),top: BorderSide(color: Colors.black)),
                ),
                child: OutlinedButton(
                  onPressed: () {
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(style: BorderStyle.none),
                    shape: RoundedRectangleBorder(
                      //모서리를 둥글게
                        borderRadius: BorderRadius.circular(0),),
                    padding: EdgeInsets.only(left: 30),
                  splashFactory: NoSplash.splashFactory),
                    child: Align(
                      alignment: Alignment.centerLeft,
                  child: Text(
                    '회원가입',
                    style: TextStyle(fontSize: 20, color: Color(0xff101820), fontFamily: 'Sunflower'),),
                  ),
                )
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color.fromRGBO(136, 135, 135, 0.34))),
                ),
                child: OutlinedButton(
                  onPressed: () {
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(style: BorderStyle.none),
                    shape: RoundedRectangleBorder(
                      //모서리를 둥글게

                        borderRadius: BorderRadius.circular(0),),
                    padding: EdgeInsets.only(left: 30),
                    splashFactory: NoSplash.splashFactory),
                    child: Align(
                      alignment: Alignment.centerLeft,
                  child: Text(
                    '회원가입2',
                    style: TextStyle(fontSize: 20, color: Color(0xff101820), fontFamily: 'Sunflower', ),),
                )
              ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color.fromRGBO(136, 135, 135, 0.34))),
                ),
                child: OutlinedButton(
                  onPressed: () {
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(style: BorderStyle.none),
                    shape: RoundedRectangleBorder(
                      //모서리를 둥글게
                        borderRadius: BorderRadius.circular(0),
                        ),
                        padding: EdgeInsets.only(left: 30),
                        splashFactory: NoSplash.splashFactory),
                    child: Align(
                      alignment: Alignment.centerLeft,
                  child: Text(
                    '도움말',
                    style: TextStyle(fontSize: 20, color: Color(0xff101820), fontFamily: 'Sunflower', ),),
                  ),
                )
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 30),
                child: Text('버전 v1.0', style: TextStyle(fontSize: 17,color: Color.fromRGBO(136, 135, 135, 0.34),fontFamily: 'HiMelody',), ) ,
                alignment: Alignment.centerLeft,
              )
            ],
          ),
        ),
      ),
    );

  }
}