import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.5),
        body: Center(
            child: Container(
                width: 100,
                height: 100,
                child: Column(children: [
                  CircularProgressIndicator(
                    color: Get.theme.primaryColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Memuat Data...")
                ]))));

  }
}
