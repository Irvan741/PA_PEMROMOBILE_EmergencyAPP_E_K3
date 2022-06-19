import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:teslogin/pages/logged/admin/admin_npd.page.dart';
import 'package:teslogin/pages/logged/kota_page.dart';
import 'package:teslogin/pages/logged/npd.page.dart';
import 'package:teslogin/pages/login.dart';

class HomePageController extends GetxController {
  List postJsonKota = [].obs;
  List postJsonidKota = [].obs;
  var url =
      "http://www.emsifa.com/api-wilayah-indonesia/api/provinces.json".obs;
  var dataNpd = [].obs;
  var nomorTelpon = [].obs;
  var idNpd = [].obs;
  var jenis = [].obs;
  var idKota = "".obs;
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
        postJsonKota.insert(i, jsonData[i]['name']);
        postJsonidKota.insert(i, jsonData[i]['id']);
        // print("testie");
        // print(postJsonKota);
      }

      print(postJsonKota);
      Get.to(KotaPage(postJsonKota, postJsonidKota));
    } on Exception catch (e) {
      // TODO
    }
  }

  Future<void> getDataNpd(idKota, CollectionReference npd) async {
    try {
      var slice = idKota.toString().split('');
      var user = FirebaseAuth.instance.currentUser;
      // if(user == null){}
      npd
          .where('provinsi', isEqualTo: slice[0] + slice[1])
          .where('kota', isEqualTo: slice[2] + slice[3])
          .snapshots()
          .listen(
        (data) {
          // return data;
          // print(data.docs.length);
          // print(
          //   'Name ${data.docs[0]['username']}',
          // );
          for (int i = 0; i < data.docs.length; i++) {
            dataNpd.insert(i, data.docs[i]['namaInstansi']);
            nomorTelpon.insert(i, data.docs[i]['nomorTelpon']);
            jenis.insert(i, data.docs[i]['jenisInstansi']);
            idNpd.insert(i, data.docs[i].id);
          }
          // idKota = data.docs[0]['provinsi'] + data.docs[0][p'kota'];
          print(dataNpd);
          if (user == null) {
            Get.to(AdminNpd(idKota, idNpd, npd, dataNpd, nomorTelpon, data.docs,
                data.docs.length, jenis));
          } else {
            Get.to(NdpPage(idKota, idNpd, npd, dataNpd, nomorTelpon, data,
                data.docs.length, jenis));
          }
        },
      );

      // print("tes");

    } on Exception catch (e) {
      print(e.toString());
    }
    // print("testingaja");
    // print(user.);
  }
}
