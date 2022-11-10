import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:oo/constants/colors.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  TextEditingController searchcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
            color: Colors.black,
            size: 23
        ),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text("FAQ",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400
          ),),
        ),
      ),body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
                  child: Theme(
                    data: Theme.of(context).copyWith(accentColor: ColorConstant.green6320),
                    child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 15,),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:4,
                      itemBuilder: (context,index) {
                        return ExpansionTileCard(
                          baseColor: Colors.grey[200],
                            elevation: 1,
                            shadowColor:ColorConstant.green6320 ,
                            leading: CircleAvatar(backgroundColor: ColorConstant.green6320,
                            child: Text('1',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                          title: Text('Question!',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          children: <Widget>[
                            Divider(
                              thickness: 1.5,
                              height: 1.0,
                            ),
                            SizedBox(height: 10,),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                                child: Text(
                                  """Hi there, I'm a drop-in replacement for Flutter's ExpansionTile.

Use me any time you think your app could benefit from being just a bit more Material.

These buttons control the next card down!""",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,)
                          ],
                        );
                      }
                    ),
                  ),
                ),



          ),
        ),
    );
  }
}