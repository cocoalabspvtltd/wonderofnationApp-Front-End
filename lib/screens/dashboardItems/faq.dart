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
  int number=0;
  List questions=["How to manage your profile ?","How to apply in Wonder of Nation Academy ?","How to book a club in specific location ?",
  "What does the colours  shown in time slot indicate ? "];
  List answers=["You can open your profile page and edit your details and save it",
    "Clicked on 'Book Your Seat Now' in home page.Then fill the details in application form and submitted for apply to wonder of nation academy ",
    "Open 'create match' screen.Then you can select a specific location and sport for filtering a clubs based on  elected location and sport",
  "Mainly three colours are shown in time slot.\n Green - Available slots \n Blue -The court is put on hold till a certain time \n Red - Unavailable slots"
      ];
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
                        itemCount:questions.length,
                      itemBuilder: (context,index) {
                        return ExpansionTileCard(
                          baseColor: Colors.grey[200],
                            elevation: 1,
                            shadowColor:ColorConstant.green6320 ,
                            leading: CircleAvatar(backgroundColor: ColorConstant.green6320,
                            child: Text("j",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                          title: Text(questions[index],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
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
                                  answers[index],
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