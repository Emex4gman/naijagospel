// import 'package:naijagospel/bloc/user_bloc.dart';
// import 'package:naijagospel/bloc_provider/bloc_provider.dart';
// import 'package:naijagospel/models/user.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class UserPage extends StatefulWidget {
//   @override
//   _UserPageState createState() => _UserPageState();
// }

// class _UserPageState extends State<UserPage> {
//   String _newUser;
//   showd(context) {
//     showDialog(context: context, child: Text('data'));
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(0),
//         child: AppBar(
//           backgroundColor: Colors.white,
//           // brightness: Brightness.light,
//           brightness: Brightness.light,
//         ),
//       ),
//       body: RefreshIndicator(
//         onRefresh: () {
//           return Future.delayed(Duration(seconds: 5), () {
//             print('dsdsdsd');
//           });
//         },
//         child: ListView(
//           children: <Widget>[
//             Center(
//               child: StreamBuilder<User>(
//                   stream: userBloc.outUser,
//                   initialData: User.empty(),
//                   builder: (context, snapshot) {
//                     return Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         LinearProgressIndicator(),
//                         Text('${snapshot.data.name}'),
//                         TextField(
//                           onChanged: (value) => _newUser = value,
//                           decoration:
//                               InputDecoration(labelText: snapshot.data.name),
//                         ),
//                       ],
//                     );
//                   }),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showd(context);
//           // userBloc.updateUser(User(_newUser, 10, 20.0));
//         },
//         tooltip: "Increment",
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
