// import 'package:car_tracking/components/cust_car_tile.dart';
import 'package:car_tracking/pages/details_page.dart';
import 'package:car_tracking/pages/reg_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref().child('RegisteredCars2');

  Map<String, dynamic> CarsData = {};

  @override
  void initState() {
    super.initState();
    _database.onValue.listen((event) {
      setState(() {
        CarsData = Map<String, dynamic>.from(
            event.snapshot.value as Map<dynamic, dynamic>);
            print(CarsData.keys.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: Text('Car tracking app'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Text('List of registered Cars'),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: CarsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(CarsData.keys.elementAt(index)),
                   //  subtitle:Text(CarsData[CarsData.keys.toList()[index]]),
                        //subtitle:Text(CarsData[CarsData.keys.toList()[index]]),
                      leading: Icon(Icons.car_crash),
                      trailing: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.edit),
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(carId: CarsData.keys.elementAt(index),),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegPage(),
              ),
            );
          },
          child: Icon(
            Icons.add,
            size: 30,
          ),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
