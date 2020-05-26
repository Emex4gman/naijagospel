// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:naijagospel/service/state_manager.dart';
// import 'package:naijagospel/utils/font_scaler.dart';
// import 'package:provider/provider.dart';

// class HorizontalEventWidget extends StatefulWidget {
//   @override
//   _HorizontalEventWidgetState createState() => _HorizontalEventWidgetState();
// }

// class _HorizontalEventWidgetState extends State<HorizontalEventWidget> {
//   ScrollController _scrollController;

//   @override
//   Widget build(BuildContext context) {
//     final state = Provider.of<StateManager>(context, listen: false);
//     final fontScaler = FontScaler(context);
//     double _height = MediaQuery.of(context).size.height;
//     double _width = MediaQuery.of(context).size.width;

//     return Container(
//       height: _height * 0.20,
//       color: Colors.white,
//       child: ListView.builder(
//           controller: _scrollController,
//           itemCount: state.listOfEvents.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (ctx, i) {
//             return Container(
//               margin: EdgeInsets.all(1.5),
//               width: _width * 0.30,
//               child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Column(
//                     children: <Widget>[
//                       Expanded(
//                         flex: 4,
//                         child: CachedNetworkImage(
//                           imageUrl: state.listOfEvents[i].imgUrl,
//                           placeholder: (context, url) =>
//                               Center(child: CircularProgressIndicator()),
//                           imageBuilder: (context, imageProvider) => Container(
//                             width: _width * 0.35,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(3),
//                               image: DecorationImage(
//                                   image: imageProvider, fit: BoxFit.cover),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 3),
//                       Flexible(
//                         child: FractionallySizedBox(
//                           child: Container(
//                             padding: EdgeInsets.all(3),
//                             alignment: Alignment.center,
//                             child: Html(
//                               data:
//                                   '${state.listOfEvents[i].title.substring(0, 25)} [...]',

//                               // textAlign: TextAlign.center,
//                               defaultTextStyle: TextStyle(
//                                 fontSize: fontScaler.sp(15),
//                               ),
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.black,
//                               borderRadius: BorderRadius.circular(3),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )),
//             );
//           }),
//     );
//   }
// }
