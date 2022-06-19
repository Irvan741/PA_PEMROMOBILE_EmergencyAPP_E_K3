import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:get/get.dart';
import 'package:teslogin/controller/admin_controller.dart';

class AddDataNpd extends StatelessWidget {
  // const AddDataNpd({Key? key}) : super(key: key);
  var idKota;
  var idKotaList = [];
  AddDataNpd(idKota) {
    this.idKota = idKota;
    this.idKotaList = this.idKota.split('');
    // print(tes);
    // print(idKota);
  }
  final formKey = GlobalKey<FormState>();
  // final AdminController ac = AdminController();
  AdminController ac = AdminController();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference npd = firestore.collection('npd');
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 238, 28, 37),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Add Data Form"),
        // backgroundColor: Color.fromARGB(255, 159, 17, 24),
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
                fontSize: 20,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Divider(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: ac.namaInstansiEditingController,
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
                controller: ac.nomorTelponEditingController,
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
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

                    ac.jenisInstansi = value!.obs;
                    // print(splitted[1]);
                    // return value;
                    // print(splitted2[0]);
                    // dataKota(splitted2[0]);
                    // ac.dataProvinsiSelected = string.obs;
                  }

                  // selectedItem: "Brazil",
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
              ),
              onPressed: () {
                ac.addNpd(
                    ac.namaInstansiEditingController,
                    ac.nomorTelponEditingController,
                    ac.jenisInstansi,
                    (idKotaList[0] + idKotaList[1]),
                    (idKotaList[2] + idKotaList[3]),
                    npd);
              },
              child: Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }
}
