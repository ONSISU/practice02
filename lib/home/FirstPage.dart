import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice02/kakaoMap/KakaoMapMain2.dart';
import 'package:practice02/member/Agreement.dart';
import 'package:practice02/member/Login.dart';
import 'package:practice02/home/Inform.dart';
import 'package:practice02/home/Search.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = Provider
        .of<LoginViewModel>(context)
        .isLoggedIn;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('메인페이지', style: TextStyle(color: Color(0xff2BAE66)),),
        // elevation: 3.0,
        // backgroundColor: Color(0xffFCF6F5),
        actions: <Widget>[
          IconButton(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Search()));
          }, icon: Icon(Icons.search, size: 26,),),
          IconButton(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Inform()));
          }, icon: Icon(Icons.notifications_none, size: 26,)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Row(mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       if(isLoggedIn == true)
            //         SizedBox(
            //             width: 80,
            //             height: 35,
            //             child: ElevatedButton(
            //               onPressed: () {
            //                 isLoggedIn = false;
            //                 Provider.of<LoginViewModel>(context, listen: false)
            //                     .logout();
            //               },
            //               style: ElevatedButton.styleFrom(
            //                   shape: RoundedRectangleBorder(
            //                     //모서리를 둥글게
            //                       borderRadius: BorderRadius.circular(5)),
            //                   backgroundColor: Color(0xff2BAE66),
            //                   padding: EdgeInsets.all(0)
            //                 // minimumSize: Size(90, 35),
            //               ),
            //               child: Text(
            //                 '로그아웃',
            //                 style: TextStyle(
            //                     fontSize: 15, color: Color(0xffFCF6F5)),
            //               ),
            //             )),
            //
            //       if(isLoggedIn == false)
            //         SizedBox(
            //             width: 80,
            //             height: 35,
            //             child: ElevatedButton(
            //               onPressed: () {
            //                 Navigator.push(context,
            //                     MaterialPageRoute(builder: (context) =>
            //                         Login()));
            //               },
            //               style: ElevatedButton.styleFrom(
            //                   shape: RoundedRectangleBorder(
            //                     //모서리를 둥글게
            //                       borderRadius: BorderRadius.circular(5)),
            //                   backgroundColor: Color(0xff2BAE66),
            //                   padding: EdgeInsets.all(0)
            //                 // minimumSize: Size(90, 35),
            //               ),
            //               child: Text(
            //                 '로그인',
            //                 style:
            //                 TextStyle(fontSize: 15, color: Color(0xffFCF6F5)),
            //               ),
            //             )),
            //       Padding(padding: const EdgeInsets.fromLTRB(0, 0, 20, 0)),
            //       if(isLoggedIn == false)
            //         SizedBox(
            //           width: 80,
            //           height: 35,
            //           child: ElevatedButton(
            //             onPressed: () {
            //               Navigator.push(context,
            //                   MaterialPageRoute(builder: (context) =>
            //                       Agreement()));
            //             },
            //             style: ElevatedButton.styleFrom(
            //               shape: RoundedRectangleBorder( //모서리를 둥글게
            //                 borderRadius: BorderRadius.circular(5),
            //               ),
            //               backgroundColor: Color(0xff2BAE66),
            //
            //               // minimumSize: Size(100, 44),
            //               padding: const EdgeInsets.all(0),
            //
            //             ),
            //             child: Text(
            //               '회원가입',
            //               style: TextStyle(
            //                   fontSize: 15, color: Color(0xffFCF6F5)),
            //             ),
            //           ),),
            //       Padding(padding: const EdgeInsets.fromLTRB(0, 0, 20, 0)),
            //     ]
            // ),
            Padding(padding: EdgeInsets.only(top: 50)),

            Container(
              child: Padding(padding: EdgeInsets.all(0)),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) =>
                  //         KakaoMapMain2()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff2BAE66),
                  // minimumSize: Size(100, 44),
                  padding: const EdgeInsets.all(0),

                ),
                child: Text(
                  '카카오맵 웹뷰',
                  style: TextStyle(
                      fontSize: 15, color: Color(0xffFCF6F5)),
                ),
              ),),
          ],
        ),
      ),
    );
  }

}
