import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper/wallaper.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page=1;

  List imageslink=[];
  @override

  void initState(){

    connectionAPI();
    super.initState();
  }
  get selectedImageLink => null;
  void  connectionAPI()async{
    await http.get(Uri.parse('https://api.pexels.com/v1/curated/?per_page=80'),
        headers: {'Authorization' : '7i9WRbMVspPi4YxNJBsrXypWimkZexfx2fw06Z6S0ejwcaIO37i7vZvz'}
    ).then((value){

      Map   result = jsonDecode(value.body);
      setState(() {
        imageslink.addAll(result['photos']);

      });
    });
  }

  void  moreLoading()async{
    page++;
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?page=$page&per_page=80'),
        headers: {'Authorization' : '7i9WRbMVspPi4YxNJBsrXypWimkZexfx2fw06Z6S0ejwcaIO37i7vZvz'}
    ).then((value){

      Map   result = jsonDecode(value.body);
      setState(() {
        imageslink.addAll(result['photos']);

      });
    });
  }


@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'wallpaper APP',
        home: Scaffold(backgroundColor: Colors.yellowAccent.shade700,

          body: Column(
            children: [

              Expanded(child:GridView.builder(
          itemCount: imageslink.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5
              ),
              itemBuilder: (context,index){
                return InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MUBASHAR(
                        selectedImageLink:imageslink[index]['src']['large2x']) ));

                  },
                  child: Container(
                    color: Colors.white,
                    child: Image(
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingImage){
                          if (loadingImage==null){
                            return child;
                          }
                          else{
                            return Center(child: CircularProgressIndicator(color: Colors.black,));
                          }
                        },

                        image: NetworkImage(
                            imageslink[index]['src']['tiny']
                        )),
                  ),
                );
              }),
        )


              ,Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap:(){moreLoading();},child: Container(decoration: BoxDecoration(color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),height: 50,width: double.infinity,
                  child: Text('TAP FOR MORE',style: TextStyle(color: Colors.black87,fontSize: 30,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                ),
                ),
              )




            ],
          ),



        ),
      ),
    );
  }
}
