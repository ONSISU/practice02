import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('검색',style: TextStyle(color: Color(0xff2BAE66)),),
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Color(0xff2BAE66),), onPressed: (){
          Navigator.pop(context);
        }),
        ),
      body: SafeArea(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              hintText: '검색',
            ),
            style: TextStyle(
              fontSize: 16,
              height: 0.8,
            ),
            cursorColor: Color(0xff2BAE66),
            cursorHeight: 11,
            textInputAction: TextInputAction.search,
          ),
      )
    );
  }
}
