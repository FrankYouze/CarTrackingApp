import 'package:car_tracking/components/my_button.dart';
import 'package:car_tracking/components/my_textfield.dart';
import 'package:car_tracking/pages/HomePage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RegPage extends StatelessWidget {
   RegPage({super.key});
     final DatabaseReference _databaseRef =
      FirebaseDatabase.instance.ref().child('RegisteredCars2');

  final IDcon = TextEditingController();
  final driverCon = TextEditingController();
  final OilCon = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                // const Text(
                //   "Sign Up As Service Provider",
                //   style: TextStyle(
                //       color: Color.fromARGB(255, 44, 43, 43),
                //       fontSize: 25,
                //       fontWeight: FontWeight.bold),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.fire_truck,
                    color: Colors.white70,
                    size: 130,
                  ),
                ),
                const Text(
                  "Car registration",
                  style: TextStyle(
                      color: Color.fromARGB(255, 44, 43, 43),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  myText: "enter truck id",
                  obscu: false,
                  controller: IDcon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  myText: "enter driver's name",
                  obscu: false,
                  controller: driverCon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  myText: "enter initial OIL LEVEL",
                  obscu: false,
                  controller: OilCon,
                ),
                const SizedBox(
                  height: 20,
                ),
                // MyTextField(
                //   myText: "enter password",
                //   obscu: true,
                //   controller: passcon,
                // ),
                const SizedBox(
                  height: 20,
                ),
                // MyTextField(
                //   myText: "Confirm password",
                //   obscu: true,
                //   controller: passcon,
                // ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  text: "Register",
                  onTap: () async {
                  await  _databaseRef.child(IDcon.text)
                       .set({
                          "truckId": IDcon.text,
                          "driverName": driverCon.text,
                          "oilLevel": OilCon.text,
                          "location": ""
                       
                        });
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                 
               
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 