import 'package:bharat_lyak/core/widget/button/app_button.dart';
import 'package:bharat_lyak/core/widget/common_top_bar/common_top_bar.dart';
import 'package:bharat_lyak/core/widget/text_section/text_section.dart';
import 'package:flutter/material.dart';

import '../widget/phone_input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String selectedCode = "+62";
  TextEditingController phoneController = TextEditingController();

  List<String> codes = ["+62", "+91", "+1", "+44"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:40,),
                CommonTopBar(),
                SizedBox(height: 40,),
                TextSection(
                    title:"Enter your \nmobile number",
                    subtitle: 'We will send you a confirmation code.'
                ),
                SizedBox(height: 50,),
                PhoneInputField(
                  selectedCode: selectedCode,
                  countryCodes: codes,
                  controller: phoneController,
                  onCodeChanged: (value) {
                    setState(() {
                      selectedCode = value!;
                    });
                  },
                ),
                SizedBox(height: 30,),
                AppButton(onPressed: (){}, buttonText: 'Continue')
              ],
            ),
          )
      ),
    );
  }
}
