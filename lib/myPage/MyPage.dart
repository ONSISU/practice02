import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice02/member/Agreement.dart';
import 'package:practice02/member/Login.dart';
import 'package:practice02/setting/Setting.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';


class MyPage extends StatefulWidget {
  const MyPage({super.key});


  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = Provider.of<LoginViewModel>(context).isLoggedIn;
    // bool isLoggedIn1 = Provider.of<LoginViewModel>(context).isLoggedIn;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '마이페이지',
          style: TextStyle(color: Color(0xff2BAE66)),
        ),
        actions: <Widget>[
          if(isLoggedIn == false) // 로그인 했을경우
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
          }, icon: Icon(Icons.settings,size: 26,),),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
          Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 40)),
            if(isLoggedIn == true)
              SizedBox(
                  width: 80,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      bool isLoggedIn = Provider.of<LoginViewModel>(context).isLoggedIn;
                      isLoggedIn = false;
                      Provider.of<LoginViewModel>(context, listen: false)
                          .logout();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          //모서리를 둥글게
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Color(0xff2BAE66),
                        padding: EdgeInsets.all(0)
                      // minimumSize: Size(90, 35),
                    ),
                    child: Text(
                      '로그아웃',
                      style: TextStyle(
                          fontSize: 15, color: Color(0xffFCF6F5)),
                    ),
                  )),
            if(isLoggedIn == false) // 비로그인의 경우
              Container(
              child: Image.asset('assets/images/icons8-cucumber-60.png',width: 150,height: 180,fit: BoxFit.fill,),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 70)),

            if(isLoggedIn == false)
            Container(
              child: Text('이미 계정이 있나요?',style: TextStyle(fontSize: 18, color: Color(0xff2BAE66)),),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 15)),
            if(isLoggedIn == false)
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(  //모서리를 둥글게
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: Color(0xff2BAE66),
                      padding: EdgeInsets.all(0)
                    // minimumSize: Size(90, 35),
                  ),
                  child: Text(
                    '로그인',
                    style: TextStyle(fontSize: 25, color: Color(0xffFCF6F5)),
                  ),
                )),
            Padding(padding: const EdgeInsets.fromLTRB(0, 30, 0, 50)),
            if(isLoggedIn == false)
            Container(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text('처음이신가요?',style: TextStyle(fontSize: 16, color: Color(0xff2BAE66)),),

                  TextButton(

                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Agreement()));
                },

                child: Text(
                  '회원가입',
                  style: TextStyle(fontSize: 18, color: Color.fromRGBO(231, 112, 112, 0.8)),
                ),
              )
                ]

            ),

                ),
          ],
        ),

      )),
    );
  }
}