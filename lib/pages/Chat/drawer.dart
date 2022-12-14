import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_perawat/core/const.dart';
import 'package:healthcare_perawat/core/methods_firebase.dart';
import 'package:healthcare_perawat/pages/Akun/akun_profile.dart';
import 'package:healthcare_perawat/pages/Akun/detail_setting.dart';
import 'package:healthcare_perawat/pages/Akun/edit_akun.dart';

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

  void _alertDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Keluar"),
          content: SizedBox(
            height: 85,
            child: Column(
              children: [
                const Text("Apakah anda benar ingin keluar?"),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 38,
                      width: 90,
                      child: ElevatedButton(
                        child: Text("Batal"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kHealthCareColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 38,
                      width: 90,
                      child: ElevatedButton(
                        child: Text("Keluar"),
                        onPressed: () {
                          logOut(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kdeleteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(user!.displayName!),
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
                builder: (context) => EditAkun(),
              ),
            );
          },
        ),
        DrawerListTile(
          iconData: Icons.settings,
          title: "Pengaturan",
          onTilePressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailSetting(),
              ),
            );
          },
        ),
        const Divider(thickness: 1),
        DrawerListTile(
          iconData: Icons.logout_outlined,
          title: "Keluar",
          onTilePressed: () {
            _alertDialog();
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
