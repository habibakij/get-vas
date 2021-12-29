import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gas_vat/ui/login_sreen.dart';
import 'package:get/route_manager.dart';
import 'package:hexcolor/hexcolor.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  ScrollController _controller= new ScrollController();
  bool _isShowingPassword = false;

  @override
  void initState() {
    super.initState();
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
                  onTap: (){
                    Get.to(LoginScreen());
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
                            "Already have an account?",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            child: Text(
                              "Sign in".toUpperCase(),
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
                    onTap: (){
                      Get.to(LoginScreen());
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
                        "Sign up".toUpperCase(),
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
              ),),
              ),
            ],
          ),
        ),

        body: SingleChildScrollView(
          controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: 300,
                alignment: Alignment.center,
                color: HexColor("#1D1A2F"),
                child: Image.asset(
                  "assets/images/login_1.png",
                  color: Colors.white,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  "Lorem ipsum is a placeholder text commonly used to demonstrate the",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),

                 /*

              Padding(
                padding: EdgeInsets.only(left: 48.0, top: 25, right: 39),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Phone",
                    prefixIcon: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.phone,
                        size: 33,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 48.0, top: 20, right: 39),
                child: TextField(
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


              */

              Container(
                height: 80,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Email/Phone",
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                      fontFamily: "",
                      fontSize: 16,
                    ),
                    prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.blue[800]
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "User Id required.";
                    return null;
                  },
                ),
              ),

              ///Password text form field container
              Container(
                height: 80,
                margin: EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  obscureText: !_isShowingPassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      fontFamily: "",
                      fontSize: 16,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(!_isShowingPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                          color: Colors.blue[800]),
                      onPressed: () {
                        setState(() {
                          _isShowingPassword = !_isShowingPassword;
                        });
                      },
                    ),
                    prefixIcon:
                    Icon(Icons.vpn_key, color: Colors.blue[800]),
                  ),

                  //empty value checking on text form field
                  validator: (value) {
                    if (value!.isEmpty) return "Password required.";
                    return null;
                  },
                ),
              ),

              Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Container(
                     height: 20,
                     padding: const EdgeInsets.only(right: 36.0, top: 4),
                     child: Text(
                       "Forgot password!",
                       style: TextStyle(
                         fontSize: 14,
                         fontWeight: FontWeight.w400,
                         color: HexColor("#1D1A2F"),
                       ),
                     ),
                   ),
                 ],
               ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 20,
                    padding: const EdgeInsets.only(top: 1),
                    child: Text(
                      "please contact",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: HexColor("#1D1A2F"),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    padding: const EdgeInsets.only(right: 36.0, top: 1),
                    child: Text(
                      " help@riddhosoft.com",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),
        ),

      ),
    );
  }
}
