import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/app/controllers/first_screen_controller.dart';
import 'package:suitmedia/app/controllers/user_controller.dart';
import 'package:suitmedia/app/utils/utils.dart';
import 'package:suitmedia/app/views/screen/second/second_screen.dart';

class FirstScreen extends StatelessWidget {
  static const String route = "/";

  final UserController _userController = Get.find();
  final FirstScreenController _firstScreenController =
      Get.put(FirstScreenController());

  final _nameController = TextEditingController();
  final _textController = TextEditingController();

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
                  _card(),
                  Expanded(child: Container()),
                  Text('Copyright © 2021 Suitmedia All rights reserved.'),
                  SizedBox(
                    height: 24,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _card() {
    return Padding(
      padding: EdgeInsets.only(left: 32, right: 32),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage('assets/images/img_avatar.png'),
              ),
              SizedBox(
                height: 32,
              ),
              Obx(() {
                var isError = _firstScreenController.nameError.value;
                var message = _firstScreenController.nameMessage.value;
                return TextField(
                  controller: _nameController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Type name here..',
                      errorText: isError ? message : null),
                );
              }),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                var isError = _firstScreenController.textError.value;
                var message = _firstScreenController.textMessage.value;
                return TextField(
                  controller: _textController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Type Palindrome',
                      errorText: isError ? message : null),
                );
              }),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_nameController.text.isEmpty) {
                              _firstScreenController
                                  .setNameError('Name cannot be null!');
                            } else {
                              _firstScreenController.noNameError();
                              _userController.setName(_nameController.text);
                              Get.toNamed(SecondScreen.route);
                            }
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_textController.text.isEmpty) {
                              _firstScreenController
                                  .setTextError('Text cannot be null!');
                            } else {
                              _firstScreenController.noTextError();
                              _checkPalindrome(_textController.text);
                            }
                          },
                          child: Text(
                            'Check',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkPalindrome(String text) {
    var title = 'Not Palindrome';
    var desc = 'The text "$text" is not palindrome.';
    if (Utils.isPalindrome(text)) {
      title = 'Palindrome';
      desc = 'The text "$text" is palindrome.';
    }
    Get.defaultDialog(title: title, content: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(desc, textAlign: TextAlign.center,),
    ));
  }
}
