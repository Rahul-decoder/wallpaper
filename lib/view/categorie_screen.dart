import 'dart:convert';
import 'package:decoder_wallpaperapp/models/photos_model.dart';
import 'package:decoder_wallpaperapp/widget/changethemebutton.dart';
import 'package:decoder_wallpaperapp/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategorieScreen extends StatefulWidget {
  final String categorie;

  CategorieScreen({this.categorie});

  @override
  _CategorieScreenState createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  List<PhotosModel> photos = [];

  getCategorieWallpaper() async {
    await http.get(
        "https://api.pexels.com/v1/search?query=${widget.categorie}&per_page=30&page=1",
        headers: {
          "Authorization":
              "563492ad6f917000010000018183b8668c5f49b68eb3b21afd74c0e9"
        }).then((value) {
      //print(value.body);

      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        //print(element);
        PhotosModel photosModel = new PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
        //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
      });

      setState(() {});
    });
  }

  @override
  void initState() {
    getCategorieWallpaper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 151, 146, 146),
        title: brandName(),
        elevation: 0.0,
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ChangeThemeButtonWidget())
        ],
      ),
      body: SingleChildScrollView(
        child: wallPaper(photos, context),
      ),
    );
  }
}
