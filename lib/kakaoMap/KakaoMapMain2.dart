// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// // import 'package:kakao_map_plugin/kakao_map_plugin.dart';
//
// class KakaoMapMain2 extends StatelessWidget {
//   // late KakaoMapController mapController;
//   @override
//   Widget build(BuildContext context) {
//     // Set<Marker> markers = {}; // 마커 변수
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           '지도',
//           style: TextStyle(color: Color(0xff2BAE66)),
//         ),
//       ),
//           body: InAppWebView(
//             initialOptions: InAppWebViewGroupOptions(
//               crossPlatform: InAppWebViewOptions(),
//             ),
//             onWebViewCreated: (InAppWebViewController controller) {
//               controller.loadUrl(
//                 urlRequest: URLRequest(
//                   url: Uri.parse('http://tomhoon.duckdns.org:18080/map/KakaoMap'),
//                   // url: Uri.parse('https://map.kakao.com/'),
//                 ),
//               );
//             },
//           ),
//     );
//   }
// }
