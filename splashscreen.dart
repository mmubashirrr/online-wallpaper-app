
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wallpaper/home.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
//2022-AG-8607
//MUHAMMAD MUBASHAR
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
//2022-AG-8607
//MUHAMMAD MUBASHAR
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder:  (BuildContext context)=> Home()),
      );
    });
  }//2022-AG-8607
//MUHAMMAD MUBASHAR
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,//it removes debug banner from screen corner
        title: 'wallpaper APP',
        home:Scaffold(
          backgroundColor: Colors.yellowAccent.shade700,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 120,
                    backgroundImage: AssetImage('images/appstore.png'),
                  ),
                  SizedBox(height: 20,),
                  Text('2022-AG-8607',style: TextStyle(color: Colors.black87,fontSize: 30,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                  SizedBox(height: 10,),
                  Text('MUHAMMAD MUBASHAR',style: TextStyle(color: Colors.black87,fontSize: 30,fontWeight: FontWeight.bold,),textAlign: TextAlign.center, ),
                  SizedBox(height: 30,),
                  LinearProgressIndicator(
                    minHeight: 10,
                    color: Colors.black87,
                    backgroundColor: Colors.yellowAccent.shade700, // Background color
                  )
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }//2022-AG-8607
//MUHAMMAD MUBASHAR
}
