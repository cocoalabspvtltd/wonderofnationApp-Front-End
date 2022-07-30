

import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../apis/repositories/clublistrepositories.dart';
import '../apis/repositories/registerRepositories.dart';
import '../constants/baseurls.dart';
import '../constants/mathUtils.dart';


class imageswips extends StatefulWidget {
  const imageswips({Key? key}) : super(key: key);

  @override
  _imageswipsState createState() => _imageswipsState();
}

class _imageswipsState extends State<imageswips> {
  List imglist = [];

  Future getallcourtImage() async {
    print("imgurl->>>.${baseurl}clubs/our/courts?club_id=${1}");

    http.Response response = await http.get(Uri.parse('${baseurl}clubs/our/courts?club_id=${1}'), headers: <String, String>{
      'Accept': "appilication/json",
      'Authorization': 'Bearer $TOKEN',
    },);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        imglist = jsonData;
        print("Imagelist->${imglist}");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getallcourtImage();
  }

  var dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Container(


      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Container(
            width: size.width,
            height: 160,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                print("ImagelistImagelistImagelist-->>>>>>${imglist.length}");
                return CachedNetworkImage(

                  fit: BoxFit.fitWidth, imageUrl: imglist[index]["img"],
                );},
              autoplay: true,
              itemCount: imglist.length,

              pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white30,
                    activeColor: Colors.white,
                    size: 7,
                  )
              ),
            ),
          ),
        ),

        ],
      ),

    );
  }
}