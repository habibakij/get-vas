import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_vat/controller/show_oil_info_controller.dart';
import 'package:gas_vat/custom_drawer/custom_drawer.dart';
import 'package:gas_vat/ui/91_page.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ShowOilInfoController showOilInfoController = Get.put(ShowOilInfoController());
  @override
  Widget build(BuildContext context) {

    showOilInfoController.getDataCalling();

    return Scaffold(
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

      body: Container(
        child: Obx(() {
          if (showOilInfoController.loader.value) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            );
          }else{
            return Container(
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: showOilInfoController.oilInfoData.value.data!.length,
                itemBuilder: (_, index) {
                  var allData=showOilInfoController.oilInfoData.value.data;
                  var data = showOilInfoController.oilInfoData.value.data![index];
                  return Container(
                    margin: EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () {
                        Get.to(NightyOnePage(list: allData,selectedItem: index,));
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: HexColor("#00953B"),
                          ),
                          alignment: Alignment.center,
                          height: 120,
                          width: 220,
                          child: Stack(
                            overflow: Overflow.visible,
                            children: [
                              Positioned(
                                left: -50,
                                bottom: -35,
                                child: Container(
                                  height: 120,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: HexColor("#00953B"), width: 2),
                                      shape: BoxShape.circle),
                                  child: Image.asset(
                                    "assets/images/icon4.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 22.0),
                                    child: Text(
                                      "${data.name}",
                                      style: TextStyle(
                                          fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }

        }),
      ),

      // Padding(
      //   padding: const EdgeInsets.only(left: 28.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       InkWell(
      //         onTap: (){
      //           Get.to(NightyOnePage());
      //         },
      //         child: Align(
      //           alignment: Alignment.center,
      //           child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(30),
      //               color: HexColor("#00953B"),
      //             ),
      //             alignment: Alignment.center,
      //             height: 120,
      //             width: 220,
      //             child: Stack(
      //               overflow: Overflow.visible,
      //               children: [
      //                 Positioned(
      //                   left: -50,
      //                   bottom: -35,
      //                   child: Container(
      //                     height: 120,
      //                     width: 130,
      //                     decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         border:
      //                             Border.all(color: HexColor("#00953B"), width: 2),
      //                         shape: BoxShape.circle),
      //                     child: Image.asset(
      //                       "assets/images/icon4.png",
      //                       height: 50,
      //                       width: 50,
      //
      //                     ),
      //                   ),
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.end,
      //                   crossAxisAlignment: CrossAxisAlignment.end,
      //                   children: [
      //                     Padding(
      //                       padding: const EdgeInsets.only(right: 22.0),
      //                       child: Text(
      //                         "91",
      //                         style: TextStyle(
      //                             fontSize: 40, fontWeight: FontWeight.bold),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       InkWell(
      //         onTap: (){
      //           Get.to(NightyFivePage());
      //         },
      //         child: Align(
      //           alignment: Alignment.center,
      //           child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(30),
      //               color: Colors.red,
      //             ),
      //             alignment: Alignment.center,
      //             height: 120,
      //             width: 220,
      //             child: Stack(
      //               overflow: Overflow.visible,
      //               children: [
      //                 Positioned(
      //                   left: -50,
      //                   bottom: -35,
      //                   child: Container(
      //                     height: 120,
      //                     width: 130,
      //                     decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         border: Border.all(color: Colors.red, width: 2),
      //                         shape: BoxShape.circle),
      //                     child: Image.asset(
      //                       "assets/images/icon4.png",
      //                       height: 50,
      //                       width: 50,
      //                     ),
      //                   ),
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.end,
      //                   crossAxisAlignment: CrossAxisAlignment.end,
      //                   children: [
      //                     Padding(
      //                       padding: const EdgeInsets.only(right: 22.0),
      //                       child: Text(
      //                         "95",
      //                         style: TextStyle(
      //                             fontSize: 40, fontWeight: FontWeight.bold),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       InkWell(
      //         onTap: (){
      //           Get.to(DieselScreen());
      //
      //         },
      //         child: Align(
      //           alignment: Alignment.center,
      //           child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(30),
      //               color: HexColor("#FFA20C"),
      //             ),
      //             alignment: Alignment.center,
      //             height: 120,
      //             width: 220,
      //             child: Stack(
      //               overflow: Overflow.visible,
      //               children: [
      //                 Positioned(
      //                   left: -50,
      //                   bottom: -35,
      //                   child: Container(
      //                     height: 120,
      //                     width: 130,
      //                     decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         border:
      //                             Border.all(color: HexColor("#FFA20C"), width: 2),
      //                         shape: BoxShape.circle),
      //                     child: Image.asset(
      //                       "assets/images/icon4.png",
      //                       height: 50,
      //                       width: 50,
      //                     ),
      //                   ),
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.end,
      //                   crossAxisAlignment: CrossAxisAlignment.end,
      //                   children: [
      //                     Padding(
      //                       padding: const EdgeInsets.only(right: 22.0),
      //                       child: Text(
      //                         "Diesel",
      //                         style: TextStyle(
      //                             fontSize: 40, fontWeight: FontWeight.bold),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
