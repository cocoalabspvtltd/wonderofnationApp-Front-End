import 'package:flutter/material.dart';
import 'package:oo/apis/bloc/notification_bloc.dart';
import 'package:oo/apis/modelclass/notification_modelclass.dart';
import 'package:oo/apis/repositories/notification_repositories.dart';
import 'package:oo/constants/colors.dart';
import 'package:oo/constants/math_utils.dart';
import 'package:oo/constants/response.dart';
import 'package:oo/screens/homePage/navigator.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationBloc _bloc;
  List<dynamic> notificationdata = [];
  NotificationRepository notifi_api= NotificationRepository();
  void initState() {
    super.initState();
    _bloc =NotificationBloc();
    notifi_api.markRead();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.indigo,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            "Notifications",
            style: TextStyle(
              color: Colors.black,
              fontSize: getFontSize(
                22,
              ),
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                StreamBuilder<Response<NotificationModelClass>>(
                    stream: _bloc.notificationstream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print("sdfghjk");
                        switch (snapshot.data!.status) {
                          case Status.LOADING:
                            return Container(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                            break;
                          case Status.SUCCESS:
                            NotificationModelClass notificationlist = snapshot.data!.data;
                            return inviteview(notificationlist);
                            break;
                          case Status.ERROR:
                            return Container();
                        }
                      }
                      return Container();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
  ListView inviteview(notificationlist){
    return ListView.separated(
      separatorBuilder: (context, index) =>
          SizedBox(
            height: 10,
          ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: notificationlist.notifications!.length,
      itemBuilder: (context, index) {
        if(notificationlist.notifications![index].data!.type == "match_invite") {
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.14,
            child: InkWell(
              onTap: (){
                _showDialog(notificationlist.notifications![index].data!.matchId);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: ColorConstant.green6320,
                elevation: 2,
                color: Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          '${notificationlist.notifications![index].time}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[400],
                              child: Icon(Icons.notifications,color: Colors.blue[800],)
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("${notificationlist.notifications![index]
                                  .data!.name!} has invited you to the match on \n"
                                  "${notificationlist.notifications![index].data!
                                  .date}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        else if(notificationlist.notifications![index].data!.type == "win_status")
          {
            return  SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.15,
              child: InkWell(
                onTap: (){
                  // print(notificationlist.notifications![index].data!.status_id);
                  // print(notificationlist.notifications![index].data!.match_id);
                  _showDialogmatch(notificationlist.notifications![index].data!.statusId,notificationlist.notifications![index].data!.matchId);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadowColor: ColorConstant.green6320,
                  elevation: 2,
                  color: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${notificationlist.notifications![index].time}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                        Row(
                          children: [
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey[400],
                                child: Icon(Icons.notifications,color: Colors.blue[800],)
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text("  Player ${notificationlist.notifications![index].data!.name} updated the status of\n match as ${notificationlist.notifications![index].data!.winStatus==0?"Lost":"Win"} ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        else{
          return  SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.15,
            child: InkWell(
              onTap: (){
                // _showDialog();
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: ColorConstant.green6320,
                elevation: 2,
                color: Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          '${notificationlist.notifications![index].time}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[400],
                              child: Icon(Icons.notifications,color: Colors.blue[800],)
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("Your invitation ${notificationlist.notifications![index].data!.status}\n by ${notificationlist.notifications![index].data!.name}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    ) ;
  }
  void _showDialog(int notificationId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(15.0)
              ),
          ),
          content: Text("Are you interested to join us",style: TextStyle(fontSize: 22),),
          actions:[
             SizedBox(
               width: 80,
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   primary: ColorConstant.green6320
                 ),
                child:  Text("Accept",style: TextStyle(color: Colors.white),),
                onPressed: () {
                   notifi_api.acceptInvitation(notificationId,"accepted");
                   inviationaccept();
                   Navigator.pop(context);
                },
            ),
             ),
            SizedBox(
              width: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red
                ),
                child:  Text("Reject",style: TextStyle(color: Colors.white),),
                onPressed: () {
                  notifi_api.acceptInvitation(notificationId,"rejected");
                  inviationreject();
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        );
      },
    );
  }
  void inviationaccept() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.2,
            color: Colors.white,
            child: const Image(
              image: AssetImage('assets/images/invitation_accept.gif'),
            ),
          ),
        );
      },
    );
  }
  void inviationreject() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.2,
            color: Colors.white,
            child: const Image(
              image: AssetImage('assets/images/invitation_reject.gif'),
            ),
          ),
        );
      },
    );
  }

  void _showDialogmatch(int statusid,int match_id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(15.0)
            ),
          ),
          content: Text("Are you confirm this status ",style: TextStyle(fontSize: 22),),
          actions:[
            SizedBox(
              width: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: ColorConstant.green6320
                ),
                child:  Text("Agree",style: TextStyle(color: Colors.white),),
                onPressed: ()async {
                  print(statusid);
                  print(match_id);
                   await   notifi_api.statusAcceptInvitation(statusid,match_id, 1);

                },
              ),
            ),
            SizedBox(
              width: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red
                ),
                child:  Text("Disagree",style: TextStyle(color: Colors.white),),
                onPressed: ()async {
                  print(statusid);
                  print(match_id);
                  await   notifi_api.statusAcceptInvitation(statusid,match_id, 0);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
