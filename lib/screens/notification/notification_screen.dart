import 'package:flutter/material.dart';
import 'package:oo/apis/bloc/notification_bloc.dart';
import 'package:oo/apis/modelclass/notification_modelclass.dart';
import 'package:oo/apis/repositories/notification_repositories.dart';
import 'package:oo/constants/math_utils.dart';
import 'package:oo/constants/response.dart';

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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                            NotificationModelClass notificationlist =
                                snapshot.data!.data;
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  ListView.separated(
                                    separatorBuilder: (context, index) => SizedBox(
                                      height: 10,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: notificationlist.notifications!.length,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.14,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          elevation: 2,
                                          color: Colors.grey[300],
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 6,),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Text(
                                                    '${notificationlist.notifications![index].time}',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10,),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                 child: Text("${notificationlist.notifications![index].data!.name!} has invited you to the match on "
                                                     "${notificationlist.notifications![index].data!.date}",
                                                     style: TextStyle(
                                                           fontSize: 18,
                                                           fontWeight: FontWeight.bold,
                                                         ),
                                                 )
                                                ),
                                                // Text(
                                                //   "${notificationlist.notifications![index].data!.name!}",
                                                //   style: TextStyle(
                                                //     fontSize: 17,
                                                //     fontWeight: FontWeight.bold,
                                                //     letterSpacing: 2,
                                                //   ),
                                                // ),
                                                // SizedBox(
                                                //   height: 6,
                                                // ),
                                                // Text(
                                                //   '${notificationlist.notifications![index].data!.date}',
                                                //   style: TextStyle(
                                                //     fontSize: 17,
                                                //   ),
                                                // ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );

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
}
