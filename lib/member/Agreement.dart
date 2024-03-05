import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice02/member/FregisterPrivate.dart';
import 'package:practice02/member/FregisterTerm.dart';
import 'package:practice02/member/Join.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Agreement extends StatefulWidget {
  const Agreement({super.key});

  @override
  State<Agreement> createState() => _AgreementState();
}
    bool? _fregister_term = false;
    bool? _fregister_private = false;

class _AgreementState extends State<Agreement> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('약관동의',style: TextStyle(color: Color(0xff2BAE66)),),
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

              Container(
              width: double.infinity,
              // height: 60,
              padding: EdgeInsets.only(left: 10, top: 10, right: 10 ,bottom: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: <Widget>[
                    Checkbox(value: _fregister_term, overlayColor: MaterialStatePropertyAll(Color(0xff2BAE66)),
                        activeColor : Color(0xff2BAE66), onChanged: (value) {
                      setState(() {
                        _fregister_term = value;
                      });
                    }),
                    Text('이용약관 동의', style: TextStyle(height: 3.2, fontSize: 20,),
                    ),
                    Spacer(),
                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FregisterTerm()));
                        setState(() {
                          _fregister_term = true;
                        });
                      },
                      icon: Icon(Icons.keyboard_arrow_right, ),
                    ),
                  ]),
            ),
              Container(
              width: double.infinity,
              // height: 60,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: <Widget>[
                    Checkbox(value: _fregister_private, overlayColor: MaterialStatePropertyAll(Color(0xff2BAE66)),
                      activeColor : Color(0xff2BAE66), onChanged: (value) {
                      setState(() {
                        _fregister_private = value;
                      });
                    }),
                    Text('개인정보처리방침', style: TextStyle(height: 3.2, fontSize: 20,),
                    ),
                    Spacer(),
                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => FregisterPrivate()));
                      setState(() {
                        _fregister_private = true;
                      });
                    }, icon: Icon(Icons.keyboard_arrow_right)),
                  ]),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 250),),

                  ElevatedButton(
                      onPressed: () {
                        if(_fregister_private == true && _fregister_term == true) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Join()));
                        }else {
                          showToast();
                        }

                        },
                      style: FilledButton.styleFrom(
                          fixedSize: Size(100, 43),
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(  //모서리를 둥글게
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: Color(0xff2BAE66)),
                      child: Text('회원가입', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xffFCF6F5),),)
                  ),

              ]
            )
             ],
        ),

      ),
    );
  }
}
  void showToast(){
    Fluttertoast.showToast(
        msg: "약관동의 체크를 해주세요.",//메세지입력
        toastLength: Toast.LENGTH_SHORT, //메세지를 보여주는 시간(길이)
        gravity: ToastGravity.CENTER,//위치지정
        timeInSecForIosWeb: 1, //ios및웹용 시간
        backgroundColor: Colors.black,//배경색
        textColor: Color(0xffFCF6F5),//글자색
        fontSize: 16.0 //폰트사이즈
    );
  }
