import 'package:flutter/material.dart';

class Help_page extends StatefulWidget {
  const Help_page({Key? key}) : super(key: key);

  @override
  State<Help_page> createState() => _Help_pageState();
}

class _Help_pageState extends State<Help_page> {
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
          padding: const EdgeInsets.only(left: 70),
          child: Text("Help Center",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400
          ),),
        ),
      ),body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: searchcontroller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding:  EdgeInsets.symmetric(vertical: 0.1, horizontal: 3.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(
                        color:Colors.grey,
                      ),
                    ),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search,color: Colors.grey,),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right:140,top: 10 ),
                child: Text("Commonly searched FAQ",style: TextStyle(fontSize: 16 ,fontWeight:FontWeight.w400,fontFamily: 'Inter',
                  color: Colors.black,)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40,right: 26),
                child: Text('How to manage your account in WON App ?',style: TextStyle(fontSize: 15 ,fontWeight:FontWeight.w400,fontFamily: 'Inter',
                  color: Colors.black,)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Divider(
                  thickness: 0.3,
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25,right: 70),
                child: Text('How reservation works in WON App ?',style: TextStyle(fontSize: 15 ,fontWeight:FontWeight.w400,fontFamily: 'Inter',
                  color: Colors.black,)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Divider(
                  thickness: 0.3,
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25,right: 43),
                child: Text('How to book a court in specific location ?',style: TextStyle(fontSize: 15 ,fontWeight:FontWeight.w400,fontFamily: 'Inter',
                  color: Colors.black,)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Divider(
                  thickness: 0.3,
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25,right: 132),
                child: Text('How to delete my account ?',style: TextStyle(fontSize: 15 ,fontWeight:FontWeight.w400,fontFamily: 'Inter',
                  color: Colors.black,)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Divider(
                  thickness: 0.3,
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25,right: 90),
                child: Text('How to change my personal info ?',style: TextStyle(fontSize: 15 ,fontWeight:FontWeight.w400,fontFamily: 'Inter',
                  color: Colors.black,)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Divider(
                  thickness: 0.3,
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25,right: 75),
                child: Text('How to register a credit/ debit card ?',style: TextStyle(fontSize: 15 ,fontWeight:FontWeight.w400,fontFamily: 'Inter',
                  color: Colors.black,)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Divider(
                  thickness: 0.3,
                  color: Colors.grey[300],
                ),
              ),

            ]
        ),
      ),
    ),
    );
  }
}