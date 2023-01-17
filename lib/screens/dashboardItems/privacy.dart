import 'package:flutter/material.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
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
          padding: const EdgeInsets.only(left: 50),
          child: Text("Privacy & Security",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400
          ),),
        ),
      ),body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 28,right: 28),
                child: Container(
                    child :  Text('''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac, augue amet morbi dui commodo a mi. Imperdiet eu amet fermentum cursus vulputate porttitor morbi ullamcorper aliquet. Morbi ac molestie in a. Laoreet enim netus orci libero ultrices rutrum diam adipiscing nulla. Proin facilisis eget natoque montes, enim pharetra ut dictum. Amet velit in eget condimentum mattis. Sed facilisis interdum eget tincidunt dapibus vestibulum pharetra vel convallis. Vulputate eu arcu velit sed justo, pellentesque id dolor. Morbi maecenas ut feugiat et dictumst morbi egestas. Nec at tellus vitae metus.Odio pharetra, dolor lacus, laoreet ipsum. Est lobortis lectus aenean arcu cras.Pretium non egestas massa tortor. In vitae aliquam a quis urna. Aliquam blanditaliquam aliquet arcu amet et ridiculus. Id lectus at aenean at. Enim nec fermentum in aliquam mattis duis libero porta. Nunc eu, ut mattis malesuada. Pretium tempus tristique risus, massa.
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac, augue ametmorbi dui commodo a mi. Imperdiet eu amet fermentum cursus vulputate porttitormorbi ullamcorper aliquet. Morbi ac molestie in a. Laoreet enim netus orci libero ultrices rutrum diam adipiscing nulla. Proin facilisis eget natoque montes, enim pharetra ut dictum. Amet velit in eget condimentum mattis. Sed facilisisinterdum eget tincidunt dapibus vestibulum pharetra vel convallis. 
                ''',
                      maxLines: 90, style: TextStyle(fontSize: 14 ,fontWeight:FontWeight.w400,fontFamily: 'Inter',
                          color: Colors.black,wordSpacing:0.1, height: 1.5,letterSpacing: 0.2) ,
                      textAlign: TextAlign.justify, )
                ),
              ),
            ]
        ),
      ),
    ),
    );
  }
}