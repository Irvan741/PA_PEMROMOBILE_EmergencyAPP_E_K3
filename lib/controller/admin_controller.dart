import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:teslogin/pages/logged/admin/admin_kota_page.dart';
import 'package:teslogin/pages/logged/admin/admin_npd.page.dart';
import 'package:teslogin/pages/logged/admin/homepage.dart';

class AdminController extends GetxController {
  TextEditingController namaInstansiEditingController = TextEditingController();
  TextEditingController nomorTelponEditingController = TextEditingController();
  var kota = "".obs;
  var provinsi = "".obs;
  var jenisInstansi = "".obs;
  List postJsonKota = [].obs;
  List postJsonIDkota = [].obs;
  var url =
      "http://www.emsifa.com/api-wilayah-indonesia/api/provinces.json".obs;
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
        postJsonIDkota.insert(i, jsonData[i]['id']);
        // print("testie");
        // print(postJsonKota);
      }

      print(postJsonKota);
      Get.to(AdminKotaPage(postJsonKota, postJsonIDkota));
    } on Exception catch (e) {
      // TODO
    }
  }

  Future deleteNpd(id, npd) async {
    npd.doc(id).delete();
    Get.off(AdminHomepage());
  }

  Future addNpd(
      TextEditingController namaInstansiEditingController,
      TextEditingController nomorTelponEditingController,
      jenisInstansi,
      provinsi,
      kota,
      CollectionReference npd) async {
    // print("testing: " + provinsi.toString());
    npd.add({
      'namaInstansi': namaInstansiEditingController.text,
      'nomorTelpon': nomorTelponEditingController.text,
      'jenisInstansi': jenisInstansi.toString(),
      'provinsi': provinsi.toString(),
      'kota': kota.toString(),
    });
    Get.dialog(
      SimpleDialog(
        title: Text("Data Added"),
        children: [
          Icon(
            Icons.check_circle_rounded,
            color: Colors.green,
          )
        ],
      ),
    );
    // return Get.to(AdminNpd());
  }

  Future updateData(
      TextEditingController namaInstansiEditingController,
      TextEditingController nomorTelponEditingController,
      jenisInstansi,
      // provinsi,
      // kota,
      CollectionReference npd,
      id) async {
    print("testing: " + provinsi.toString());
    print("id: " + id);
    npd.doc(id).update({
      'namaInstansi': namaInstansiEditingController.text,
      'nomorTelpon': nomorTelponEditingController.text,
      'jenisInstansi': jenisInstansi,
    });
    Get.dialog(
      SimpleDialog(
        title: Text("Data Updated"),
        children: [
          Icon(
            Icons.check_circle_rounded,
            color: Colors.green,
          )
        ],
      ),
    );
    // return Get.to(AdminNpd());
  }
}
