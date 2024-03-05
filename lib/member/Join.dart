import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice02/member/Login.dart';
import 'package:http/http.dart' as http;

class Join extends StatefulWidget {
  const Join({super.key});
  // const Join({Key key}) : super(key: key);

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  final _formKey = GlobalKey<FormState>();
  FocusNode _memberIdFocus = new FocusNode();
  FocusNode _memberPwFocus = new FocusNode();
  FocusNode _memberPwChkFocus = new FocusNode();
  FocusNode _memberNameFocus = new FocusNode();
  FocusNode _memberNicknameFocus = new FocusNode();
  FocusNode _memberPhoneFocus = new FocusNode();
  FocusNode _memberEmailFocus = new FocusNode();
  FocusNode _memberAddressFocus = new FocusNode();
  final TextEditingController _memberIdController = TextEditingController();
  final TextEditingController _memberPwController = TextEditingController();
  final TextEditingController _memberPwChkController = TextEditingController();
  final TextEditingController _memberNameController = TextEditingController();
  final TextEditingController _memberNicknameController = TextEditingController();
  final TextEditingController _memberPhoneController = TextEditingController();
  final TextEditingController _memberEmailController = TextEditingController();
  final TextEditingController _memberAddressController = TextEditingController();
  String? _errorMsg;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '회원가입',
          style: TextStyle(color: Color(0xff2BAE66)),
        ),
        // elevation: 3.0,
        // backgroundColor: Color(0xff7b9acc),
        leading: const BackButton(
          color: Color(0xff2BAE66),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Form(
          key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                // autovalidateMode: AutovalidateMode.onUserInteraction, // 텍스트 벗어나기 전에 바로 유효성검사
                controller: _memberIdController,
                focusNode: _memberIdFocus,
                validator: (value) {
                  String nonNullableValue = value ?? '';
                  String? validationMessage  = CheckValidate().validateId(_memberIdFocus, nonNullableValue);
                  if (validationMessage != null) {
                    return validationMessage;
                  }
                  return _errorMsg;
                },
                onChanged: (value) async {
                  if (await isDuplicatedId(value)) {
                    setState(() {
                      _errorMsg = '이미 사용중인 ID입니다';
                    });
                  } else {
                    setState(() {
                      _errorMsg = null;
                    });
                  }
                },
                inputFormatters: [
                  LengthLimitingTextInputFormatter(12), // 12자리까지 입력가능
                ],
                decoration: InputDecoration(
                    // border: OutlineInputBorder( borderRadius: BorderRadius.circular(10),),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(136, 135, 135, 0.34))),
                    labelText: '아이디', labelStyle: TextStyle(color: Colors.black),
                    helperText: '아이디는 영문+숫자 포함 6~12자 이하',
                    errorText: null, // 오류 메시지 표시
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 2, color: Color(0xff2BAE66))),),
                style: TextStyle(
                  fontSize: 16,
                  height: 1.1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              ),
              TextFormField(
                controller: _memberPwController,
                focusNode: _memberPwFocus,
                validator: (value) {
                  String nonNullableValue = value ?? '';
                  return CheckValidate().validatePw(_memberPwFocus, nonNullableValue);
                },
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(136, 135, 135, 0.34))),
                    labelText: '비밀번호',labelStyle: TextStyle(color: Colors.black),
                    helperText: '비밀번호는 영문+숫자+특수기호 포함 8자 이상',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 2, color: Color(0xff2BAE66)))),
                style: TextStyle(
                  fontSize: 16,
                  height: 1.1,
                ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 15)),
              TextFormField(
                controller: _memberPwChkController,
                focusNode: _memberPwChkFocus,
                validator: (value) {
                  if (value == '') {
                    _memberPwChkFocus.requestFocus();
                    return '비밀번호확인을 입력하세요';
                  } else {
                    String pattern = r'^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*?[~#?!@$%^&*-]).{8,}$';
                    RegExp regExp = new RegExp(pattern);
                    if (!regExp.hasMatch(value!)) {
                      _memberPwChkFocus.requestFocus(); //포커스를 해당 textformfield에 맞춘다.
                      return '잘못된 비밀번호 형식입니다.(영문+숫자+특수기호 포함 8자 이상)';
                    };
                    if (_memberPwController.text != _memberPwChkController.text) {
                      _memberPwChkFocus.requestFocus();
                      return '비밀번호와 일치하지 않습니다';
                    } else {
                      return null;
                    }
                  }
                },
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(136, 135, 135, 0.34))),
                    labelText: '비밀번호 확인',labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xff2BAE66),
                        ))),
                style: TextStyle(
                  fontSize: 16,
                  height: 1.1,
                ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 35)),
              TextFormField(
                controller: _memberNameController,
                focusNode: _memberNameFocus,
                validator: (value) {
                  if (value == '') {
                    _memberNameFocus.requestFocus();
                    return '이름을 입력하세요';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(136, 135, 135, 0.34))),
                    labelText: '이름',labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 2, color: Color(0xff2BAE66)))),
                style: TextStyle(
                  fontSize: 16,
                  height: 1.1,
                ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 35)),
              TextFormField(
                controller: _memberNicknameController,
                focusNode: _memberNicknameFocus,
                validator: (value) {
                  if (value == '') {
                    _memberNicknameFocus.requestFocus();
                    return '닉네임을 입력하세요';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(136, 135, 135, 0.34))),
                    labelText: '닉네임',labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 2, color: Color(0xff2BAE66)))),
                style: TextStyle(
                  fontSize: 16,
                  height: 1.1,
                ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 35)),
              TextFormField(
                controller: _memberPhoneController,
                keyboardType: TextInputType.phone,
                focusNode: _memberPhoneFocus,
                validator: (value) {
                  String nonNullableValue = value ?? '';
                  return CheckValidate().validatePhone(_memberPhoneFocus, nonNullableValue);
                },
                inputFormatters: [
                  // 숫자만 입력
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11), // 11자리까지 입력가능
                ],
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(136, 135, 135, 0.34))),
                    labelText: '휴대전화번호',labelStyle: TextStyle(color: Colors.black),
                    helperText: '( -없이 )',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 2, color: Color(0xff2BAE66)))),
                style: TextStyle(
                  fontSize: 16,
                  height: 1.1,
                ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 15)),
              TextFormField(
                controller: _memberEmailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: _memberEmailFocus,
                validator: (value) {
                  String nonNullableValue = value ?? '';
                  return CheckValidate().validateEmail(_memberEmailFocus, nonNullableValue);
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(136, 135, 135, 0.34))),
                    labelText: '이메일',labelStyle: TextStyle(color: Colors.black),
                    helperText: '예시) example@email.com',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 2, color: Color(0xff2BAE66)))),
                style: TextStyle(
                  fontSize: 16,
                  height: 1.1,
                ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 15)),

              // Column(
              //   children: <Widget>[
              //     TextFormField(
              //   controller: _memberAddressController,
              //   focusNode: _memberAddressFocus,
              //   validator: (value) {
              //     if (value == '') {
              //       _memberAddressFocus.requestFocus();
              //       return '주소를 입력하세요';
              //     }
              //     return null;
              //   },
              //   decoration: InputDecoration(
              //       enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(
              //               color: Color.fromRGBO(136, 135, 135, 0.34))),
              //       labelText: '주소',labelStyle: TextStyle(color: Colors.black),
              //       focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide:
              //               BorderSide(width: 2, color: Color(0xff2BAE66)))),
              //   style: TextStyle(
              //     fontSize: 16,
              //     height: 1.1,
              //   ),
              // ),
              //         ]), API 되는대로 다시 쓰겠습니다.....
                      Container(
                margin: EdgeInsets.only(
                    left: 0, top: 0, right: 0, bottom: 150), // 하단면에 150픽셀 여백
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: const EdgeInsets.fromLTRB(20, 0, 0, 0)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // 뒤로가기
                      },
                      style: FilledButton.styleFrom(
                        fixedSize: Size(90, 43),
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(  //모서리를 둥글게
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Color(0xff2BAE66),
                      ),
                      child: Text(
                        '취소',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xffFCF6F5),
                        ),
                      )),
                  Padding(padding: const EdgeInsets.fromLTRB(0, 0, 20, 0)),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                                _join();
                              } else {}
                            },
                    style: FilledButton.styleFrom(
                      fixedSize: Size(90, 43),
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(  //모서리를 둥글게
                      borderRadius: BorderRadius.circular(5)),
                      backgroundColor: Color(0xff2BAE66),
                    ),
                    child: Text(
                      '가입',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xffFCF6F5),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 0, top: 0, right: 0, bottom: 50), // 하단면에 200픽셀 여백
              ),
            ]),)
      )),
    );
  }
  Future<bool> isDuplicatedId(String member_id)async{
    String member_id = _memberIdController.text;

    var response = await http.post( Uri.parse('http://localhost:8080/findIdNote'),
    // var response = await http.post( Uri.parse('http://ec2-13-125-99-103.ap-northeast-2.compute.amazonaws.com:8080/findIdNote'),

      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'member_id': member_id,
      }),
    );
    if (response.body == '1') {
      print('아이디 체크 접속성공');
      return Future.value(true);

    } else {
      print('아이디 체크 접속실패');
      return Future.value(false);
    }
  }

  void _join() async {
    String member_id = _memberIdController.text;
    String member_pw = _memberPwController.text;
    String member_name = _memberNameController.text;
    String member_nickname = _memberNicknameController.text;
    String member_phone = _memberPhoneController.text;
    String member_email = _memberEmailController.text;
    String member_address = '';
    String member_del_yn = 'N';
    String kakao_YN = 'N';
    // var response = await http.post( Uri.parse('http://ec2-13-125-99-103.ap-northeast-2.compute.amazonaws.com:8080/joinMember1'),
    var response = await http.post( Uri.parse('http://localhost:8080/joinMember1'),
      body: jsonEncode({
        'member_id': member_id,
        'member_pw': member_pw,
        'member_name': member_name,
        'member_nickname': member_nickname,
        'member_phone': member_phone,
        'member_email': member_email,
        'member_address': member_address,
        'member_del_yn': member_del_yn,
        'kakao_YN': kakao_YN,
      }),
      headers: {'Content-Type': 'application/json'},
    );
      if (response.statusCode == 200) {
        print('회원가입 접속성공');

      if (response.body == '1') {
        if (_formKey.currentState!.validate()) {
          print('회원가입 성공');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        }
      } else { // 1. 입력칸 유효성검사 체크 실패할경우, 2. 네트워크 문제?
        print('회원가입 실패.');
      }
      } else {
        print('회원가입 접속실패');
      }
  } // join()

  Padding _text(String title, String expain) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.31,
              child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 12, color: Color.fromRGBO(195, 195, 195, 1)),
                  ))),
          Flexible(
            child: Text(
              expain,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

} //_JoinState

class CheckValidate{
  String? validateId (FocusNode focusNode, String value){
    if(value == '' || value.isEmpty){
      focusNode.requestFocus();
      return '아이디를 입력하세요.(영문+숫자 포함 6~12자 이하)';
    }else {
      String pattern = r'^(?=.*[a-zA-Z])(?=.*[0-9]).{6,12}$';
      RegExp regExp = new RegExp(pattern);
      if(!regExp.hasMatch(value)) {
        focusNode.requestFocus(); //포커스를 해당 textformfield에 맞춘다.
        return '잘못된 아이디 형식입니다.(영문+숫자 포함 6~12자 이하)';
      } else
        return null;
      }
    }
  String? validatePw(FocusNode focusNode, String value){
    if(value == '' || value.isEmpty){
      focusNode.requestFocus();
      return '비밀번호를 입력하세요.(영문+숫자+특수기호 포함 8자 이상)';
    }else {
      String pattern = r'^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*?[~#?!@$%^&*-]).{8,}$';
      RegExp regExp = new RegExp(pattern);
      if(!regExp.hasMatch(value)){
        focusNode.requestFocus();	//포커스를 해당 textformfield에 맞춘다.
        return '잘못된 비밀번호 형식입니다.(영문+숫자+특수기호 포함 8자 이상)';
      }else{
        return null;
      }
    }
  }
  String? validatePhone(FocusNode focusNode, String value){
      if(value == '' || value.isEmpty){
        focusNode.requestFocus();
        return '전화번호를 입력하세요.';
      }else {
        String pattern = r'^010-?([0-9]{4})-?([0-9]{4})$';
        RegExp regExp = new RegExp(pattern);
        if(!regExp.hasMatch(value)){
          focusNode.requestFocus();	//포커스를 해당 textformfield에 맞춘다.
          return '잘못된 전화번호 형식입니다.';
        }else{
          return null;
        }
      }
    }
  String? validateEmail(FocusNode focusNode, String value){
      if(value == '' || value.isEmpty){
        focusNode.requestFocus();
        return '이메일을 입력하세요.(example@email.com)';
      }else {
        String pattern = r'^[A-Za-z0-9_\\.\\-]+@[A-Za-z0-9\\-]+\.[A-Za-z\\-]+';
        RegExp regExp = new RegExp(pattern);
        if(!regExp.hasMatch(value)){
          focusNode.requestFocus();	//포커스를 해당 textformfield에 맞춘다.
          return '잘못된 이메일 형식입니다.(example@email.com)';
        }else{
          return null;
        }
      }
    }
}


// 대화창
_showMyDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // title: Text('아이디, 비밀번호가 틀렸습니다. 다시입력해주세요.'),
          content: Text('다시입력해주세요.',style: TextStyle(fontSize: 18),),
          actions: [
            // Padding(padding: EdgeInsets.only(top: 130)),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('확인',style: TextStyle(fontSize: 20),),),

          ],
        );
      });
} //_showMyDialog
