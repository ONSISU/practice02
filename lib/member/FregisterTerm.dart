import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FregisterTerm extends StatefulWidget {
  const FregisterTerm({super.key});

  @override
  State<FregisterTerm> createState() => _FregisterTermState();
}

class _FregisterTermState extends State<FregisterTerm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('이용약관동의',style: TextStyle(color: Color(0xff2BAE66)),),
        // elevation: 3.0,
        // backgroundColor: Color(0xff7b9acc),
        leading: const BackButton(
          color: Color(0xff2BAE66),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 30),),

            Container(
                padding: EdgeInsets.only(left: 20,top: 20, right: 10, bottom: 40),
                child: SizedBox(

                  width: double.infinity,
                  child: Text( '이용약관 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 '
                      '테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 '
                      '테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관'
                      ' 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 '
                      '테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트 이용약관 테스트텍스트이용약관 테스트텍스트이용약관 '
                      '테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 테스트텍스트이용약관 '
                      '테스트텍스트이용약관 테스트텍스트',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    overflow: TextOverflow.fade,
                    ),
                  )
                ),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              // Padding(
              //   padding: EdgeInsets.only(bottom: 200),
              // ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // 뒤로가기

                  },style: FilledButton.styleFrom(
                  fixedSize: Size(90, 43),
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(  //모서리를 둥글게
                      borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Color(0xff2BAE66)),
                  child: Text(
                    '동의',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xffFCF6F5),),
                  ),),
            ])
          ])),
    );
  }
}
