import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teslogin/controller/homepage_controller.dart';
import 'package:teslogin/pages/logged/npd.page.dart';

class KotaPage extends StatelessWidget {
  // const KotaPage({Key? key}) : super(key: key);
  List kota = [];
  List kotaId = [];
  KotaPage(
    List<dynamic> kota,
    List<dynamic> idKota,
  ) {
    this.kota = kota;
    this.kotaId = idKota;
    print(this.kotaId);
  }
  HomePageController hc = HomePageController();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference npd = firestore.collection('npd');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Kabupaten/Kota'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 15, left: 15, top: 15),
        child: ListView.builder(
          itemCount: kota.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Text(kota[index].toString()),
                    trailing: Icon(Icons.arrow_right_rounded),
                    onTap: () {
                      hc.getDataNpd(kotaId[index], npd);
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      //   return NdpPage();
                      // }));
                    },
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
