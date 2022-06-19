import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teslogin/controller/admin_controller.dart';

class EditDataForm extends StatelessWidget {
  // const EditDataForm({Key? key}) : super(key: key);
  TextEditingController namaInstansi = TextEditingController();
  TextEditingController nomorTelpon = TextEditingController();
  var jenisInstansi;
  var idNpd;
  EditDataForm(npd, idNpd) {
    this.namaInstansi.text = npd['namaInstansi'];
    this.nomorTelpon.text = npd['nomorTelpon'];
    this.jenisInstansi = npd['jenisInstansi'];
    this.idNpd = idNpd;
  }
  AdminController ac = AdminController();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference npd = firestore.collection('npd');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Edit Data Panggilan Darurat"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Divider(),
          Center(
            child: Text(
              "Nomor Panggilan Darurat",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Divider(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: namaInstansi,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    icon: Icon(Icons.apartment),
                    hintText: "Nama Instansi"),
              ),
            ),
          ),
          Divider(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: nomorTelpon,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    icon: Icon(Icons.phone),
                    hintText: "Nomor Panggilan Instansi"),
              ),
            ),
          ),
          Divider(
            color: Colors.black26,
            height: 20,
            // thickness: 10,
          ),
          Center(
            child: Text(
              "Jenis Instansi",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              child: DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSearchBox: true,
                  showSelectedItems: true,
                ),

                // ,
                // items: ac.testingAja.value<String>,

                items: [
                  'Umum',
                  'Pemadam Kebakaran',
                  'Ambulance',
                  'Polisi',
                  'SAR/BASARNAS',
                  'PLN',
                ],
                onChanged: (value) {
                  // final string = value.toString();
                  // final splitted = string.split(' ');
                  // final splitted2 =
                  //     splitted[1].split(',');
                  // print(value.runtimeType);

                  jenisInstansi = value!;
                  // print(splitted[1]);
                  // return value;
                  // print(splitted2[0]);
                  // dataKota(splitted2[0]);
                  // ac.dataProvinsiSelected = string.obs;
                },

                selectedItem: jenisInstansi.toString(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                print(namaInstansi.text);
                print(nomorTelpon.text);
                print(jenisInstansi);
                print(npd);
                print(idNpd);
                ac.updateData(
                    namaInstansi, nomorTelpon, jenisInstansi, npd, idNpd);
                // ac.addNpd(
                //     ac.namaInstansiEditingController,
                //     ac.nomorTelponEditingController,
                //     ac.jenisInstansi,
                //     (idKotaList[0] + idKotaList[1]),
                //     (idKotaList[2] + idKotaList[3]),
                //     npd);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
              ),
              child: Text("Save"),
            ),
          ),
        ],
      ),
    );
  }
}
