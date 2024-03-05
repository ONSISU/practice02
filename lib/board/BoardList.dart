import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice02/main.dart';
import 'package:http/http.dart' as http;


class BoardList extends StatefulWidget {
  const BoardList({super.key});

  @override
  State<BoardList> createState() => _BoardListState();
}

class _BoardListState extends State<BoardList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시판',style: TextStyle(color: Color(0xff2BAE66),fontSize: 19),),
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Color(0xff2BAE66),), onPressed: (){
          Navigator.pop(context);
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<BoardEntity>>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  int displayCount = min(10, snapshot.data!.length);
                  // return SingleChildScrollView(
                  //     child: Column(
                  // return ListView.builder(
                  //   itemCount: displayCount,
                  //   itemBuilder: (context, index) {
                  return Column(
                      children: List.generate(displayCount, (index) {
                        return ListTile(
                          // title: Text(snapshot.data![index].title),  // 'title'은 실제 JSON 데이터의 필드에 따라 변경해야 합니다.
                          title: Text(snapshot.data![index].title ?? ''),
                          subtitle: Text('내용: ${snapshot.data![index].content ??
                              ''}\n작성시간: ${snapshot.data![index].reg_date ??
                              ''}'),
                        );
                      },)
                  );
                } else if (snapshot.hasError) {
                  return Text("오류닷: ${snapshot.error}");
                };

                // 기본적으로 로딩 스피너를 보여줍니다.
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

  Future<List<BoardEntity>> fetchData() async {
    // 'http' 패키지가 필요합니다.

    final response = await http.post(Uri.parse('http://ec2-13-125-99-103.ap-northeast-2.compute.amazonaws.com:8080/getBoardAll'),
    // final response = await http.post(Uri.parse('http://localhost:8080/getBoardAll'),
      headers: <String, String > {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(<String, String>{  // BoardEntity 객체를 JSON으로 변환합니다.
        'order': '0',
        // 다른 필드들...
      }),
    );

    if (response.statusCode == 200) {

      String body = utf8.decode(response.bodyBytes);
      print('Response: $response');
      print('Response.statusCode: ${response.statusCode}');
      print('Response.request: ${response.request}');
      print('Response.headers: ${response.headers}');
      List jsonResponse = json.decode(body);
      return jsonResponse.map((item) => BoardEntity.fromJson(item)).toList();
    } else {
      print('Response: $response');
      print('Response data: ${response.body}');
      print('Response.statusCode: ${response.statusCode}');
      print('Response.request: ${response.request}');
      print('Response.headers: ${response.headers}');

      throw Exception('Failed to load data');
    }
    return [];
  }
  Future<void> _handleRefresh() async {
    // 1초 동안 대기합니다.
    await Future.delayed(Duration(seconds: 1));

    // 새로고침 로직을 작성합니다.
    // 예: API 호출을 통해 새로운 데이터를 가져오는 등
  }


class BoardEntity {
  final String? id;
  final String? member_id;
  final String? gubun;
  final String? title;
  final String? content;
  final String? writer;
  final String? recommend;
  final String? hit;
  final String? order;
  final String? reg_date;
  final String? amnd_data;
  final String? comment_count;

  BoardEntity({this.id, this.member_id, this.gubun, this.title, this.content, this.writer, this.recommend, this.hit, this.order, this.reg_date, this.amnd_data, this.comment_count});
  // BoardEntity({this.title,this.content,this.reg_date,this.order});

  factory BoardEntity.fromJson(Map<String, dynamic> json) {
    return BoardEntity(
      id: json['id'],
      member_id: json['member_id'],
      gubun: json['gubun'],
      title: json['title'],
      content: json['content'],
      writer: json['writer'],
      recommend: json['recommend'],
      hit: json['hit'],
      order: json['order'],
      reg_date: json['reg_date'],
      amnd_data: json['amnd_data'],
      comment_count: json['comment_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'member_id': member_id,
      'gubun': gubun,
      'title': title,
      'content': content,
      'writer': writer,
      'recommend': recommend,
      'hit': hit,
      'order': order,
      'reg_date': reg_date,
      'amnd_data': amnd_data,
      'comment_count': comment_count,
    };
  }
}

