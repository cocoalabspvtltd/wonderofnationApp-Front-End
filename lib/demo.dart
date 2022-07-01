// import '../create_match_screen/widgets/create_match_item_widget.dart';
// import 'package:anjana_s_application3/core/app_export.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class CreateMatchScreen extends StatelessWidget {
//   List<String> dropdownItemList = ["test", "test1", "test2", "test3"];
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: ColorConstant.whiteA700,
//         body: Container(
//           decoration: BoxDecoration(
//             color: ColorConstant.whiteA700,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 width: size.width,
//                 margin: EdgeInsets.only(
//                   top: getVerticalSize(
//                     30.75,
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                     left: getHorizontalSize(
//                       24.00,
//                     ),
//                     right: getHorizontalSize(
//                       17.00,
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(
//                           top: getVerticalSize(
//                             5.25,
//                           ),
//                           bottom: getVerticalSize(
//                             4.50,
//                           ),
//                         ),
//                         child: Container(
//                           height: getVerticalSize(
//                             12.00,
//                           ),
//                           width: getHorizontalSize(
//                             16.00,
//                           ),
//                           child: SvgPicture.asset(
//                             ImageConstant.imgVector,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(
//                               top: getVerticalSize(
//                                 1.25,
//                               ),
//                               bottom: getVerticalSize(
//                                 1.79,
//                               ),
//                             ),
//                             child: Container(
//                               height: getSize(
//                                 18.71,
//                               ),
//                               width: getSize(
//                                 18.71,
//                               ),
//                               child: SvgPicture.asset(
//                                 ImageConstant.imgVector1,
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(
//                               left: getHorizontalSize(
//                                 16.54,
//                               ),
//                             ),
//                             child: Container(
//                               height: getVerticalSize(
//                                 21.75,
//                               ),
//                               width: getHorizontalSize(
//                                 19.50,
//                               ),
//                               child: SvgPicture.asset(
//                                 ImageConstant.imgVector2,
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(
//                               left: getHorizontalSize(
//                                 15.25,
//                               ),
//                               top: getVerticalSize(
//                                 2.25,
//                               ),
//                               bottom: getVerticalSize(
//                                 1.03,
//                               ),
//                             ),
//                             child: Container(
//                               height: getVerticalSize(
//                                 18.47,
//                               ),
//                               width: getHorizontalSize(
//                                 20.00,
//                               ),
//                               child: SvgPicture.asset(
//                                 ImageConstant.imgGroup,
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   padding: EdgeInsets.only(
//                     top: getVerticalSize(
//                       33.50,
//                     ),
//                     bottom: getVerticalSize(
//                       20.00,
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: getHorizontalSize(
//                           140.00,
//                         ),
//                         margin: EdgeInsets.only(
//                           left: getHorizontalSize(
//                             20.00,
//                           ),
//                           right: getHorizontalSize(
//                             20.00,
//                           ),
//                         ),
//                         child: RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: 'Create your \n',
//                                 style: TextStyle(
//                                   color: ColorConstant.indigo900,
//                                   fontSize: getFontSize(
//                                     24,
//                                   ),
//                                   fontFamily: 'Inter',
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: 'matches',
//                                 style: TextStyle(
//                                   color: ColorConstant.orange900,
//                                   fontSize: getFontSize(
//                                     24,
//                                   ),
//                                   fontFamily: 'Inter',
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           top: getVerticalSize(
//                             24.00,
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Container(
//                               height: getVerticalSize(
//                                 40.00,
//                               ),
//                               width: getHorizontalSize(
//                                 100.00,
//                               ),
//                               margin: EdgeInsets.only(
//                                 left: getHorizontalSize(
//                                   20.00,
//                                 ),
//                                 bottom: getVerticalSize(
//                                   1.00,
//                                 ),
//                               ),
//                               decoration: BoxDecoration(
//                                 color: ColorConstant.whiteA700,
//                                 borderRadius: BorderRadius.circular(
//                                   getHorizontalSize(
//                                     10.00,
//                                   ),
//                                 ),
//                                 border: Border.all(
//                                   color: ColorConstant.indigo900,
//                                   width: getHorizontalSize(
//                                     1.00,
//                                   ),
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                   left: getHorizontalSize(
//                                     24.00,
//                                   ),
//                                   top: getVerticalSize(
//                                     13.00,
//                                   ),
//                                   bottom: getVerticalSize(
//                                     12.00,
//                                   ),
//                                 ),
//                                 child: DropdownButtonHideUnderline(
//                                   child: DropdownButtonFormField(
//                                     focusNode: FocusNode(),
//                                     icon: Image.asset(
//                                       ImageConstant.imgVector3,
//                                       height: getSize(
//                                         4.17,
//                                       ),
//                                       width: getSize(
//                                         8.33,
//                                       ),
//                                       fit: BoxFit.fill,
//                                     ),
//                                     style: TextStyle(
//                                       color: ColorConstant.black900,
//                                       fontSize: getFontSize(
//                                         12,
//                                       ),
//                                       fontFamily: 'Inter',
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                     onChanged: (value) {},
//                                     items: dropdownItemList
//                                         .map<DropdownMenuItem<String>>(
//                                             (String value) {
//                                           return DropdownMenuItem<String>(
//                                             value: value,
//                                             child: Text(
//                                               value,
//                                               textAlign: TextAlign.left,
//                                             ),
//                                           );
//                                         }).toList(),
//                                     decoration: InputDecoration(
//                                       hintText: 'Tennis',
//                                       hintStyle: TextStyle(
//                                         fontSize: getFontSize(
//                                           12.0,
//                                         ),
//                                         color: ColorConstant.black900,
//                                       ),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(
//                                           getHorizontalSize(
//                                             10.00,
//                                           ),
//                                         ),
//                                         borderSide: BorderSide(
//                                           color: ColorConstant.indigo900,
//                                           width: 1,
//                                         ),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(
//                                           getHorizontalSize(
//                                             10.00,
//                                           ),
//                                         ),
//                                         borderSide: BorderSide(
//                                           color: ColorConstant.indigo900,
//                                           width: 1,
//                                         ),
//                                       ),
//                                       disabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(
//                                           getHorizontalSize(
//                                             10.00,
//                                           ),
//                                         ),
//                                         borderSide: BorderSide(
//                                           color: ColorConstant.indigo900,
//                                           width: 1,
//                                         ),
//                                       ),
//                                       filled: true,
//                                       fillColor: ColorConstant.whiteA700,
//                                       isDense: true,
//                                       contentPadding: EdgeInsets.all(0),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 left: getHorizontalSize(
//                                   10.00,
//                                 ),
//                                 bottom: getVerticalSize(
//                                   1.00,
//                                 ),
//                               ),
//                               child: Container(
//                                 height: getVerticalSize(
//                                   40.00,
//                                 ),
//                                 width: getHorizontalSize(
//                                   100.00,
//                                 ),
//                                 child: TextFormField(
//                                   focusNode: FocusNode(),
//                                   decoration: InputDecoration(
//                                     hintText: '11.07.22',
//                                     hintStyle: TextStyle(
//                                       fontSize: getFontSize(
//                                         12.0,
//                                       ),
//                                       color: ColorConstant.black900,
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(
//                                         getHorizontalSize(
//                                           10.00,
//                                         ),
//                                       ),
//                                       borderSide: BorderSide(
//                                         color: ColorConstant.indigo900,
//                                         width: 1,
//                                       ),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(
//                                         getHorizontalSize(
//                                           10.00,
//                                         ),
//                                       ),
//                                       borderSide: BorderSide(
//                                         color: ColorConstant.indigo900,
//                                         width: 1,
//                                       ),
//                                     ),
//                                     disabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(
//                                         getHorizontalSize(
//                                           10.00,
//                                         ),
//                                       ),
//                                       borderSide: BorderSide(
//                                         color: ColorConstant.indigo900,
//                                         width: 1,
//                                       ),
//                                     ),
//                                     prefixIcon: Container(
//                                       margin: EdgeInsets.only(
//                                         left: getHorizontalSize(
//                                           10.00,
//                                         ),
//                                         top: getVerticalSize(
//                                           13.00,
//                                         ),
//                                         right: getHorizontalSize(
//                                           9.00,
//                                         ),
//                                         bottom: getVerticalSize(
//                                           12.00,
//                                         ),
//                                       ),
//                                       child: Container(
//                                         height: getSize(
//                                           15.00,
//                                         ),
//                                         width: getSize(
//                                           15.00,
//                                         ),
//                                         child: SvgPicture.asset(
//                                           ImageConstant.imgVector4,
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                     prefixIconConstraints: BoxConstraints(
//                                       minWidth: getSize(
//                                         15.00,
//                                       ),
//                                       minHeight: getSize(
//                                         15.00,
//                                       ),
//                                     ),
//                                     filled: true,
//                                     fillColor: ColorConstant.whiteA700,
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.only(
//                                       top: getVerticalSize(
//                                         13.00,
//                                       ),
//                                       right: getHorizontalSize(
//                                         21.00,
//                                       ),
//                                       bottom: getVerticalSize(
//                                         12.00,
//                                       ),
//                                     ),
//                                   ),
//                                   style: TextStyle(
//                                     color: ColorConstant.black900,
//                                     fontSize: getFontSize(
//                                       12.0,
//                                     ),
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 left: getHorizontalSize(
//                                   10.00,
//                                 ),
//                                 top: getVerticalSize(
//                                   1.00,
//                                 ),
//                                 right: getHorizontalSize(
//                                   20.00,
//                                 ),
//                               ),
//                               child: Container(
//                                 height: getVerticalSize(
//                                   40.00,
//                                 ),
//                                 width: getHorizontalSize(
//                                   100.00,
//                                 ),
//                                 child: TextFormField(
//                                   focusNode: FocusNode(),
//                                   decoration: InputDecoration(
//                                     hintText: '10.00',
//                                     hintStyle: TextStyle(
//                                       fontSize: getFontSize(
//                                         12.0,
//                                       ),
//                                       color: ColorConstant.black900,
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(
//                                         getHorizontalSize(
//                                           10.00,
//                                         ),
//                                       ),
//                                       borderSide: BorderSide(
//                                         color: ColorConstant.indigo900,
//                                         width: 1,
//                                       ),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(
//                                         getHorizontalSize(
//                                           10.00,
//                                         ),
//                                       ),
//                                       borderSide: BorderSide(
//                                         color: ColorConstant.indigo900,
//                                         width: 1,
//                                       ),
//                                     ),
//                                     disabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(
//                                         getHorizontalSize(
//                                           10.00,
//                                         ),
//                                       ),
//                                       borderSide: BorderSide(
//                                         color: ColorConstant.indigo900,
//                                         width: 1,
//                                       ),
//                                     ),
//                                     prefixIcon: Container(
//                                       margin: EdgeInsets.only(
//                                         left: getHorizontalSize(
//                                           11.00,
//                                         ),
//                                         top: getVerticalSize(
//                                           10.00,
//                                         ),
//                                         right: getHorizontalSize(
//                                           10.00,
//                                         ),
//                                         bottom: getVerticalSize(
//                                           10.00,
//                                         ),
//                                       ),
//                                       child: Container(
//                                         height: getSize(
//                                           20.00,
//                                         ),
//                                         width: getSize(
//                                           20.00,
//                                         ),
//                                         child: SvgPicture.asset(
//                                           ImageConstant.imgBxtimefive,
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                     prefixIconConstraints: BoxConstraints(
//                                       minWidth: getSize(
//                                         20.00,
//                                       ),
//                                       minHeight: getSize(
//                                         20.00,
//                                       ),
//                                     ),
//                                     filled: true,
//                                     fillColor: ColorConstant.whiteA700,
//                                     isDense: true,
//                                     contentPadding: EdgeInsets.only(
//                                       top: getVerticalSize(
//                                         13.00,
//                                       ),
//                                       right: getHorizontalSize(
//                                         28.00,
//                                       ),
//                                       bottom: getVerticalSize(
//                                         12.00,
//                                       ),
//                                     ),
//                                   ),
//                                   style: TextStyle(
//                                     color: ColorConstant.black900,
//                                     fontSize: getFontSize(
//                                       12.0,
//                                     ),
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Padding(
//                           padding: EdgeInsets.only(
//                             left: getHorizontalSize(
//                               20.00,
//                             ),
//                             top: getVerticalSize(
//                               25.00,
//                             ),
//                             right: getHorizontalSize(
//                               20.00,
//                             ),
//                           ),
//                           child: Container(
//                             alignment: Alignment.center,
//                             height: getVerticalSize(
//                               46.00,
//                             ),
//                             width: size.width,
//                             decoration: BoxDecoration(
//                               color: ColorConstant.indigo900,
//                               borderRadius: BorderRadius.circular(
//                                 getHorizontalSize(
//                                   10.00,
//                                 ),
//                               ),
//                             ),
//                             child: Text(
//                               "Search",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                 color: ColorConstant.whiteA700,
//                                 fontSize: getFontSize(
//                                   14,
//                                 ),
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           left: getHorizontalSize(
//                             20.00,
//                           ),
//                           top: getVerticalSize(
//                             32.00,
//                           ),
//                           right: getHorizontalSize(
//                             20.00,
//                           ),
//                         ),
//                         child: Text(
//                           "Find Your Court",
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             color: ColorConstant.indigo900,
//                             fontSize: getFontSize(
//                               16,
//                             ),
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: getVerticalSize(
//                           721.00,
//                         ),
//                         width: size.width,
//                         margin: EdgeInsets.only(
//                           top: getVerticalSize(
//                             24.00,
//                           ),
//                         ),
//                         child: Stack(
//                           alignment: Alignment.topCenter,
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Container(
//                                 height: getVerticalSize(
//                                   121.00,
//                                 ),
//                                 width: getHorizontalSize(
//                                   150.00,
//                                 ),
//                                 margin: EdgeInsets.only(
//                                   left: getHorizontalSize(
//                                     20.00,
//                                   ),
//                                   right: getHorizontalSize(
//                                     20.00,
//                                   ),
//                                   bottom: getVerticalSize(
//                                     10.00,
//                                   ),
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: ColorConstant.gray600,
//                                   borderRadius: BorderRadius.circular(
//                                     getHorizontalSize(
//                                       10.00,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.topCenter,
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                   left: getHorizontalSize(
//                                     30.00,
//                                   ),
//                                   top: getVerticalSize(
//                                     134.00,
//                                   ),
//                                   right: getHorizontalSize(
//                                     30.00,
//                                   ),
//                                   bottom: getVerticalSize(
//                                     134.00,
//                                   ),
//                                 ),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment:
//                                       CrossAxisAlignment.center,
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Text(
//                                           "Tennis court",
//                                           overflow: TextOverflow.ellipsis,
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(
//                                             color: ColorConstant.indigo900,
//                                             fontSize: getFontSize(
//                                               14,
//                                             ),
//                                             fontFamily: 'Inter',
//                                             fontWeight: FontWeight.w400,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.only(
//                                             right: getHorizontalSize(
//                                               38.00,
//                                             ),
//                                           ),
//                                           child: Text(
//                                             "Football court",
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                               color: ColorConstant.indigo900,
//                                               fontSize: getFontSize(
//                                                 14,
//                                               ),
//                                               fontFamily: 'Inter',
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                         top: getVerticalSize(
//                                           7.00,
//                                         ),
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Text(
//                                             "28th june 2022",
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                               color: ColorConstant.gray601,
//                                               fontSize: getFontSize(
//                                                 10,
//                                               ),
//                                               fontFamily: 'Inter',
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                               right: getHorizontalSize(
//                                                 55.00,
//                                               ),
//                                             ),
//                                             child: Text(
//                                               "28th june 2022",
//                                               overflow: TextOverflow.ellipsis,
//                                               textAlign: TextAlign.left,
//                                               style: TextStyle(
//                                                 color: ColorConstant.gray601,
//                                                 fontSize: getFontSize(
//                                                   10,
//                                                 ),
//                                                 fontFamily: 'Inter',
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                         top: getVerticalSize(
//                                           10.00,
//                                         ),
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                               top: getVerticalSize(
//                                                 3.00,
//                                               ),
//                                               bottom: getVerticalSize(
//                                                 4.00,
//                                               ),
//                                             ),
//                                             child: Text(
//                                               "1 km away",
//                                               overflow: TextOverflow.ellipsis,
//                                               textAlign: TextAlign.left,
//                                               style: TextStyle(
//                                                 color: ColorConstant.gray600,
//                                                 fontSize: getFontSize(
//                                                   10,
//                                                 ),
//                                                 fontFamily: 'Inter',
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                           ),
//                                           Text(
//                                             "₹2000",
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                               color: ColorConstant.indigo900,
//                                               fontSize: getFontSize(
//                                                 16,
//                                               ),
//                                               fontFamily: 'Inter',
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                               top: getVerticalSize(
//                                                 3.00,
//                                               ),
//                                               bottom: getVerticalSize(
//                                                 4.00,
//                                               ),
//                                             ),
//                                             child: Text(
//                                               "1 km away",
//                                               overflow: TextOverflow.ellipsis,
//                                               textAlign: TextAlign.left,
//                                               style: TextStyle(
//                                                 color: ColorConstant.gray600,
//                                                 fontSize: getFontSize(
//                                                   10,
//                                                 ),
//                                                 fontFamily: 'Inter',
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                           ),
//                                           Text(
//                                             "₹2500",
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                               color: ColorConstant.indigo900,
//                                               fontSize: getFontSize(
//                                                 16,
//                                               ),
//                                               fontFamily: 'Inter',
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.topRight,
//                               child: Container(
//                                 height: getVerticalSize(
//                                   121.00,
//                                 ),
//                                 width: getHorizontalSize(
//                                   150.00,
//                                 ),
//                                 margin: EdgeInsets.only(
//                                   left: getHorizontalSize(
//                                     20.00,
//                                   ),
//                                   right: getHorizontalSize(
//                                     20.00,
//                                   ),
//                                   bottom: getVerticalSize(
//                                     10.00,
//                                   ),
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: ColorConstant.gray600,
//                                   borderRadius: BorderRadius.circular(
//                                     getHorizontalSize(
//                                       10.00,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 left: getHorizontalSize(
//                                   20.00,
//                                 ),
//                                 right: getHorizontalSize(
//                                   20.00,
//                                 ),
//                               ),
//                               child: StaggeredGridView.countBuilder(
//                                 shrinkWrap: true,
//                                 primary: false,
//                                 crossAxisCount: 4,
//                                 crossAxisSpacing: getHorizontalSize(
//                                   20.00,
//                                 ),
//                                 mainAxisSpacing: getHorizontalSize(
//                                   20.00,
//                                 ),
//                                 staggeredTileBuilder: (index) {
//                                   return StaggeredTile.fit(2);
//                                 },
//                                 itemCount: 8,
//                                 itemBuilder: (context, index) {
//                                   return CreateMatchItemWidget();
//                                 },
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.bottomCenter,
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                   left: getHorizontalSize(
//                                     30.00,
//                                   ),
//                                   top: getVerticalSize(
//                                     22.00,
//                                   ),
//                                   right: getHorizontalSize(
//                                     30.00,
//                                   ),
//                                   bottom: getVerticalSize(
//                                     22.00,
//                                   ),
//                                 ),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment:
//                                       CrossAxisAlignment.center,
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Text(
//                                           "Tennis court",
//                                           overflow: TextOverflow.ellipsis,
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(
//                                             color: ColorConstant.indigo900,
//                                             fontSize: getFontSize(
//                                               14,
//                                             ),
//                                             fontFamily: 'Inter',
//                                             fontWeight: FontWeight.w400,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.only(
//                                             right: getHorizontalSize(
//                                               38.00,
//                                             ),
//                                           ),
//                                           child: Text(
//                                             "Football court",
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                               color: ColorConstant.indigo900,
//                                               fontSize: getFontSize(
//                                                 14,
//                                               ),
//                                               fontFamily: 'Inter',
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                         top: getVerticalSize(
//                                           7.00,
//                                         ),
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Text(
//                                             "28th june 2022",
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                               color: ColorConstant.gray601,
//                                               fontSize: getFontSize(
//                                                 10,
//                                               ),
//                                               fontFamily: 'Inter',
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                               right: getHorizontalSize(
//                                                 55.00,
//                                               ),
//                                             ),
//                                             child: Text(
//                                               "28th june 2022",
//                                               overflow: TextOverflow.ellipsis,
//                                               textAlign: TextAlign.left,
//                                               style: TextStyle(
//                                                 color: ColorConstant.gray601,
//                                                 fontSize: getFontSize(
//                                                   10,
//                                                 ),
//                                                 fontFamily: 'Inter',
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                         top: getVerticalSize(
//                                           10.00,
//                                         ),
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                               top: getVerticalSize(
//                                                 3.00,
//                                               ),
//                                               bottom: getVerticalSize(
//                                                 4.00,
//                                               ),
//                                             ),
//                                             child: Text(
//                                               "1 km away",
//                                               overflow: TextOverflow.ellipsis,
//                                               textAlign: TextAlign.left,
//                                               style: TextStyle(
//                                                 color: ColorConstant.gray600,
//                                                 fontSize: getFontSize(
//                                                   10,
//                                                 ),
//                                                 fontFamily: 'Inter',
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                           ),
//                                           Text(
//                                             "₹2000",
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                               color: ColorConstant.indigo900,
//                                               fontSize: getFontSize(
//                                                 16,
//                                               ),
//                                               fontFamily: 'Inter',
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                               top: getVerticalSize(
//                                                 3.00,
//                                               ),
//                                               bottom: getVerticalSize(
//                                                 4.00,
//                                               ),
//                                             ),
//                                             child: Text(
//                                               "1 km away",
//                                               overflow: TextOverflow.ellipsis,
//                                               textAlign: TextAlign.left,
//                                               style: TextStyle(
//                                                 color: ColorConstant.gray600,
//                                                 fontSize: getFontSize(
//                                                   10,
//                                                 ),
//                                                 fontFamily: 'Inter',
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                           ),
//                                           Text(
//                                             "₹2500",
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                               color: ColorConstant.indigo900,
//                                               fontSize: getFontSize(
//                                                 16,
//                                               ),
//                                               fontFamily: 'Inter',
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Container(
//                                 height: getVerticalSize(
//                                   121.00,
//                                 ),
//                                 width: getHorizontalSize(
//                                   150.00,
//                                 ),
//                                 margin: EdgeInsets.only(
//                                   left: getHorizontalSize(
//                                     20.00,
//                                   ),
//                                   top: getVerticalSize(
//                                     250.00,
//                                   ),
//                                   right: getHorizontalSize(
//                                     20.00,
//                                   ),
//                                   bottom: getVerticalSize(
//                                     250.00,
//                                   ),
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: ColorConstant.gray600,
//                                   borderRadius: BorderRadius.circular(
//                                     getHorizontalSize(
//                                       10.00,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.bottomLeft,
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                   left: getHorizontalSize(
//                                     30.00,
//                                   ),
//                                   top: getVerticalSize(
//                                     298.00,
//                                   ),
//                                   right: getHorizontalSize(
//                                     30.00,
//                                   ),
//                                   bottom: getVerticalSize(
//                                     298.00,
//                                   ),
//                                 ),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Align(
//                                       alignment: Alignment.centerLeft,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Text(
//                                             "Tennis court",
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                               color: ColorConstant.indigo900,
//                                               fontSize: getFontSize(
//                                                 14,
//                                               ),
//                                               fontFamily: 'Inter',
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                           Text(
//                                             "Football court",
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                               color: ColorConstant.indigo900,
//                                               fontSize: getFontSize(
//                                                 14,
//                                               ),
//                                               fontFamily: 'Inter',
//                                               fontWeight: FontWeight.w400,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: Alignment.centerRight,
//                                       child: Padding(
//                                         padding: EdgeInsets.only(
//                                           left: getHorizontalSize(
//                                             29.00,
//                                           ),
//                                           top: getVerticalSize(
//                                             7.00,
//                                           ),
//                                           right: getHorizontalSize(
//                                             29.00,
//                                           ),
//                                         ),
//                                         child: Text(
//                                           "1 km away",
//                                           overflow: TextOverflow.ellipsis,
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(
//                                             color: ColorConstant.gray600,
//                                             fontSize: getFontSize(
//                                               12,
//                                             ),
//                                             fontFamily: 'Inter',
//                                             fontWeight: FontWeight.w400,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.bottomLeft,
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                   left: getHorizontalSize(
//                                     30.00,
//                                   ),
//                                   top: getVerticalSize(
//                                     276.00,
//                                   ),
//                                   right: getHorizontalSize(
//                                     30.00,
//                                   ),
//                                   bottom: getVerticalSize(
//                                     276.00,
//                                   ),
//                                 ),
//                                 child: Text(
//                                   "1 km away",
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     color: ColorConstant.gray600,
//                                     fontSize: getFontSize(
//                                       10,
//                                     ),
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.bottomLeft,
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                   left: getHorizontalSize(
//                                     108.00,
//                                   ),
//                                   top: getVerticalSize(
//                                     272.00,
//                                   ),
//                                   right: getHorizontalSize(
//                                     108.00,
//                                   ),
//                                   bottom: getVerticalSize(
//                                     272.00,
//                                   ),
//                                 ),
//                                 child: Text(
//                                   "₹2000",
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     color: ColorConstant.indigo900,
//                                     fontSize: getFontSize(
//                                       16,
//                                     ),
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.topRight,
//                               child: Container(
//                                 height: getVerticalSize(
//                                   121.00,
//                                 ),
//                                 width: getHorizontalSize(
//                                   150.00,
//                                 ),
//                                 margin: EdgeInsets.only(
//                                   left: getHorizontalSize(
//                                     20.00,
//                                   ),
//                                   top: getVerticalSize(
//                                     250.00,
//                                   ),
//                                   right: getHorizontalSize(
//                                     20.00,
//                                   ),
//                                   bottom: getVerticalSize(
//                                     250.00,
//                                   ),
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: ColorConstant.gray600,
//                                   borderRadius: BorderRadius.circular(
//                                     getHorizontalSize(
//                                       10.00,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.bottomRight,
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                   left: getHorizontalSize(
//                                     33.00,
//                                   ),
//                                   top: getVerticalSize(
//                                     272.00,
//                                   ),
//                                   right: getHorizontalSize(
//                                     33.00,
//                                   ),
//                                   bottom: getVerticalSize(
//                                     272.00,
//                                   ),
//                                 ),
//                                 child: Text(
//                                   "₹2500",
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     color: ColorConstant.indigo900,
//                                     fontSize: getFontSize(
//                                       16,
//                                     ),
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.bottomLeft,
//                               child: Container(
//                                 margin: EdgeInsets.only(
//                                   top: getVerticalSize(
//                                     276.00,
//                                   ),
//                                   bottom: getVerticalSize(
//                                     276.00,
//                                   ),
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: ColorConstant.whiteA700,
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(
//                                       getHorizontalSize(
//                                         30.00,
//                                       ),
//                                     ),
//                                     topRight: Radius.circular(
//                                       getHorizontalSize(
//                                         30.00,
//                                       ),
//                                     ),
//                                     bottomLeft: Radius.circular(
//                                       getHorizontalSize(
//                                         0.00,
//                                       ),
//                                     ),
//                                     bottomRight: Radius.circular(
//                                       getHorizontalSize(
//                                         0.00,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                         left: getHorizontalSize(
//                                           36.91,
//                                         ),
//                                         top: getVerticalSize(
//                                           15.91,
//                                         ),
//                                         bottom: getVerticalSize(
//                                           18.91,
//                                         ),
//                                       ),
//                                       child: Container(
//                                         height: getSize(
//                                           29.18,
//                                         ),
//                                         width: getSize(
//                                           29.18,
//                                         ),
//                                         child: SvgPicture.asset(
//                                           ImageConstant.imgVector5,
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                         left: getHorizontalSize(
//                                           58.29,
//                                         ),
//                                         top: getVerticalSize(
//                                           17.46,
//                                         ),
//                                         bottom: getVerticalSize(
//                                           17.37,
//                                         ),
//                                       ),
//                                       child: Container(
//                                         height: getVerticalSize(
//                                           29.17,
//                                         ),
//                                         width: getHorizontalSize(
//                                           26.25,
//                                         ),
//                                         child: SvgPicture.asset(
//                                           ImageConstant.imgVector6,
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                         left: getHorizontalSize(
//                                           55.37,
//                                         ),
//                                         top: getVerticalSize(
//                                           13.00,
//                                         ),
//                                         bottom: getVerticalSize(
//                                           16.00,
//                                         ),
//                                       ),
//                                       child: Container(
//                                         height: getSize(
//                                           35.00,
//                                         ),
//                                         width: getSize(
//                                           35.00,
//                                         ),
//                                         child: SvgPicture.asset(
//                                           ImageConstant.imgBxmessagesqua,
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                         left: getHorizontalSize(
//                                           51.00,
//                                         ),
//                                         top: getVerticalSize(
//                                           14.00,
//                                         ),
//                                         right: getHorizontalSize(
//                                           33.00,
//                                         ),
//                                         bottom: getVerticalSize(
//                                           15.00,
//                                         ),
//                                       ),
//                                       child: Container(
//                                         height: getSize(
//                                           35.00,
//                                         ),
//                                         width: getSize(
//                                           35.00,
//                                         ),
//                                         child: SvgPicture.asset(
//                                           ImageConstant.imgBxuserpin,
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Padding(
//                           padding: EdgeInsets.only(
//                             left: getHorizontalSize(
//                               20.00,
//                             ),
//                             top: getVerticalSize(
//                               32.00,
//                             ),
//                             right: getHorizontalSize(
//                               20.00,
//                             ),
//                           ),
//                           child: Text(
//                             "See all",
//                             overflow: TextOverflow.ellipsis,
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                               color: ColorConstant.orange900,
//                               fontSize: getFontSize(
//                                 16,
//                               ),
//                               fontFamily: 'Inter',
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }