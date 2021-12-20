import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gas_vat/custom_drawer/custom_drawer.dart';
import 'package:gas_vat/printer_page/printer_page.dart';
import 'package:gas_vat/services/pdf_services.dart';
import 'package:gas_vat/ui/91_page.dart';
import 'package:gas_vat/ui/95_page.dart';
import 'package:gas_vat/ui/pdf_screen.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import 'home_screen.dart';

class DieselScreen extends StatefulWidget {
  @override
  State<DieselScreen> createState() => _DieselScreenState();
}

class _DieselScreenState extends State<DieselScreen> {
  final f  = NumberFormat("\$###,###.00","en_US");
  var inputData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.to(NightyFivePage());
                  //  Get.to(RegisterScreen());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 38.0),
                          child: Text(
                            "95",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
              //  Get.to(NightyOnePage());

              },
              child: Container(
                alignment: Alignment.center,
                height: 70,
                color: HexColor("#00953B"),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 48.0),
                        child: Text(
                          "91",
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 3,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: CustomDrawerTwo(),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 28, top: 25),
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: HexColor("#00953B"),
                  color: HexColor("#FFA20C"),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/icon4.png",
                      height: 90,
                      width: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 38.0),
                      child: Center(
                          child: Text(
                        "Diesel",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 28, top: 25),
              child: Card(
                elevation: 6,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0, right: 18.0),
                        child: TextField(
                          onChanged: (data){
                            setState(() {
                              inputData = data;
                              f.format(inputData);

                            });
                          },
                          decoration: InputDecoration(
                              hintText: "100 SRA",
                              hintStyle: TextStyle(fontSize: 24),
                              contentPadding: EdgeInsets.only(left: 70)),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      InkWell(
                        onTap: ()  {
                      //    Navigator.push(context, MaterialPageRoute(builder: (_)=> PrinterPage(data: inputData,)));

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: HexColor("#1F54C3"),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Print",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                Get.to(HomeScreen());

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.home,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
