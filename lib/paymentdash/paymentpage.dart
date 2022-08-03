import 'package:flutter/material.dart';
import 'package:oo/constants/colors.dart';
import 'package:oo/constants/mathUtils.dart';

class Paymentmethod extends StatefulWidget {
  const Paymentmethod({Key? key}) : super(key: key);

  @override
  State<Paymentmethod> createState() => _PaymentmethodState();
}

class _PaymentmethodState extends State<Paymentmethod> {
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
          padding: const EdgeInsets.only(left: 50),
          child: Text("Payment method",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400
          ),),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 20),
              child: SizedBox(
                height: 45,
                width: 280,
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Net Banking",
                    prefixIcon: Icon(Icons.home_outlined,color: Colors.black,),
                    hintStyle: TextStyle(color: Colors.black,fontSize: 14),
                    contentPadding: EdgeInsets.all(8),
                    suffixIcon: PopupMenuButton<int>(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.5,
                            color: Colors.black,
                          )),
                      icon:Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.black87,size: 25,
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Container(
                            width: 600,
                            height: 38,
                            child: TextField(
                              onTap: (){
                              },
                              decoration: InputDecoration(
                                hintText: "Card Number",
                                hintStyle: TextStyle(color: Colors.black,fontSize: 14),
                                filled: true,
                                fillColor: Colors.grey.shade50,
                                contentPadding: EdgeInsets.all(8),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 0.2,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                    width:0.2,
                                    color:Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          child: Container(
                            width: 600,
                            height: 38,
                            child: TextField(
                              onTap: (){
                              },
                              decoration: InputDecoration(
                                hintText: "Exp Date",
                                hintStyle: TextStyle(color: Colors.black,fontSize: 14),
                                filled: true,
                                fillColor: Colors.grey.shade50,
                                contentPadding: EdgeInsets.all(8),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 0.2,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                    width:0.2,
                                    color:Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          child:Container(
                            width: 600,
                            height: 38,
                            child: TextField(
                              onTap: (){
                              },
                              decoration: InputDecoration(
                                hintText: "CVV",
                                hintStyle: TextStyle(color: Colors.black,fontSize: 14),
                                filled: true,
                                fillColor: Colors.grey.shade50,
                                contentPadding: EdgeInsets.all(8),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 0.2,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                    width:0.2,
                                    color:Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          child:Container(
                            width: 600,
                            height: 38,
                            child: TextField(
                              onTap: (){
                              },
                              decoration: InputDecoration(
                                hintText: "Name On Card",
                                hintStyle: TextStyle(color: Colors.black,fontSize: 14),
                                filled: true,
                                fillColor: Colors.grey.shade50,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                      width: 0.2,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                    width:0.2,
                                    color:Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                      offset: Offset(0,40),
                      color: Colors.white,
                      elevation: 0,
                      // on selected we show the dialog box
                      onSelected: (value) {
                      },
                    ) ,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 0.5,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        width:0.5,
                        color:Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 20),
              child: SizedBox(
                height: 45,
                width: 280,
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Debit/Credit",
                    prefixIcon: Icon(Icons.credit_card,color: Colors.black,),
                    hintStyle: TextStyle(color: Colors.black,fontSize: 14),
                    contentPadding: EdgeInsets.all(8),
                    suffixIcon: Icon(Icons.arrow_drop_down_outlined,color: Colors.black,),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 0.5,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        width:0.5,
                        color:Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 20),
              child: SizedBox(
                height: 45,
                width: 280,
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "UPI",
                    prefixIcon: Icon(Icons.card_membership_sharp,color: Colors.black,),
                    hintStyle: TextStyle(color: Colors.black,fontSize: 14),
                    contentPadding: EdgeInsets.all(8),
                    suffixIcon: Icon(Icons.arrow_drop_down_outlined,color: Colors.black,),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 0.5,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        width:0.5,
                        color:Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 20),
              child: SizedBox(
                height: 45,
                width: 280,
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Add Coupns",
                    prefixIcon: Icon(Icons.padding_rounded,color: Colors.black,),
                    hintStyle: TextStyle(color: Colors.black,fontSize: 14),
                    contentPadding: EdgeInsets.all(8),
                    suffixIcon: Icon(Icons.arrow_drop_down_outlined,color: Colors.black,),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 0.5,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        width:0.5,
                        color:Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: EdgeInsets.only(
                left: getHorizontalSize(
                  30.00,
                ),top: 20,
                right: getHorizontalSize(
                  25.00,
                ),
              ),
              child: GestureDetector(onTap: (){
              },
                child: Container(
                  alignment: Alignment.center,
                  height: getVerticalSize(
                    45.00,
                  ),
                  width: getHorizontalSize(
                    284.00,
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.green6320,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        10.00,
                      ),
                    ),
                  ),
                  child: Text(
                    "Save",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorConstant.whiteA700,
                      fontSize: getFontSize(
                        15,
                      ),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}