import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice02/kakaoMap/KakaoMapMain.dart';
import 'package:practice02/kakaoMap/KakaoMapMain2.dart';
import 'package:practice02/member/Join.dart';
import 'package:practice02/member/Login.dart';
import 'package:practice02/myPage/MyPage.dart';
import 'package:practice02/home/FirstPage.dart';
import 'package:practice02/member/Agreement.dart';
import 'package:practice02/board/BoardList.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// import 'dart:ui_web';



void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 바인딩을 초기화 해주는 역할
  // 로그인 프로시저
  // runApp(ChangeNotifierProvider(
  //   create: (context) => LoginViewModel(),
  //   child: MyApp(),
  // ),
  runApp(MyApp());
  // runApp(ChangeNotifierProvider(
  //   create: (context) => JoinViewModel(),
  //   child: MyApp(),
  // ),);
  // AuthRepository.initialize(appKey: '6487531c8bc89021035aad0019a80118');
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle( // 스타일 변경(status바, navigation바)
      // statusBarColor: Color(0xffFCF6F5),  //상단바 색상
      // systemNavigationBarColor: Colors.blueAccent,  //하단바 색상
    ),
  );
}

  class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
    child: MaterialApp(
      locale: Locale('ko', 'KR'), // 한국어 로케일로 설정
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // 디버거 표시 없애기
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        appBarTheme: AppBarTheme(
        // systemOverlayStyle: SystemUiOverlayStyle.dark
        //     systemOverlayStyle: SystemUiOverlayStyle(
          // statusBarColor: Color(0xFF7b9acc),
          // statusBarBrightness: Brightness.light,
        // )
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      home: MainPage(),
      ));
  }

}
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [FirstPage(), BoardList(), MyPage(), MyPage()];


  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   //title: Text('My Mobile App'),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     color: Colors.grey,
      //     onPressed: () {
      //       // 뒤로가기 버튼 동작
      //     },
      //   ),
      // ),
      body: _pages[_currentIndex],

          bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  iconSize: 24,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home,),
                      label: '홈',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.event),
                      label: '게시판',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.place),
                      label: '채팅',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person,),
                      label: '마이페이지',
                    ),
                  ],
                  currentIndex: _currentIndex,
                  selectedIconTheme: IconThemeData(
                    color: Color(0xff2BAE66),
                    shadows: [Shadow(blurRadius: 10, offset: Offset.zero, color: Colors.grey,)
                    ],opacity: 0.7
                  ),
                  unselectedIconTheme: IconThemeData(
                    opacity: 1
                  ),
                  selectedItemColor: Color(0xff2BAE66),
                  unselectedItemColor: Colors.grey,
                  onTap: _onItemTapped,
                ),
          );
  }


}
