import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:teslogin/controller/account_controller.dart';

import '../FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class Regista extends StatelessWidget {
  // Regista({Key? key}) : super(key: key);
  Regista() {
    getProvinsi();
  }

  getProvinsi() async {
    await loadDataProvinsi();
    print("testing" + ac.postJson.toString());
    // print("holadunnya: " + ac.postJson.toString());
  }

  dataKota(idProvinsi) async {
    await loadDataKota(idProvinsi);
    print("testie" + ac.postJsonKota.toString());
    // print("holadunnya: " + ac.postJson.toString());
  }

//   initState() {
// // set initial loading widgets
//     loadDataProvinsi();
//     print("testig");
//   }

  Future loadDataProvinsi() async {
    await ac.AccountControllers();
  }

  Future loadDataKota(idProvinsi) async {
    await ac.getKota(idProvinsi);
  }

  AccountController ac = Get.put(AccountController());
  var hide = true.obs;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('user');

    // print(ac.testingAja);
    // print("halugays: " + ac.testingAja.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 40,
                          left: 3,
                        ),
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeAnimation(
                          1,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-1.png'))),
                          )),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(
                          1.3,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-2.png'))),
                          )),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(
                          1.5,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/clock.png'))),
                          )),
                    ),
                    Positioned(
                      child: FadeAnimation(
                        1.6,
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                        1.8,
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.user,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: ac.fullNameEc,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Nama Lengkap",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.envelope,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: ac.emailEc,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Email or Phone number",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.lock,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Obx(
                                        () => TextField(
                                          obscureText: hide.value,
                                          controller: ac.passwordEc,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400]),
                                          ),
                                          enableSuggestions: false,
                                          autocorrect: false,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (hide.value == true) {
                                          hide.value = false;
                                        } else {
                                          hide.value = true;
                                        }
                                      },
                                      child: Obx(() => (hide.value == !true)
                                          ? FaIcon(
                                              FontAwesomeIcons.eye,
                                              color: Colors.grey,
                                              size: 15,
                                            )
                                          : FaIcon(FontAwesomeIcons.eyeSlash,
                                              color: Colors.grey, size: 15)),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Obx(
                                    () => DropdownSearch<String>(
                                        popupProps: PopupProps.menu(
                                          showSearchBox: true,
                                          showSelectedItems: true,
                                        ),

                                        // ,
                                        // items: ac.testingAja.value<String>,

                                        items: ac.postJson.map((val) {
                                          // ac.indexProvinsi = index.toString();
                                          return val.toString();
                                        }).toList(),
                                        onChanged: (value) {
                                          final string = value.toString();
                                          final splitted = string.split(' ');
                                          final splitted2 =
                                              splitted[1].split(',');

                                          // print(value);
                                          // print(splitted[1]);
                                          // return value;
                                          // print(splitted2[0]);
                                          dataKota(splitted2[0]);
                                          ac.dataProvinsiSelected = string.obs;
                                        }

                                        // selectedItem: "Brazil",
                                        ),
                                  )),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: Obx(
                                  () => DropdownSearch<String>(
                                    popupProps: PopupProps.menu(
                                      showSearchBox: true,
                                      showSelectedItems: true,
                                    ),

                                    // ,
                                    // items: ac.testingAja.value<String>,

                                    items: ac.postJsonKota
                                        .map<String>((e) => e.toString())
                                        .toList(),

                                    onChanged: (value) {
                                      ac.dataKotaSelected =
                                          value.toString().obs;
                                    },

                                    // selectedItem: "Brazil",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                        2,
                        GestureDetector(
                          onTap: (() {
                            // print('tes'); signIn
                            // print(ac.testingAja);
                            ac.signUp(
                                ac.fullNameEc,
                                ac.emailEc,
                                ac.passwordEc,
                                ac.dataProvinsiSelected,
                                ac.dataKotaSelected,
                                users);
                            ac.fullNameEc.text = '';
                            ac.emailEc.text = '';
                            ac.passwordEc.text = '';
                          }),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ])),
                            child: Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 70,
                    ),
                    FadeAnimation(
                      1.5,
                      Text(
                        "Forgot Password?",
                        style:
                            TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeAnimation(
                          1.5,
                          Text(
                            "Belum Punya Akun ?",
                            style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1)),
                          ),
                        ),
                        FadeAnimation(
                          1.5,
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Daftar",
                              style: TextStyle(
                                color: Color.fromRGBO(68, 72, 153, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
