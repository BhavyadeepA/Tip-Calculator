


import 'dart:async';

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     theme: ThemeData(
       primarySwatch: Colors.cyan,
     ),
     title: "Calcotip",
     home: SplashPage(),
   );
  }

}

class SplashPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SplashState();
  }
  class SplashState extends State<SplashPage>{

  @override
    initState(){
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomeScreen()),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellow,
      child: Center(
        child: Text('TIP CALCULATOR',style: TextStyle(fontSize: 30),),
      ),
    );
  }

}


class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<HomeScreen> {
  @override
  var amtController= TextEditingController();
  var tipController= TextEditingController();

  var amt = "";
  var tip = "";

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text('TIP CALCULATOR', style: TextStyle(color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: amtController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Amount To Pay',
                    label: Text("Amount"),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.cyan,
                        width: 1,
                      ),
                      gapPadding: 4,
                    ),
                    prefixIcon: Icon(Icons.currency_rupee),
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: tipController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: 'Your Tip',
                    label: Text("Tip"),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                          color: Colors.cyan,
                          width: 1
                      ),
                      gapPadding: 4,
                    ),
                    prefixIcon: Icon(Icons.currency_rupee),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 200,
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {

                  if(amtController.text.toString()!="" && tipController.text.toString()!=""){
                    var billamt= int.parse(amtController.text.toString());
                    var tipprcnt=int.parse(tipController.text.toString());
                    var totaltip= billamt * (tipprcnt/100);
                    var totalamt=billamt + totaltip;
                    setState((){
                     amt= totalamt.toString();
                     tip= totaltip.toString();

                    });
                  }
                }, child: Text("Calculate Amount"),
              ),
              SizedBox(
                height: 10,
              ),
            Text("Your Tip Is: $tip",style: TextStyle(fontSize: 20),

            ),


              Text("Your TotalAmt Is: $amt",style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        )
    );
  }

  }

