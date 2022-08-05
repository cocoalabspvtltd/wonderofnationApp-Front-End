import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import 'package:oo/apis/bloc/Coiurt_slot_bloc.dart';
import 'package:oo/apis/bloc/invoice_bloc.dart';
import 'package:oo/apis/modelclass/invoice_model.dart';

import 'package:oo/apis/repositories/joinedclubs.dart';
import 'package:oo/homePage/navigator.dart';

import '../constants/colors.dart';
import '../constants/mathUtils.dart';
import '../constants/response.dart';
import '../screens/shimmer.dart';
import 'addplayers.dart';
import 'clubdetails.dart';



class Payment_success extends StatefulWidget {
  const Payment_success({Key? key, }) : super(key: key);

  @override
  State<Payment_success> createState() => _Payment_successState();
}

class _Payment_successState extends State<Payment_success> {
  late InvoiceBLOC _bloc;
  List book_model= ["Private", "Public"];
  int selectedIndex = -1;
  List<dynamic> patientappointmentsearchdata = [];
  List<dynamic> patientappointmentserachlist = [];
  TextEditingController patientappointmentController = TextEditingController();
  ClubjoinedbuttonRepository joinclubapi = ClubjoinedbuttonRepository();
  List court = ["Court 1", "Court 2", "Court 3"];
  int selectedIndex2 = -1;
  List times = ["10.00", "12.00", "14.00","19.00"];
  int selectedIndex1 = -1;
  TextEditingController dateinputcontroller =
  new TextEditingController(text: DateTime.now().toString());

  Color _colorContainer1 = Colors.white;
  Color _colorContainer2 = Colors.white;

  void initState() {
    super.initState();
    _bloc =InvoiceBLOC();


    setState(() {});
  }
  @override
  ListView _jobsListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          print("data->>>>>>${data[index].email}");
          return _tile(data[index].name,data[index].email,data[index].amount,data[index].payment_id);
        });
  }

  SizedBox _tile(
      String name,String email,int amount ,String payment_id ) =>
      SizedBox(
        height: size.height,
        child:    Column(
          children: [

            SizedBox(height: 30,),
            Center(child: Image.asset("assets/images/success_pay.png",height: 100,width: 700,)),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("Payment Successful",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.green,fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:15),
              child: Text("Your payment has been proceeded!,",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize: 13),),
            ),
            Text("Details of transaction are included below",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey,fontSize: 13),),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 15),
              child: Divider(
                thickness: 0.6,
                color: Colors.grey,
              ),
            ),
            Text("${name.toUpperCase()}",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 15)),
            SizedBox(height: 8,),
            Text("${email}",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 15)),
            Padding(
              padding: const EdgeInsets.only(top: 60,left: 20,right: 20),
              child: Row(
                children: [
                  Text("TOTAL AMOUNT PAID",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 14),),
                  SizedBox(width: 130,),
                  Text("${amount} ₹",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 14),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 30,top: 5,bottom: 15),
              child: Divider(
                thickness: 0.6,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8,left: 20,right: 20),
              child: Row(
                children: [
                  Text("TRANSACTION ID",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 14),),
                  SizedBox(width: 60,),
                  Text("${payment_id}",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 14),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 30,top: 5,bottom: 15),
              child: Divider(
                thickness: 0.6,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8,left: 20,right: 20),
              child: Row(
                children: [
                  Text("TRANSACTION DATE",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 14),),
                  SizedBox(width: 30,),
                  Text("05 Aug 2022, 05:25 PM",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 14),)
                ],
              ),
            ),
          ],

        ),

      );



  TextEditingController searchcontroller = new TextEditingController();
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashBoard(UserName1: "")));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              "Time Slots",
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

        body: StreamBuilder<Response<List<InvoiceModelClass>>>(
            stream: _bloc.InvoiceDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("sdfghjk");
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Container(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                    break;
                  case Status.SUCCESS:
                    List<dynamic> patientappointmentList =
                        snapshot.data!.data;
                    patientappointmentsearchdata = patientappointmentList;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _jobsListView(patientappointmentsearchdata),

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
    );
  }

}