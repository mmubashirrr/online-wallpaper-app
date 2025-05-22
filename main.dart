import 'package:flutter/material.dart';
import 'package:wallpaper/splashscreen.dart';
void main(){

  runApp(Main());

}
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen() ,
    ) ;
  }
}
