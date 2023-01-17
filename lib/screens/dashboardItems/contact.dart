import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String number="+917560911122";
  String mail="info@wonderofnation.com";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
            color: Colors.black,
            size: 23
        ),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text("Contact Us",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400
          ),),
        ),
      ),body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * .05),
              _buildCompanyEmailDetails(),
              SizedBox(
                  height: MediaQuery.of(context).size.height * .02),
              _buildCompanyPhoneDetails(),
              SizedBox(
                  height: MediaQuery.of(context).size.height * .02),
              _buildCompanyAddressDetails(),
              SizedBox(
                  height: MediaQuery.of(context).size.height * .02),
            ]
        ),
      ),
    ),
    );
  }

  _buildCompanyEmailDetails() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        alignment: FractionalOffset.center,
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.mail_outline,color: Colors.black,size: 30,),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      alignment: FractionalOffset.centerLeft,
                      child: InkWell(
                        onTap: ()=> launch("mailto:$mail"),
                        child: Text(mail,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize:18.0),
                        ),
                      ),
                    ),
                    flex: 1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildCompanyPhoneDetails() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        alignment: FractionalOffset.center,
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.call,color: Colors.black,size: 30,),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      alignment: FractionalOffset.centerLeft,
                      child: InkWell(
                        onTap: ()=>launch("tel: $number"),
                        child: Text(
                          number,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0),
                        ),
                      ),
                    ),
                    flex: 1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildCompanyAddressDetails() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.16,
        alignment: FractionalOffset.center,
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.location_on_outlined,color: Colors.black,size: 35 ,),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      alignment: FractionalOffset.centerLeft,
                      child: Text("Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize:16.0),
                      ),
                    ),
                    flex: 1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
