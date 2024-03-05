import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:practice02/main.dart';
import 'package:http/http.dart' as http;


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '로그인',
          style: TextStyle(color: Color(0xff2BAE66)),
        ),
        leading: const BackButton(
          color: Color(0xff2BAE66),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              onChanged: (value) => loginViewModel.updateId(value),
              inputFormatters: [
                LengthLimitingTextInputFormatter(12), // 12자리까지 입력가능
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Color.fromRGBO(136, 135, 135, 0.34))),
                labelText: '아이디',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Color(0xff2BAE66))),
              ),
              style: TextStyle(
                fontSize: 16,
                height: 1.1,
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 30)),
            TextFormField(
              onChanged: (value) => loginViewModel.updatePassword(value),
              obscureText: true,
              onFieldSubmitted: (_) {
                Provider.of<LoginViewModel>(context, listen: false).login(context);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Color.fromRGBO(136, 135, 135, 0.34))),
                labelText: '비밀번호',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Color(0xff2BAE66))),
              ),
              style: TextStyle(
                fontSize: 16,
                height: 1.1,
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 40),
            ),

            ElevatedButton(
              // onPressed: () => loginViewModel.login(context),
              onPressed: (){
                Provider.of<LoginViewModel>(context, listen: false).login(context);
              },
                style: FilledButton.styleFrom(
              fixedSize: Size(90, 43),
              padding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(  //모서리를 둥글게
                  borderRadius: BorderRadius.circular(5)),
              backgroundColor: Color(0xff2BAE66),
            ),child: Text('로그인', style: TextStyle(
              fontSize: 16,
              color: Color(0xffFCF6F5),
            ),)
            ),
            Container(
              margin: EdgeInsets.only(top: 5),

              child: IconButton(
                onPressed: (){},
                icon: Image.asset(
                  'assets/images/kakao_login_medium.png',
                ),style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),),// 버튼 애니메이션 제거효과
              ),
            )
          ],
        ),
      )),
    );
  }
}
// 대화장
_showMyDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // title: Text('아이디, 비밀번호가 틀렸습니다. 다시입력해주세요.'),
          content: Text('아이디, 비밀번호가 틀렸습니다.\n다시입력해주세요.',style: TextStyle(fontSize: 18),),
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

// 로그인 불러오기
class User {
  String member_id;
  String member_pw;

  User({required this.member_id, required this.member_pw});
}

class LoginViewModel extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;
  User user = User(member_id: '', member_pw: '');

  void updateId(String member_id) {
    user.member_id = member_id;
    notifyListeners();
  }

  void updatePassword(String member_pw) {
    user.member_pw = member_pw;
    notifyListeners();
  }

  void login(BuildContext context) {
    // 아이디와 비밀번호를 Spring Boot로 전송하는 로직을 구현합니다.
    // HTTP 클라이언트 패키지를 사용하여 API 요청을 보낼 수 있습니다.
    // 예시로는 http 패키지를 사용하여 POST 요청을 보내는 방법을 보여드리겠습니다.
    // 실제로는 Spring Boot의 API 엔드포인트와 요청 형식에 맞게 구현해야 합니다.

    // final url = Uri.parse('http://ec2-13-125-99-103.ap-northeast-2.compute.amazonaws.com:8080/loginMember');
    final url = Uri.parse('http://localhost:8080/loginMember');
    final headers = {'Content-Type': 'application/json'};
    final body = '{"member_id": "${user.member_id}", "member_pw": "${user.member_pw}"}';

    http.post(url, headers: headers, body: body).then((response) {
      // 로그인 응답 처리
      if (response.statusCode == 200) {
        print('Response data: ${response.body}');
        print('response: $response');
        print('headers :  $headers');
        print('body: $body');
        print('로그인 접속성공');
        if(response.body == '{"result":0}') {
          print('아이디, 비밀번호가 틀렸습니다.');
          _showMyDialog(context);
        }else {
          print('로그인 성공');
          _isLoggedIn = true;
          print('_isLoggedIn : $_isLoggedIn');
          notifyListeners();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),(route) => false,);
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => MainPage()),
          // );
        }

        // 로그인 성공
        // 토큰 등의 응답 데이터 처리
      } else {
        print('로그인 접속실패');

        // 로그인 실패
        // 실패 메시지 등을 처리
      }
    }).catchError((error) {
      print(error);
      // 에러 처리
    });
  }// login

  void logout() {
    // 로그아웃 로직 구현
    _isLoggedIn = false;
    print('_isLoggedIn : $_isLoggedIn');
    notifyListeners();
  }


}
  void _loginWithKakao() async {
  //   if (await isKakaoTalkInstalled()) {
  //     try {
  //       await UserApi.instance.loginWithKakaoTalk();
  //       print('카카오톡으로 로그인 성공');
  //     } catch (error) {
  //       print('카카오톡으로 로그인 실패 $error');
  //
  //       // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
  //       // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
  //       if (error is PlatformException && error.code == 'CANCELED') {
  //         return;
  //       }
  //       // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
  //       try {
  //         await UserApi.instance.loginWithKakaoAccount();
  //         print('카카오계정으로 로그인 성공');
  //       } catch (error) {
  //         print('카카오계정으로 로그인 실패 $error');
  //       }
  //     }
  //   } else {
  //     try {
  //       await UserApi.instance.loginWithKakaoAccount();
  //       print('카카오계정으로 로그인 성공');
  //     } catch (error) {
  //       print('카카오계정으로 로그인 실패 $error');
  //     }
  //   }
  }
