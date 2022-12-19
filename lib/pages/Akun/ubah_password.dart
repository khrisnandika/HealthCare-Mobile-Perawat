import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_perawat/core/const.dart';
import 'package:healthcare_perawat/core/flutter_icons.dart';
import 'package:healthcare_perawat/models/ChatModels/UIHelper.dart';
import 'package:healthcare_perawat/pages/Akun/akun_profile.dart';

class ubahPassword extends StatefulWidget {
  @override
  State<ubahPassword> createState() => _ubahPasswordState();
}

class _ubahPasswordState extends State<ubahPassword> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;
  bool _obscureCText = true;

  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNodes = FocusNode();
  Color? color;

  void checkValues() {
    String cPassword = currentPasswordController.text.trim();
    String nPassword = newPasswordController.text.trim();

    if (cPassword == "" || nPassword == "") {
      UIHelper.showAlertDialog(
          context, "Data tidak lengkap", "Harap lengkapi semua kolom");
    } else {
      _alertDialog();
    }
  }

  void _alertDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Ubah Password"),
          content: SizedBox(
            height: 95,
            child: Column(
              children: [
                const Text("Apakah anda benar ingin mengubah password?"),
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
                        child: Text("Hapus"),
                        onPressed: () {
                          _changePassword(currentPasswordController.text,
                              newPasswordController.text);
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

  void _changePassword(String currentPassword, String newPassword) async {
    final user = await FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: user!.email!, password: currentPasswordController.text);

    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AkunProfile(),
          ),
        );
        UIHelper.showAlertDialog(
            context, "Berhasil", "Password anda berhasil diubah !");
      }).catchError(
        (error) {
          UIHelper.showAlertDialog(
              context, "Kesalahan terjadi", error.message.toString());
        },
      );
    }).catchError((err) {
      UIHelper.showAlertDialog(
          context, "Kesalahan terjadi", err.message.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    _focusNode.addListener(
      () {
        setState(
          () {
            color = _focusNode.hasFocus ? kHealthCareColor : Colors.black54;
          },
        );
      },
    );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Ubah Password",
          style: TextStyle(
            color: kTitleTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: kTitleTextColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: TextField(
                  focusNode: _focusNodes,
                  controller: currentPasswordController,
                  obscureText: _obscureText,
                  cursorColor: kHealthCareColor,
                  decoration: InputDecoration(
                    labelText: 'Password Lama',
                    labelStyle: TextStyle(
                      color: _focusNodes.hasFocus
                          ? kHealthCareColor
                          : Colors.black54,
                    ),
                    hintText: 'Masukkan password lama anda',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: kHealthCareColor,
                      ),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black38,
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: _focusNodes.hasFocus
                            ? kHealthCareColor
                            : Colors.black26,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: TextField(
                  focusNode: _focusNode,
                  controller: newPasswordController,
                  obscureText: _obscureCText,
                  cursorColor: kHealthCareColor,
                  decoration: InputDecoration(
                    labelText: 'Password Baru',
                    labelStyle: TextStyle(
                      color: _focusNode.hasFocus
                          ? kHealthCareColor
                          : Colors.black54,
                    ),
                    hintText: 'Masukkan password baru anda',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: kHealthCareColor,
                      ),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black38,
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureCText = !_obscureCText;
                        });
                      },
                      child: Icon(
                        _obscureCText ? Icons.visibility : Icons.visibility_off,
                        color: _focusNode.hasFocus
                            ? kHealthCareColor
                            : Colors.black26,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width * 0.85,
                child: ElevatedButton(
                  onPressed: () {
                    checkValues();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kHealthCareColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Simpan'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
