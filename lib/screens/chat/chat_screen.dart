


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../homePage/navigator.dart';
import 'chat_user_model.dart';
import 'conversation_list.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", imageURL: "assets/images/user1.png", time: "Now", ),
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "Glady's Murphy", messageText: "That's Great", imageURL: "images/userImage2.jpeg", time: "Yesterday"),
    ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", imageURL: "images/userImage3.jpeg", time: "31 Mar"),
    ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageURL: "images/userImage4.jpeg", time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageURL: "images/userImage5.jpeg", time: "23 Mar"),
    ChatUsers(name: "Jacob Pena", messageText: "will update you in evening", imageURL: "images/userImage6.jpeg", time: "17 Mar"),
    ChatUsers(name: "Andrey Jones", messageText: "Can you please share the file?", imageURL: "images/userImage7.jpeg", time: "24 Feb"),
    ChatUsers(name: "John Wick", messageText: "How are you?", imageURL: "images/userImage8.jpeg", time: "18 Feb"),
  ];
  @override
  Widget build(BuildContext context) {
 return Scaffold( appBar: AppBar(
   backgroundColor: Colors.white,
   elevation: 0,
   title: Padding(
     padding: const EdgeInsets.only(left: 68.0),
     child: Text(
       "Chats",
       style: TextStyle(fontSize: 18, color: Colors.black),
     ),
   ),
   leading: GestureDetector(onTap: (){
     Navigator.push(
       context,
       MaterialPageRoute(builder: (context) =>  DashBoard(UserName1: '',)),
     );
   },
       child: Icon(
         Icons.arrow_back_outlined,
         color: Colors.black,
       )),
 ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(onTap: (){

              },
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3)?true:false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

