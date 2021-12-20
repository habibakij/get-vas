import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gas_vat/component/saved_data.dart';
import 'package:gas_vat/login/login_model.dart';
import 'package:gas_vat/ui/home_screen.dart';
import 'package:gas_vat/ui/register_screen.dart';
import 'package:get/route_manager.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginModel _loginRes;
  String phone = "";
  String password = "";
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    EasyLoading.dismiss();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.to(RegisterScreen());
                  },
                  child: Container(
                    height: 75,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            child: Text(
                              "Sign up".toUpperCase(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: HexColor("#1D1A2F"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: InkWell(
                onTap: () {
                  login();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 75,
                  color: HexColor("#1D1A2F"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sign In".toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                color: HexColor("#1D1A2F"),
                child: Image.asset(
                  "assets/images/login_1.png",
                  color: Colors.white,
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 48.0, top: 33),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 48.0, top: 15),
                      child: Text(
                        "Lorem ipsum is a placeholder text commonly used to demonstrate the",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 48.0, top: 25, right: 39),
                      child: TextField(
                        onChanged: (value) {
                          phone = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Phone",
                          prefixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.person_outline,
                              size: 33,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 48.0, top: 20, right: 39),
                      child: TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Image.asset(
                            "assets/images/login_3.png",
                            height: 10,
                            width: 10,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 36.0, top: 4),
                          child: Text(
                            "Forgot password ?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: HexColor("#1D1A2F"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    checkAPI(phone, password);
  }

  Future<void> checkAPI(String _phone, String _password) async {
    EasyLoading.show(maskType: EasyLoadingMaskType.clear);
    Map<String, dynamic> jsonMap = {
      'email': _phone,
      'password': _password,
    };

    try {
      final response = await http.post(
        Uri.parse("https://riddhosoft.com/api/v1/login"),
        body: jsonMap,
      );

      EasyLoading.dismiss();
      _loginRes = loginModelFromJson(response.body);
      if (_loginRes.userData!.status == "1") {
        _phone = _loginRes.userData!.email!;
        log("RESPONSE____${response.body}");
        await MyPrefs.setAuthCode("${_loginRes.accessToken}");
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      } else {
        EasyLoading.dismiss();
      }

      log(response.body);
    } on SocketException {
      EasyLoading.dismiss();
      // Constants.showNoInternetSnackBar(context);
    }
  }
}
