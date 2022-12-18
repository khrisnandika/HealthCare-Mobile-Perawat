import 'package:flutter/material.dart';
import 'package:healthcare_perawat/core/const.dart';
import 'package:healthcare_perawat/core/flutter_icons.dart';
import 'package:healthcare_perawat/pages/Akun/hapus_akun.dart';
import 'package:healthcare_perawat/pages/Akun/ubah_password.dart';

class DetailSetting extends StatefulWidget {
  const DetailSetting({super.key});

  @override
  State<DetailSetting> createState() => _DetailSettingState();
}

class _DetailSettingState extends State<DetailSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Pengaturan",
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
      body: Container(
        child: Column(
          children: [
            _ubahButton(context),
            _hapusAkun(context),
          ],
        ),
      ),
    );
  }

  Widget _ubahButton(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: 450,
          height: 75,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ubahPassword(),
                    ));
              },
              style: TextButton.styleFrom(
                backgroundColor: kHealthCareColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Ubah password',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: kBackgroundColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _hapusAkun(BuildContext context) {
    return Column(
        children: [
          Container(
            width: 450,
            height: 75,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => hapusPassword(),
                      ));
                },
                style: TextButton.styleFrom(
                  backgroundColor: kOrangeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Hapus akun',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: kBackgroundColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
  }
}
