import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:teslogin/FadeAnimation.dart';
import 'package:teslogin/controller/account_controller.dart';
import 'package:teslogin/pages/logged/admin/homepage.dart';
import 'package:teslogin/pages/logged/homepage.dart';
import 'package:teslogin/pages/registrasi.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginWidget extends StatelessWidget {
  // const LoginWidget({Key? key}) : super(key: key);
  AccountController ac = AccountController();
  var hide = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Something went wrong"),
                );
              } else if (snapshot.hasData) {
                // print(snapshot.data!.uid);
                return HomeUsers();
              } else {
                LoginWidget();
              }

              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/background.png'),
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
                                            image: AssetImage(
                                                'assets/images/clock.png'))),
                                  )),
                            ),
                            Positioned(
                              child: FadeAnimation(
                                1.6,
                                Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child: Center(
                                    child: Text(
                                      "Login",
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
                                            color: Color.fromRGBO(
                                                143, 148, 251, .2),
                                            blurRadius: 20.0,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey))),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.email_outlined,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Expanded(
                                              child: TextField(
                                                controller: ac.emailEc,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText:
                                                        "Email or Username",
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Colors.grey[400])),
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
                                                          color: Colors
                                                              .grey[400])),
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
                                              child: Obx(() => (hide.value ==
                                                      !true)
                                                  ? FaIcon(
                                                      FontAwesomeIcons.eye,
                                                      color: Colors.grey,
                                                      size: 15,
                                                    )
                                                  : FaIcon(
                                                      FontAwesomeIcons.eyeSlash,
                                                      color: Colors.grey,
                                                      size: 15)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            FadeAnimation(
                                2,
                                GestureDetector(
                                  onTap: () {
                                    if (ac.emailEc.text == "admin" &&
                                        ac.passwordEc.text == "admin") {
                                      final copiedSnack = SnackBar(
                                        content: Text(
                                          "Welcome, Admin!!",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        duration: Duration(seconds: 3),
                                        backgroundColor: Colors.green.shade700,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(copiedSnack);
                                      Get.off(AdminHomepage());
                                    } else {
                                      ac.signIn(ac.emailEc, ac.passwordEc);
                                    }
                                  },
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
                                        "Login",
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
                                style: TextStyle(
                                    color: Color.fromRGBO(143, 148, 251, 1)),
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
                                        color:
                                            Color.fromRGBO(143, 148, 251, 1)),
                                  ),
                                ),
                                FadeAnimation(
                                  1.5,
                                  TextButton(
                                    onPressed: () => Get.to(Regista()),
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
              );
            }));
  }
}
