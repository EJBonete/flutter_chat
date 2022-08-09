// import 'package:chat/models/usuario.dart';
// import 'package:flutter/material.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

// class UsersScreen extends StatefulWidget {
//   const UsersScreen({Key? key}) : super(key: key);

//   @override
//   State<UsersScreen> createState() => _UsersScreenState();
// }

// class _UsersScreenState extends State<UsersScreen> {
//   final RefreshController _refreshController =
//       RefreshController(initialRefresh: false);

//   final user = [
//     Usuario(email: 'test1@test.com', name: 'maria', online: true, uid: '1'),
//     Usuario(email: 'test2@test.com', name: 'Carolina', online: false, uid: '2'),
//     Usuario(email: 'test3@test.com', name: 'Natsumi', online: true, uid: '3'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Mi nombre',
//             style: TextStyle(color: Colors.black87),
//           ),
//           elevation: 1,
//           backgroundColor: Colors.white,
//           leading: IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.exit_to_app,
//                 color: Colors.black87,
//               )),
//           actions: [
//             Container(
//               margin: const EdgeInsets.only(right: 5),
//               child:
//                   //const Icon(Icons.check_circle, color: Colors.blue[400]),
//                   const Icon(Icons.offline_bolt, color: Colors.red),
//             )
//           ],
//         ),
//         body: SmartRefresher(
//           controller: _refreshController,
//           enablePullDown: true,
//           onRefresh: _cargarUsuarios,
//           header: WaterDropHeader(
//             complete: Icon(Icons.check, color: Colors.blue[400]),
//             waterDropColor: Colors.blue,
//           ),
//           child: _ListviewUsuarios(),
//         ));
//   }

//   // ignore: non_constant_identifier_names
//   ListView _ListviewUsuarios() {
//     return ListView.separated(
//       physics: const BouncingScrollPhysics(),
//       itemBuilder: (_, index) => _UsuarioListTitle(user: user, index: index),
//       separatorBuilder: (_, index) => const Divider(),
//       itemCount: user.length,
//     );
//   }

//   _cargarUsuarios() async {
//     await Future.delayed(const Duration(milliseconds: 1000));
//     // if failed,use refreshFailed()
//     _refreshController.refreshCompleted();
//   }
// }

// class _UsuarioListTitle extends StatelessWidget {
//   final int index;
//   const _UsuarioListTitle({
//     Key? key,
//     required this.user,
//     required this.index,
//   }) : super(key: key);

//   final List<Usuario> user;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//         title: Text(user[index].name),
//         subtitle: Text(user[index].email),
//         leading: CircleAvatar(
//           backgroundColor: Colors.blue[200],
//           child: Text(user[index].name.substring(0, 2)),
//         ),
//         trailing: Container(
//           width: 10,
//           height: 10,
//           decoration: BoxDecoration(
//               color: user[index].online ? Colors.green[300] : Colors.red,
//               borderRadius: BorderRadius.circular(100)),
//         ));
//   }
// }
