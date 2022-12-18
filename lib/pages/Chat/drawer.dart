import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_perawat/core/const.dart';
import 'package:healthcare_perawat/core/methods_firebase.dart';
import 'package:healthcare_perawat/pages/Akun/akun_profile.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawwerScreenState createState() => _DrawwerScreenState();
}

class _DrawwerScreenState extends State<DrawerScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  String fullname = '';
  String profilepic = '';

  Future getDocId() async {
    var result = await _firebaseFirestore
        .collection('users')
        .where('uid', isEqualTo: user?.uid)
        .get();
    setState(() {
      fullname = result.docs[0]['fullname'];
      profilepic = result.docs[0]['profilepic'];
    });
  }

  @override
  void initState() {
    super.initState();
    getDocId();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(fullname),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(profilepic),
          ),
          accountEmail: Text(user!.email!),
          decoration: BoxDecoration(
            color: kHealthCareColor,
          ),
        ),
        DrawerListTile(
          iconData: Icons.person,
          title: "Akun",
          onTilePressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AkunProfile(),
              ),
            );
          },
        ),
        const Divider(thickness: 1),
        DrawerListTile(
          iconData: Icons.logout_outlined,
          title: "Logout",
          onTilePressed: () {
            logOut(context);
          },
        ),
      ],
    ));
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTilePressed;

  const DrawerListTile(
      {required this.iconData,
      required this.title,
      required this.onTilePressed});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
