import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class MUBASHAR extends StatefulWidget {
final dynamic  selectedImageLink;

  const MUBASHAR({super.key,required this.selectedImageLink});

  @override
  State<MUBASHAR> createState() => _MUBASHARState();
}

class _MUBASHARState extends State<MUBASHAR> {
  void setWallpaper() async {
    int location = WallpaperManager.BOTH_SCREEN;

      var file = await DefaultCacheManager().getSingleFile(widget.selectedImageLink);


    final bool result = await WallpaperManager.setWallpaperFromFile(file.path, location);
    SnackBar(
      content: Text(result
          ? 'Wallpaper set successfully!'
          : 'Failed to set wallpaper.'),
    );

  }
  void sethome() async {
    int location = WallpaperManager.HOME_SCREEN;

    var file = await DefaultCacheManager().getSingleFile(widget.selectedImageLink);


    final bool result = await WallpaperManager.setWallpaperFromFile(file.path, location);
    SnackBar(
      content: Text(result
          ? 'Wallpaper set successfully!'
          : 'Failed to set wallpaper.'),
    );

  }
  void setlock() async {
    int location = WallpaperManager.LOCK_SCREEN;

    var file = await DefaultCacheManager().getSingleFile(widget.selectedImageLink);


    final bool result = await WallpaperManager.setWallpaperFromFile(file.path, location);
    SnackBar(
      content: Text(result
          ? 'Wallpaper set successfully!'
          : 'Failed to set wallpaper.'),
    );

  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange.shade800,
          title: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(

                children: [
                  Text('MUBASHAR',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,),)
                 , Text('2022-ag-8607',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,)),
                ],
              ),
            ),
          ),
        ),




        backgroundColor: Colors.yellowAccent.shade700,

        body: Column(

            children: [
        Expanded(child: InteractiveViewer(child: Image.network(widget.selectedImageLink,fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingImage) {
            if (loadingImage == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,

                ),
              );
            }
          },))),

        Padding(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
          onTap:(){ setWallpaper();},child: Container(decoration: BoxDecoration(color: Colors.yellow.shade800,
              borderRadius: BorderRadius.all(Radius.circular(30))
          ),
                height: 50,width: double.infinity,
                child: Text('SET WALLPAPER',style: TextStyle(color: Colors.black87,fontSize: 30,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
              ),
              ),
        ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap:(){ sethome();},child: Container(decoration: BoxDecoration(color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),height: 50,width: double.infinity,
                  child: Text('SET HOME SCREEN',style: TextStyle(color: Colors.black87,fontSize: 30,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap:(){ setlock();},child: Container(decoration: BoxDecoration(color: Colors.greenAccent.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                )
                  ,height: 50,width: double.infinity,
                  child: Text('SET ON LOCK SCREEN',style: TextStyle(color: Colors.black87,fontSize: 30,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                ),
                ),
              )

            ]


        ),
      ),
    );
  }
}
