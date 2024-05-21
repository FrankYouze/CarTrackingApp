// import 'dart:html';

import 'dart:ffi';

import 'package:car_tracking/components/chart.dart';
import 'package:car_tracking/components/my_button.dart';
import 'package:car_tracking/components/my_textfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  final String carId;
  const DetailsPage({super.key, required this.carId});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
   List<double> coData = [];
   Map<dynamic,dynamic> carsData = {};
   Map<dynamic,dynamic> locationDetails = {};
   String _carId = "";
   

//not complete
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref().child('RegisteredCars2');

  // @override
  // void initState() {
  //   super.initState();
  //   fetchGraphData();
  // }

   @override
  void initState() {
    _carId = widget.carId;
    super.initState();
    _database.child(_carId).onValue.listen((event) {
      setState(() {
        carsData = Map<String, dynamic>.from(
            event.snapshot.value as Map<dynamic, dynamic>);
          //  print(carsData.keys.toString());
          print(carsData['cur oilLeve'].toString());
         locationDetails = carsData["location"];
        print(locationDetails);
        locationDetails.forEach((key, value) {
          print(value);
          coData.add(value.toDouble());
          print(coData.length);
         });
          //print(carsData["oilLevel"]);
          
      });
    });
  }

  Future<void> fetchData() async {
   // DataSnapshot snapshot = await _database.child('graphData').once();

   _database.once().then((event) {
  final dataSnapshot = event.snapshot;
  if (dataSnapshot!.value != null) {
     List<dynamic> data = <dynamic>[dataSnapshot.value];
    //userCurrentInfo = Users.fromSnapshot(dataSnapshot);

     setState(() {
     // graphData = data.map((item) => GraphPlotter.fromMap(item)).toList();
    });
  }
});
         

   
  }




  void launchGoogleMaps(double latitude, double longitude) async {
  Uri googleMapsUrl = await Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    await launchUrl(googleMapsUrl);

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Truck Details',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.red,
      ),

      
backgroundColor: Colors.red[100],
body: Center(child:SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(40.0),
    child: Card(
      color: Colors.red[200],
    child: Column(
      children: [
         SizedBox(height: 20),
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
              SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Car ID",style: TextStyle(fontSize: 20),),SizedBox(width: 50),Text(_carId,style: TextStyle(fontSize: 20),)],),
                ),
                   Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Row(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("init oilLevel",style: TextStyle(fontSize: 20),),SizedBox(width: 50),Text(carsData["oilLevel"] ?? "",style: TextStyle(fontSize: 20),)],),
                ),
                   Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Row(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("cur oilLevel",style: TextStyle(fontSize: 20),),SizedBox(width: 50),Text(carsData['cur oilLeve'] ?? " ",style: TextStyle(fontSize: 20),)],),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Row(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("driver",style: TextStyle(fontSize: 20),),SizedBox(width: 50),Text(carsData['driverName'] ?? "",style: TextStyle(fontSize: 20),)],),
                ),
              
                 // MyTextField(controller: TextEditingController(), myText: "something", obscu: false),
                  SizedBox(height: 20),
                  MyButton(
                    text: "Location",
                    onTap: (){
  
                      launchGoogleMaps(coData[0],coData[1]);
                      print(coData[1]);
                  }),


                  SizedBox(height: 300,
                  width: 300,
                  child: myChart(),
                  )
  
      ],
    ),
    
    ),
  ),
),),

    );
  }
}

class GraphPlotter {

final double distances;
final double oilLevels;

GraphPlotter({required this.distances,required this.oilLevels});

final data = <double> [2,8,19,9,10,15];

// return data.mapIndexed(
//   ((index, element) { GraphPlotter(distances: index.toDouble,oilLevels: element.toDouble)}).toList



}