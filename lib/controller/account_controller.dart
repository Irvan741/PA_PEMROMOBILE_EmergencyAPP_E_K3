import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:teslogin/pages/login.dart';

class AccountController extends GetxController with StateMixin<dynamic> {
  Future<void> AccountControllers() async {
    // getProvinsi();
    try {
      final response = await get(Uri.parse(url.toString()));
      final jsonData = await jsonDecode(response.body) as List;

      // print(response);
      // print(jsonData);

      // print(postJson);
      for (int i = 0; i < jsonData.length; i++) {
        postJson.insert(i, jsonData[i]);
        // print(i);
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  TextEditingController fullNameEc = TextEditingController();
  TextEditingController emailEc = TextEditingController();
  TextEditingController passwordEc = TextEditingController();
  // var
  // var indexProvinsi = "".obs;
  var dataProvinsiSelected = "".obs;
  var dataKotaSelected = "".obs;
  var url =
      "http://www.emsifa.com/api-wilayah-indonesia/api/provinces.json".obs;
  List postJson = [].obs;

  List postJsonIdKota = [].obs;
  List postJsonKota = [].obs;
  var userName = "".obs;
  Future<void> getProvinsiName() async {
    // getProvinsi();
    try {
      final response = await get(Uri.parse(url.toString()));
      final jsonData = await jsonDecode(response.body) as List;

      // print(response);
      // print(jsonData);

      // print(postJson);
      for (int i = 0; i < jsonData.length; i++) {
        postJson.insert(i, jsonData[i]['name']);
        postJsonIdKota.insert(i, jsonData[i]['id']);
        // print(i);
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  Future signIn(
      TextEditingController emailEc, TextEditingController passwordEc) async {
    try {
      // showDialog(context: context, builder: builder)
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailEc.text, password: passwordEc.text);
      Get.dialog(
        SimpleDialog(
          title: Text("Loged"),
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: Colors.green,
            )
          ],
        ),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future signUp(
      TextEditingController fullNameEc,
      TextEditingController emailEc,
      TextEditingController passwordEc,
      provinsi,
      kota,
      CollectionReference users) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailEc.text,
        password: passwordEc.text,
      );
      // print("testing: " + provinsi.toString());
      users.add({
        'fullName': fullNameEc.text,
        'username': emailEc.text,
        'password': passwordEc.text,
        'provinsi': provinsi.toString(),
        'kota': kota.toString(),
      });
      Get.dialog(
        SimpleDialog(
          title: Text("Account Created"),
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: Colors.green,
            )
          ],
        ),
      );
      return Get.to(LoginWidget());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void getProvinsi() async {}

  Future<void> getKota(kodeProvinsi) async {
    try {
      // RxString kodeProvinsi = "".obs;
      print('Hoollla dunnya');
      var urlKota =
          'http://www.emsifa.com/api-wilayah-indonesia/api/regencies/${kodeProvinsi.toString()}.json'
              .obs;
      print("URL KOTAAA: ");
      print(urlKota);
      final responsie = await get(Uri.parse(urlKota.toString()));

      final jsonData = await jsonDecode(responsie.body) as List;

      print(jsonData);

      // print(jsonData);

      // print(postJson);
      for (int i = 0; i < jsonData.length; i++) {
        postJsonKota.insert(i, jsonData[i]);
        print("testie");
        print(postJsonKota);
      }

      // print(postJson);
    } on Exception catch (e) {
      // TODO
    }
  }

  Future<void> getDataUser() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userFirestore = firestore.collection('user');
    final logged = FirebaseAuth.instance.currentUser!;
    print(logged.email);
    userFirestore
        .where('username', isEqualTo: logged.email!)
        .snapshots()
        .listen((data) {
      print(data.docs[0]['fullName']);
      userName = data.docs[0]['fullName'].obs;
      // print("testie" + userName.toString());
    });
  }
}
