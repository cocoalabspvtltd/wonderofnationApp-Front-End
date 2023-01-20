import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialogs {
  static loading({bool isDismissible = false, Alignment alignment = Alignment.center}) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async {
          if (isDismissible) {
            Get.back();
          }
          return false;
        },
        child: Align(
          alignment: alignment,
          child: Container(
            margin: EdgeInsets.all(12),
            height: 200,
            child: Material(
              borderRadius: BorderRadius.circular(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  isDismissible
                      ? Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.cancel,
                          color: Colors.black12,
                        ),
                      ),
                      onTap: () {
                        Get.close(2);
                      },
                    ),
                  )
                      : Container(),
                  Expanded(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 70,
                            width: 70,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.indigo)
                                    //  color: Colors.indigo,
                                  ),
                                ),
                                Center(
                                  child: Image.asset(
                                    'assets/icons/ic_google.png',
                                    height: 36,
                                    width: 36,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Text(
                          'Please wait..',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.indigo, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
      barrierColor: Colors.black26,
    );
    return;
  }

  static message(String message) {
    Get.dialog(
      Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.all(12),
          child: Material(
            borderRadius: BorderRadius.circular(12),
            child:                 Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('Ok'),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                ],
              ),
            ),

          ),
        ),
      ),
      barrierDismissible: false,
      barrierColor: Colors.black26,
    );
    return;
  }

}
