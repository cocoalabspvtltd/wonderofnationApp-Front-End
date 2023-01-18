import 'package:flutter/material.dart';
import 'package:oo/constants/colors.dart';
import 'package:oo/elements/LoadMoreListener.dart';

class FollowScreen extends StatefulWidget {
  FollowScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FollowScreen> createState() => _FollowScreenState();
}

class _FollowScreenState extends State<FollowScreen>
    with LoadMoreListener, SingleTickerProviderStateMixin {
  @override
  refresh(bool isLoading) {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("All Followers",
                          style: TextStyle(fontWeight: FontWeight.w500))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                            height: 8,
                          ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Card(
                            elevation: 0,
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                    "assets/images/user2.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Text(
                                  "User Name",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black45),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),))),
                                    onPressed: () {},
                                    child: Text(
                                      "Remove",
                                      style: TextStyle(
                                          color: ColorConstant.whiteA700),
                                    )),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.0,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Suggested for you",
                          style: TextStyle(fontWeight: FontWeight.w500))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                            height: 8,
                          ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Card(
                            elevation: 0,
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                    "assets/images/user2.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Text(
                                  "User Name",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              ColorConstant.green6320),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Follow",
                                      style: TextStyle(
                                          color: ColorConstant.whiteA700),
                                    )),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.0,
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
