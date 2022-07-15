import 'package:flutter/material.dart';
import 'package:oo/screens/waveclipper.dart';
import 'package:shimmer/shimmer.dart';


class LessonViewShimmer extends StatelessWidget {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
          children: <Widget>[

            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration: BoxDecoration(color: Colors.white70),
                height: 200,
              ),
            ),
            Shimmer.fromColors(
                baseColor: Colors.grey, // Colors.grey.shade300,
                highlightColor: Colors.grey, // Colors.grey.shade100,
                enabled: true,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    itemBuilder: (context, index) {

                      return  Card(
                        margin: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 2),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        shadowColor: Colors.grey,
                        child: ListTile(
                            title: Row(
                              children: [
                                Container(height: 20,width: 100,),
                                SizedBox(
                                  width: 260,
                                ),
                                Container(height: 20,width: 100,),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(height: 20,width: 100,),
                              ],
                            ),
                            subtitle:
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Row(children: [
                                Text(
                                  "Reason        : ",
                                  style: TextStyle(color: Colors.black, fontSize: 20),
                                ),
                                Container(height: 20,width: 100,),
                              ]),
                              Row(children: [
                                Container(height: 20,width: 100,),
                                Container(height: 20,width: 100,),
                              ]),
                              Row(children: [
                                Container(height: 20,width: 100,),
                                Container(height: 20,width: 100,),
                              ]),
                              Row(
                                children: [
                                  Container(height: 20,width: 100,),
                                  Container(height: 20,width: 100,),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Container(height: 20,width: 100,),
                                  Container(height: 20,width: 100,),
                                ],
                              ),
                            ]),
                            onTap: () {
                              // WidgetsBinding.instance!.addPostFrameCallback((_) {
                              //   Navigator.pushNamed(
                              //       context, RoutesName.PRESCRIPTION_LISt, arguments: DetailsDto);
                              // });
                            }),
                      );
                    })
            ),
          ],
        ));
  }

  Widget _buildLessonItem(BuildContext context, int index) {
    return Container(
      width: 130,

      color: Colors.white,
    );
  }
}
