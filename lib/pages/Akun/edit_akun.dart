import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_perawat/core/const.dart';
import 'package:healthcare_perawat/core/flutter_icons.dart';

class EditAkun extends StatefulWidget {
  @override
  State<EditAkun> createState() => _EditAkunState();
}

class _EditAkunState extends State<EditAkun> {
  // final global = Global();

  // final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // final User? user = FirebaseAuth.instance.currentUser;

  // final TextEditingController _namaController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();

  // String alamat = '';

  // Future getDocId() async {
  //   var result = await _firebaseFirestore
  //       .collection('user_details')
  //       .where('uid', isEqualTo: user?.uid)
  //       .get();
  //   setState(() {
  //     alamat = result.docs[0]['alamat'];
  //   });
  // }
  // Future editData() async {
  //   if(_namaController.text!=''){
  //     user!.updateDisplayName(_namaController.text);

  //   };
  //   // if(_emailController.text!=''){
  //   //   user!.updateEmail(_emailController.text);
  //   //   print('object');
  //   // };
  // }
  // @override
  // void initState() {
  //   getData();

  //   super.initState();
  // }
  // getData() {
  //   setState(() {
  //     _namaController.text = user!.displayName!;
  //     _emailController.text= user!.email!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Edit Akun",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: kHealthCareColor,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/image/avatar.png',
                      ),
                      radius: 70,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      height: 46,
                      width: 46,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.edit,
                        ),
                        backgroundColor: kHealthCareColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 10,
              ),
              child: TextField(
                // controller: _namaController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: kHealthCareColor,
                      ),
                    ),
                    // labelText: 'Nama Lengkap',
                    // labelStyle: GoogleFonts.montserrat(
                    //   color: kHealthCareColor,
                    //   fontSize: 14
                    // ),
                    // hintText: user!.displayName!,
                    hintText: "Krisna",
                    hintStyle: GoogleFonts.montserrat(fontSize: 14)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 10,
              ),
              child: TextField(
                // controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: kHealthCareColor,
                      ),
                    ),
                    // labelText: 'Email',
                    // labelStyle: GoogleFonts.montserrat(
                    //   color: kHealthCareColor,
                    //   fontSize: 14
                    // ),
                    // hintText: user!.email!,
                    hintText: "khrisnandika@gmail.com",
                    hintStyle: GoogleFonts.montserrat(fontSize: 14)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: kHealthCareColor,
                      ),
                    ),
                    labelText: 'Alamat',
                    labelStyle: GoogleFonts.montserrat(
                        color: kHealthCareColor, fontSize: 14),
                    hintText: 'masukkan alamat lengkap anda',
                    hintStyle: GoogleFonts.montserrat(fontSize: 14)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new SizedBox(
              height: 50,
              width: 325,
              child: ElevatedButton(
                // onPressed: () async => await editData(),
                onPressed: () => null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kHealthCareColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Simpan',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
