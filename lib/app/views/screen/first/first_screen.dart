import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/app/controllers/user_controller.dart';
import 'package:suitmedia/app/views/screen/second/second_screen.dart';

class FirstScreen extends GetView<UserController> {
  static const String route = "/";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.1), BlendMode.overlay),
                      image: AssetImage('assets/images/bg_bright.png'))),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 96,
                  ),
                  Text(
                    'Welcome',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'This is app for suitmedia mobile developer test',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32, right: 32),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            top: 16, left: 16, right: 16, bottom: 48),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 48,
                                backgroundImage:
                                    AssetImage('assets/images/img_avatar.png'),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'Type name here..',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Name cannot be null!';
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  controller.setName(newValue);
                                },
                              ),
                              SizedBox(height: 32,),
                              Container(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState?.save();
                                        Get.toNamed(SecondScreen.route);
                                      }
                                    },
                                    child: Text(
                                      'Next',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Text('Copyright © 2021 Suitmedia All rights reserved.'),
                  SizedBox(height: 24,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
