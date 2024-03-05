// import 'package:flutter/material.dart';
// // import 'package:geolocator/geolocator.dart';
// import 'package:kakao_map_plugin/kakao_map_plugin.dart';
//
// class KakaoMapMain extends StatefulWidget {
//   KakaoMapMain({Key? key, this.title}) : super(key: key);
//   final String? title;
//   Clusterer? clusterer;
//
//   @override
//   State<KakaoMapMain> createState() => _KakaoMapMainState();
// }
//
// class _KakaoMapMainState extends State<KakaoMapMain> {
//   late KakaoMapController mapController;
//   late Marker marker;
//   Set<Marker> markers = {}; // 마커 변수
//
//   @override
//   void initState() {
//     marker = Marker(
//       markerId: 'markerId',
//     //   // latLng: LatLng(37.3608681, 126.9306506),
//       latLng: LatLng(37.54060216588197, 126.99000877404947),
//     );
//     super.initState();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             '지도',
//             style: TextStyle(color: Color(0xff2BAE66)),
//           ),
//         ),
//         body: Stack(
//           // width: double.infinity,
//           // height: 500,
//           children: [
//
//             KakaoMap(
//             onMapCreated: ((controller) async {
//
//               mapController = controller;
//
//               markers.add(marker);
//
//                   mapController = controller;
//                   markers.add(Marker(
//                     markerId: markers.length.toString(),
//                     latLng: LatLng(37.54060216588197, 126.99000877404947),
//                     width: 40,
//                     height: 44,
//                     offsetX: 15, //15
//                     offsetY: 44, //44
//                   ));
//               setState(() {});
//             }),
//             currentLevel: 5,
//             markers: markers.toList(),
//             center: LatLng(37.54060216588197, 126.99000877404947),
//
//           ),
//           ]
//         )
//     );
//
//   }
// }
