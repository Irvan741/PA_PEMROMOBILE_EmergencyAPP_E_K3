import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class NdpPage extends StatelessWidget {
  // const NdpPage({Key? key}) : super(key: key);
  // final user = ;
  var idKota;
  var idNpd;
  var npd;
  var dataNpd;
  var nomorTelpon;
  var data;
  var dataLength;
  var jenis;

  NdpPage(idKota, idNpd, npd, dataNpd, nomorTelpon, data, dataLength, jenis) {
    this.idKota = idKota;
    this.idNpd = idNpd;
    this.npd = npd;
    this.dataNpd = dataNpd;
    this.nomorTelpon = nomorTelpon;
    this.data = data;
    this.dataLength = dataLength;
    this.jenis = jenis;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Panggilan Darurat'),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.blue.shade700,
      // ),
      body: GridView.builder(
        itemCount: dataLength,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 30,
          childAspectRatio: 1 / 1,
        ),

        padding: EdgeInsets.fromLTRB(15, 50, 15, 15),
        itemBuilder: (context, index) => ElevatedButton(
          onPressed: () => UrlLauncher.launch("tel://${nomorTelpon[index]}"),
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
          ),
          // on
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (jenis[index] == "Pemadam Kebakaran")
                Icon(
                  Icons.fire_truck_sharp,
                  size: 55,
                ),
              if (jenis[index] == "Ambulance")
                Icon(
                  Icons.medical_information,
                  size: 55,
                ),
              if (jenis[index] == "Polisi")
                Icon(
                  Icons.local_police,
                  size: 55,
                ),
              if (jenis[index] == "SAR/BASARNAS")
                Icon(
                  Icons.warning,
                  size: 55,
                ),
              if (jenis[index] == "PLN")
                Icon(
                  Icons.bolt,
                  size: 55,
                ),
              Text(
                dataNpd[index],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        // StartHapus

        // EndHapus
      ),
    );
  }
}
