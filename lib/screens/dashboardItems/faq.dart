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
  List numbering =  List.generate(10, (number) => (number + 2).toString());
  // final List<String> numbering = List<String>.generate(500, (number) => '$number');
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
        centerTitle: true,
        title: Text("FAQ",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400
        ),),
      ),body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                      _howtobook(),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                      Theme(
                        data: Theme.of(context).copyWith(hintColor: ColorConstant.green6320),
                        child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 15,),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:questions.length,
                          itemBuilder: (context,index) {
                            return ExpansionTileCard(
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              shadowColor:ColorConstant.green6320 ,
                              elevation: 8,
                              borderRadius: BorderRadius.circular(15),
                              baseColor: Colors.grey[300],
                                leading: CircleAvatar(backgroundColor: ColorConstant.green6320,
                                child: Text(numbering[index],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)),
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
                    ],
                  ),
                ),



          ),
        ),
    );
  }
  _howtobook() {
    return Theme(
      data: Theme.of(context).copyWith(hintColor: ColorConstant.green6320),
      child: ExpansionTileCard(
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        shadowColor:ColorConstant.green6320 ,
        elevation: 8,
        borderRadius: BorderRadius.circular(15),
        baseColor: Colors.grey[300],
        leading: CircleAvatar(backgroundColor: ColorConstant.green6320,
            child: Text('1',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)),
        title: Text(
          "How to book a court ?",
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Divider(
            thickness: 1.5,
            height: 1.0,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            alignment: FractionalOffset.centerLeft,
            child: Text(
              " -> The follow given below steps for  book the court",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.5,
                  height: 1.8,
                  color: ColorConstant.black901),
            ),
          ),
          _buildInfo("Step 1  :", "Sign up or login if not"),
          _buildInfo("Step 2  :", "Open Create match screen"),
          _buildInfo("Step 3  :", "Choose a club"),
          _buildInfo("Step 4  :", "Click Reserve Court"),
          _buildInfo("Step 5  :", "Choose or select a court ,time slot and add players"),
          _buildInfo("Step 6  :", "Click Book Now for payment "),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  _buildInfo(String title, String subTitle) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: ListTile(
        leading: Text(
          title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800, color: Colors.black),
        ),
        title: Text(subTitle,style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w600,),),
      ),
    );
  }
}