import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:healthcare_perawat/core/const.dart';
import 'package:healthcare_perawat/core/flutter_icons.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 30,
              //     vertical: 10,
              //   ),
              //   child: TextField(
              //     obscureText: true,
              //     decoration: InputDecoration(
              //       labelText: 'Password Awal',
              //       hintText: 'Password Awal',
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password Baru',
                    hintText: 'Password Baru',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Konfirmasi Password Baru',
                    hintText: 'Konfirmasi Password Baru',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              new SizedBox(
                height: 50,
                width: 335,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kHealthCareColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
