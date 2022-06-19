import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teslogin/controller/account_controller.dart';
import 'package:teslogin/controller/homepage_controller.dart';
import 'package:teslogin/pages/logged/kota_page.dart';

class HomeUsers extends StatelessWidget {
  // const HomeUsers({Key? key}) : super(key: key);
  HomeUsers() {
    // ac.getDataUser();
    // gdu();
    getProvinsi();
  }
  // gdu() async {
  //   await ac.getDataUser();
  // }
  dataKota(idProvinsi) async {
    await loadDataKota(idProvinsi);
    print("testie" + hc.postJsonKota.toString());
    // print("holadunnya: " + ac.postJson.toString());
  }

  Future loadDataKota(idProvinsi) async {
    await hc.getKota(idProvinsi);
  }

  final user = FirebaseAuth.instance.currentUser!;
  AccountController ac = AccountController();
  HomePageController hc = HomePageController();

  getProvinsi() async {
    await loadDataProvinsi();
    print("testing" + ac.postJson.toString());
    // print("holadunnya: " + ac.postJson.toString());
  }

  Future loadDataProvinsi() async {
    await ac.getProvinsiName();
  }

  @override
  Widget build(BuildContext context) {
    ac.getDataUser();
    // var namaUser2 = "";
    // Future loadUserData() async {
    //   await ac.getDataUser(userFirestore, user);
    // }

    // loadUserData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Provinsi'),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 129, 127, 127),
        child: ListView(padding: EdgeInsets.all(0.0), children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Obx(() => Text(ac.userName.toString())),
            accountEmail: Text(user.email!),
            currentAccountPicture: CircleAvatar(
              backgroundImage: ExactAssetImage('assets/images/admin.png'),
            ),
            // otherAccountsPictures: <Widget>[
            //   CircleAvatar(
            //     child: Text('A'),
            //     backgroundColor: Colors.white60,
            //   ),
            //   CircleAvatar(
            //     child: Text('R'),
            //   ),
            // ],
            onDetailsPressed: () {},
            decoration: BoxDecoration(
                image:
                    // image background source https://www.freepik.com/vectors/light-gradient
                    DecorationImage(
                        image:
                            AssetImage("assets/images/rm218batch4-ning-34.jpg"),
                        fit: BoxFit.cover)),
          ),
          ListTile(
            title: Text('Emergency app'),
          ),
          // ListTile(
          //   title: Text('blue print'),
          //   leading: Icon(Icons.chat),
          //   onLongPress: () {},
          // ),
          // ListTile(
          //   title: Text('blue print'),
          //   leading: Icon(Icons.call),
          //   onLongPress: () {},
          // ),
          Divider(),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
            onLongPress: () {},
          ),
          Divider(),
          ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.close),
              onTap: () => FirebaseAuth.instance.signOut()),
        ]),
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.only(right: 15, left: 15, top: 15),
          child: ListView.builder(
            itemCount: ac.postJson.length,
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
                      title: Text(ac.postJson[index].toString()),
                      trailing: Icon(Icons.arrow_right_rounded),
                      onTap: () {
                        // print(ac.postJsonIdKota[index].toString());
                        dataKota(ac.postJsonIdKota[index].toString());
                        // Get.to(KotaPage());
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        //   return KotaPage();
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
      ),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Center(
      //       child: Text(user.email!),
      //     ),
      //     Center(
      //       child: ElevatedButton.icon(
      //         onPressed: () => FirebaseAuth.instance.signOut(),
      //         icon: Icon(Icons.arrow_back),
      //         label: Text("Sign Out"),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
