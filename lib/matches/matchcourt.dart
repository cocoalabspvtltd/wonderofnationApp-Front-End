// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:oo/matches/reservationcourt.dart';
// import '../apis/repositories/clublistrepositories.dart';
// import '../constants/colors.dart';
// import '../constants/mathUtils.dart';
// import 'package:card_swiper/card_swiper.dart';
//
// class Matchcourt extends StatefulWidget {
//   const Matchcourt({Key? key, required this.Imageurl, required this.clubName, required this.stateName, required this.cityName, required this.description}) : super(key: key);
// final String Imageurl;
// final String clubName;
// final String stateName;
// final String cityName;
// final String description;
//   @override
//   State<Matchcourt> createState() => _MatchcourtState();
// }
//
// class _MatchcourtState extends State<Matchcourt> {
//   List court = ["Court 1", "Court 2", "Court 3"];
//   int selectedIndex2 = 0;
//   List gallery=[
//     "assets/images/court.png",
//     "assets/images/past.png",
//     "assets/images/spash5.jpg",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         toolbarHeight: 27.9,
//         backgroundColor: ColorConstant.gray400,
//         iconTheme: IconThemeData(
//           color: Colors.black, //change your color here
//         ),
//       ),
//       backgroundColor: ColorConstant.gray400,
//       body: SafeArea(
//         child: Container(
//           width: size.width,
//           child:
//           Container(
//             height: size.height,
//             width: size.width,
//             decoration: BoxDecoration(
//               color: ColorConstant.gray200,
//             ),
//             child: Stack(
//               alignment: Alignment.bottomLeft,
//               children: [
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Container(
//                     height: getVerticalSize(
//                       400.00,
//                     ),
//                     width: size.width,
//                     margin: EdgeInsets.only(
//                       bottom: getVerticalSize(
//                         10.00,
//                       ),
//                     ),
//                     child: Stack(
//                       alignment: Alignment.topLeft,
//                       children: [
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: CachedNetworkImage(
//                             imageUrl: widget.Imageurl,
//                             placeholder: (context, url) => CircularProgressIndicator(),
//                             errorWidget: (context, url, error) => Image.asset("assets/images/football.jpg",fit: BoxFit.fill,),
//
//                             width: getHorizontalSize(
//                               360.00,
//                             ),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Container(
//                     margin: EdgeInsets.only(
//                       top: getVerticalSize(
//                         0.00,
//                       ),
//                     ),
//                     decoration: BoxDecoration(
//                       color: ColorConstant.whiteA700,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(
//                           getHorizontalSize(
//                             20.00,
//                           ),
//                         ),
//                         topRight: Radius.circular(
//                           getHorizontalSize(
//                             40.00,
//                           ),
//                         ),
//                         bottomLeft: Radius.circular(
//                           getHorizontalSize(
//                             0.00,
//                           ),
//                         ),
//                         bottomRight: Radius.circular(
//                           getHorizontalSize(
//                             0.00,
//                           ),
//                         ),
//                       ),
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(
//                             top: getVerticalSize(
//                               20.00,
//                             ),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Container(
//                                 width: getHorizontalSize(
//                                   140.00,
//                                 ),
//                                 margin: EdgeInsets.only(
//                                   left: getHorizontalSize(
//                                     30.00,
//                                   ),
//                                 ),
//                                 child: Text(
//                                   "${widget.clubName.toUpperCase()}",
//                                   maxLines: null,
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     color: ColorConstant.black900,
//                                     fontSize: getFontSize(
//                                       27,
//                                     ),
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   top: getVerticalSize(
//                                     15.00,
//                                   ),
//                                   right: getHorizontalSize(
//                                     30.00,
//                                   ),
//                                   bottom: getVerticalSize(
//                                     4.00,
//                                   ),
//                                 ),
//                                 child: Text(
//                                   "₹2500 ",
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     color: ColorConstant.orange900,
//                                     fontSize: getFontSize(
//                                       28,
//                                     ),
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             top: getVerticalSize(
//                               30.00,
//                             ),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   left: getHorizontalSize(
//                                     33.33,
//                                   ),
//                                   top: getVerticalSize(
//                                     1.67,
//                                   ),
//                                   bottom: getVerticalSize(
//                                     11.66,
//                                   ),
//                                 ),
//                                 child: Container(
//                                   height: getVerticalSize(
//                                     25.67,
//                                   ),
//                                   width: getHorizontalSize(
//                                     22.33,
//                                   ),
//                                   child: Image.asset(
//                                     "assets/images/location.png",
//                                     fit: BoxFit.fill,color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   left: getHorizontalSize(
//                                     14.34,
//                                   ),
//                                   right: getHorizontalSize(
//                                     30.00,
//                                   ),
//                                 ),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "${widget.stateName}/ ${widget.cityName}",
//                                       overflow: TextOverflow.ellipsis,
//                                       textAlign: TextAlign.left,
//                                       style: TextStyle(
//                                         color: ColorConstant.black900,
//                                         fontSize: getFontSize(23,),
//                                         fontFamily: 'Inter',
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                         top: getVerticalSize(
//                                           2.00,
//                                         ),
//                                         right: getHorizontalSize(
//                                           10.00,
//                                         ),
//                                       ),
//                                       child: Text(
//                                         "3.5 km away",
//                                         overflow: TextOverflow.ellipsis,
//                                         textAlign: TextAlign.left,
//                                         style: TextStyle(
//                                           color: ColorConstant.black900,
//                                           fontSize: getFontSize(
//                                             15,
//                                           ),
//                                           fontFamily: 'Inter',
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: getHorizontalSize(
//                               30.00,
//                             ),
//                             top: getVerticalSize(
//                               22.00,
//                             ),
//                             right: getHorizontalSize(
//                               30.00,
//                             ),
//                           ),
//                           child: Text(
//                             "Description",
//                             overflow: TextOverflow.ellipsis,
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                               color: ColorConstant.orange900,
//                               fontSize: getFontSize(
//                                 17,
//                               ),
//                               fontFamily: 'Inter',
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.center,
//                           child: Container(
//                             width: getHorizontalSize(
//                               300.00,
//                             ),
//                             margin: EdgeInsets.only(
//                               left: getHorizontalSize(
//                                 30.00,
//                               ),
//                               top: getVerticalSize(
//                                 7.00,
//                               ),
//                               right: getHorizontalSize(
//                                 30.00,
//                               ),
//                             ),
//                             child: Text(
//                               "${widget.description}",
//                               maxLines: null,
//                               textAlign: TextAlign.justify,
//                               style: TextStyle(
//                                 color: ColorConstant.black900,
//                                 fontSize: getFontSize(
//                                   13,
//                                 ),
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         SizedBox(height: 15,),
//                         Padding(
//                           padding: EdgeInsets.only(left: 27),
//                           child: Text(
//                             "Our Courts",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: getFontSize(
//                                 16,
//                               ),
//                               fontFamily: 'Inter',
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 15,),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10,right: 10),
//                           child: Container(
//                             width: size.width,
//                             height: 160,
//                             child: Swiper(
//                               itemBuilder: (BuildContext context, int index) {
//                                 return Image.asset(
//                                   gallery[index],
//                                   fit: BoxFit.fitWidth,
//                                 );},
//                               autoplay: true,
//                               itemCount: gallery.length,
//                               pagination: SwiperPagination(
//                                   builder: DotSwiperPaginationBuilder(
//                                     color: Colors.white30,
//                                     activeColor: Colors.white,
//                                     size: 7,
//                                   )
//                               ),
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.center,
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                               left: getHorizontalSize(
//                                 30.00,
//                               ),
//                               top: getVerticalSize(
//                                 40.00,
//                               ),
//                               right: getHorizontalSize(
//                                 30.00,
//                               ),
//                               bottom: getVerticalSize(
//                                 20.00,
//                               ),
//                             ),
//                             child: GestureDetector(onTap: (){
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>Reservationcourt()));
//                             },
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 height: getVerticalSize(
//                                   45.00,
//                                 ),
//                                 width: getHorizontalSize(
//                                   300.00,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: ColorConstant.orange900,
//                                   borderRadius: BorderRadius.circular(
//                                     getHorizontalSize(
//                                       10.00,
//                                     ),
//                                   ),
//                                 ),
//                                 child: Text(
//                                   "Reserve Court",
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     color: ColorConstant.whiteA700,
//                                     fontSize: getFontSize(
//                                       14,
//                                     ),
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 15,),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//         ),
//       ),
//     );
//   }
// }