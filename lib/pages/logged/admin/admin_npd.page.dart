import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teslogin/controller/admin_controller.dart';
import 'package:teslogin/pages/logged/admin/add_data_npd.dart';
import 'package:teslogin/pages/logged/admin/edit_data_npd.dart';

class AdminNpd extends StatelessWidget {
  // const AdminNpd({Key? key}) : super(key: key);
  var idKota;
  var idNpd;
  var npd;
  var dataNpd;
  var nomorTelpon;
  var data;
  var dataLength;
  var jenis;

  AdminNpd(idKota, idNpd, npd, dataNpd, nomorTelpon, data, dataLength, jenis) {
    this.idKota = idKota;
    this.idNpd = idNpd;
    this.npd = npd;
    this.dataNpd = dataNpd;
    this.nomorTelpon = nomorTelpon;
    this.data = data;
    this.dataLength = dataLength;
    this.jenis = jenis;
    // print(dataNpd);
  }
  AdminController ac = AdminController();
  // final user = ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Panggilan Darurat'),
        actions: [
          ElevatedButton(
            onPressed: () => Get.to(AddDataNpd(idKota)),
            child: Icon(Icons.add),
            style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey,
            ),
          )
        ],
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
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
          ),
          onPressed: () {
            // print("testie");
          },

          onLongPress: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                      height: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Color.fromARGB(255, 0, 0, 0),
                                backgroundColor:
                                    Color.fromARGB(255, 237, 27, 27),
                              ),
                              onPressed: () {
                                ac.deleteNpd(idNpd[index], npd);
                                // Navigator.of(context).pop();
                              },
                              child: Text(
                                "Hapus",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Color.fromARGB(255, 0, 0, 0),
                                backgroundColor:
                                    Color.fromARGB(255, 33, 89, 220),
                              ),
                              onPressed: () {
                                Get.to(EditDataForm(data[index], idNpd[index]));
                                // Navigator.of(context).pop();
                              },
                              child: Text(
                                "Edit",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
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
