
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gas_vat/component/saved_data.dart';
import 'package:gas_vat/custom_drawer/custom_drawer.dart';
import 'package:gas_vat/model/invoice_create_res.dart';
import 'package:gas_vat/model/invoice_show_res.dart';
import 'package:gas_vat/model/oil_info_model.dart';
import 'package:gas_vat/printer_page/printer_page.dart';
import 'package:gas_vat/services/pdf_services.dart';
import 'package:gas_vat/ui/95_page.dart';
import 'package:gas_vat/ui/home_screen.dart';
import 'package:gas_vat/ui/pdf_screen.dart';
import 'package:get/route_manager.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'demoprint.dart';
import 'diesel_screen.dart';
import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';


class NightyOnePage extends StatefulWidget {
  final List<Datum>? list;
  final int selectedItem;

  const NightyOnePage({Key? key, required this.list,required this.selectedItem}) : super(key: key);

  @override
  _NightyOnePageState createState() => _NightyOnePageState();
}

class _NightyOnePageState extends State<NightyOnePage> {

  bool printBinded = false;
  int paperSize = 0;
  String serialNumber = "";
  String printerVersion = "";
  late PrinterStatus _printerStatus;
  late PrinterMode _printerMode;
  int currentItem=0;
  final List<Map<String,dynamic>> data = [];
 final f  = NumberFormat("\$###,###.00","en_US");
  double inputData=0;
  final controller =  TextEditingController();

  @override
  void initState() {


    /*currentItem=widget.selectedItem;
    super.initState();
    _bindingPrinter().then((bool? isBind) async {
      _getPrinterStatus();
      SunmiPrinter.paperSize().then((int size) {
        setState(() {
          paperSize = size;
        });
      });
      SunmiPrinter.printerVersion().then((String version) {
        setState(() {
          printerVersion = version;
        });
      });
      SunmiPrinter.serialNumber().then((String serial) {
        setState(() {
          serialNumber = serial;
        });
      });
      setState(() {
        printBinded = isBind!;
      });
    });*/


    /*WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _bindingPrinter().then( (bool? isBind) async => {

        if (isBind!) {
          _getPrinterStatus(),
          _getPrinterMode(),
        }
      });
    });*/
  }

  Future<bool?> _bindingPrinter() async {
    final bool? result = await SunmiPrinter.bindingPrinter();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    int previous=0;
    int next=0;
    if(widget.list!.length>1){
      if(currentItem==0){
        previous=widget.list!.length-1;
      }else{
        previous=currentItem-1;
      }
      if(currentItem==widget.list!.length-1){
        next=0;
      }else{
        next=currentItem+1;
      }
    }else{
       previous=0;
       next=0;
    }
    EasyLoading.showToast("paper->$paperSize \nprintBinded->$printBinded \nserialNumber->$serialNumber \nprinterVersion->$printerVersion ");

    return Scaffold(
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                 //Get.to(NightyFivePage());
                  setState(() {
                    currentItem=previous;
                  });
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
                        Icon(Icons.arrow_back,color: Colors.white,),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text("${widget.list!.elementAt(previous).name}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
                child: InkWell(
              onTap: () {
               // Get.to(DieselScreen());
                setState(() {
                  currentItem=next;
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 70,
                color: HexColor("#FFA20C"),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("${widget.list!.elementAt(next).name}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.arrow_forward,color: Colors.white,),
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
                  color: HexColor("#00953B"),
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
                        "${widget.list!.elementAt(currentItem).name}",
                        style: TextStyle(
                          fontSize: 25,
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
                          //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                          keyboardType: TextInputType.number,
                          onChanged: ( data){
                            setState(() {
                             // print(data.runtimeType);
                              try{
                                inputData = double.parse(data);
                              }catch(e){
                                inputData=0;
                              }



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
                      // ButtonWidget(
                      //   text: 'Print',
                      //   onClicked: () async {
                      //     final path = 'assets/sample.pdf';
                      //     final file = await PDFApi.loadAsset(path);
                      //     openPDF(context, file);
                      //   },
                      // ),
                      const SizedBox(height: 16),
                      // ButtonWidget(
                      //   text: 'File PDF',
                      //   onClicked: () async {
                      //     final file = await PDFApi.pickFile();
                      //
                      //     if (file == null) return;
                      //     openPDF(context, file);
                      //   },
                      // ),
                  InkWell(
                    onTap: ()  {
                      // final path = 'assets/images/sample.pdf';
                      // final file = await PDFApi.loadAsset(path);
                      // openPDF(context, file);
                      if(inputData>0){
                        print('check_print');
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DemoPrint()));
                        //createInvoice();
                      }else{
                        EasyLoading.showToast("Enter Valid ammount",toastPosition: EasyLoadingToastPosition.bottom);
                      }


              /*        print("object ${inputData.runtimeType}");
                      var data=widget.list!.elementAt(currentItem);
                      print("object ${inputData.runtimeType}");
                      int id=data.id!=null?int.parse("${data.id}"):0;
                      print("object ${inputData.runtimeType}");
                      createInvoice(id, double.parse(inputData!.trim()));
                      try{


                        //  _printTicket();


                      }catch(e){
                        print("${e.toString()}");
                      }
*/


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


  createInvoice() async {
    int id=widget.list!.elementAt(currentItem).id !=null?int.parse("${widget.list!.elementAt(currentItem).id}"):0;
    double price=double.parse(inputData.toString());
    EasyLoading.show(maskType: EasyLoadingMaskType.clear);
    Map<dynamic, dynamic> jsonMap = {
      'oilInfo_id': id,
      'amount': price,
    };
    Map data = {
      'oilInfo_id': id,
      'amount': price
    };
    
    print("object $id");
    String? token;
    await MyPrefs.getAuthCode().then((value) {
      token = value;
    });
    String url = "https://riddhosoft.com/api/v1/invoice";
    try{
      final response = await http.post(
          Uri.parse("$url"),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }
      );
      EasyLoading.dismiss();
      log("sell"+response.body);
      var res=invoiceCreateResFromJson(response.body);
      if(res.statusCode==201){
        try{
          getInvoice(res.data!.id!);
        }catch(e){
          print(e.toString());
        }
      }else{
        EasyLoading.showToast("Something Wrong",toastPosition: EasyLoadingToastPosition.bottom);
      }
    }catch(e){
      print(e.toString());
      EasyLoading.dismiss();
    }
  }
  getInvoice(int id) async {
    EasyLoading.show(maskType: EasyLoadingMaskType.clear);
    String? token;
    await MyPrefs.getAuthCode().then((value) {
      token = value;
    });
    String url = "https://riddhosoft.com/api/v1/invoice-page/$id";
    try{
      final response = await http.get(
          Uri.parse("$url"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }
      );
      EasyLoading.dismiss();
      log("print"+response.body);
      var res=invoiceShowResFromJson(response.body);
      if(res.statusCode==201){
        _printTicket(res);
      }else{
        EasyLoading.showToast("Something Wrong",toastPosition: EasyLoadingToastPosition.bottom);
      }
    }catch(e){
      print(e.toString());
      EasyLoading.dismiss();
    }
  }
  /// you can get printer status
  Future<void> _getPrinterStatus() async {
    try{
      final PrinterStatus result = await SunmiPrinter.getPrinterStatus();
      setState(() {
        _printerStatus = result;
      });
    }catch(e){
      log("_printerStatus Error");
    }
  }
  Future<void> _getPrinterMode() async {
    try{
      final PrinterMode mode = await SunmiPrinter.getPrinterMode();
      _printerMode= mode;
    }catch(e){
      log("_getPrinterMode Error");
    }
  }
  Future<void> _printTicket(InvoiceShowRes res) async {
    EasyLoading.showToast("Printer Status: $_printerStatus",duration: Duration(milliseconds: 1000),toastPosition: EasyLoadingToastPosition.bottom);
    await Future.delayed(Duration(milliseconds: 800));
    EasyLoading.showToast("Printing.....",duration: Duration(milliseconds: 1500),toastPosition: EasyLoadingToastPosition.bottom);
   // EasyLoading.show(status: "Printing...");
    String date=DateTime.now().toLocal().toString().split(" ")[0];
    var price =res.invoiceShow!.price;
    var sprice = price!.toStringAsFixed(2);
    var myliter=double.parse("${res.invoiceShow!.litter}").toStringAsFixed(2);
  //  var ammount=double.parse("${res.invoiceShow!.amount}").toStringAsFixed(2);

    var withoutvarprice=double.parse((price*double.parse(myliter)).toStringAsFixed(2));
    var vat=double.parse((withoutvarprice*double.parse("${res.invoiceShow!.vat}")/100).toStringAsFixed(2));
    var net=withoutvarprice+vat;

    try{
      log("$sprice - $myliter - $withoutvarprice -$vat $net ");
     // log("_printerStatus"+_printerStatus.toString());
      if (_printerStatus == PrinterStatus.NORMAL) {
        // Enter into the transaction mode
        await SunmiPrinter.startTransactionPrint();
        // Set whatever alignment u like

        ByteData bytes = await rootBundle.load('assets/images/com_logo.png');
        final buffer = bytes.buffer;

        ByteData bytes2 = await rootBundle.load('assets/images/bar_code.jpg');
        final buffer2 = bytes2.buffer;

      //  final imgData = base64.encode(Uint8List.view(buffer));
       // SunmiPrinter.image(imgData);

        await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
        await SunmiPrinter.printImage(buffer.asUint8List());
        await SunmiPrinter.lineWrap(2);


        await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
        await SunmiPrinter.printText('TIN 4493664979465698');
        await SunmiPrinter.printText('VAT 89744164');
        await SunmiPrinter.lineWrap(2);


        await SunmiPrinter.printBarCode('1234567890', barcodeType: SunmiBarcodeType.CODE128, textPosition: SunmiBarcodeTextPos.TEXT_UNDER, height: 20);
        await SunmiPrinter.lineWrap(2);

        await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
        await SunmiPrinter.printText('Al Nahda Street, Cross Tahlia,');
        await SunmiPrinter.printText('Jeddah, Saudi Arabia.');
        await SunmiPrinter.printText('Phone:54646464646');
        await SunmiPrinter.lineWrap(2);

        await SunmiPrinter.line();
        await SunmiPrinter.printRow(cols: [
          ColumnMaker(text: '$date',  align: SunmiPrintAlign.LEFT),
          ColumnMaker(text: 'المجموع',  align: SunmiPrintAlign.RIGHT),
        ]);

        await SunmiPrinter.printRow(cols: [
          ColumnMaker(text: '${res.invoiceShow!.invoiceNo}',  align: SunmiPrintAlign.LEFT),
          ColumnMaker(text: 'فاتورة',  align: SunmiPrintAlign.RIGHT),
        ]);

        await SunmiPrinter.printRow(cols: [
          ColumnMaker(text: 'Cash Invoice',  align: SunmiPrintAlign.LEFT),
          ColumnMaker(text: 'قسط',  align: SunmiPrintAlign.RIGHT),
        ]);

        await SunmiPrinter.printRow(cols: [
          ColumnMaker(text: 'Mr. XYZ', align: SunmiPrintAlign.LEFT),
          ColumnMaker(text: 'أمين الصندوق', align: SunmiPrintAlign.RIGHT),
        ]);

        await SunmiPrinter.line();

        await SunmiPrinter.printRow(cols: [
          ColumnMaker(text: 'Mr. XYZ', align: SunmiPrintAlign.LEFT),
          ColumnMaker(text: 'أمين الصندوق', align: SunmiPrintAlign.RIGHT),
        ]);


        await SunmiPrinter.setAlignment(SunmiPrintAlign.LEFT);
        await SunmiPrinter.printText('Gas Type: ${res.invoiceShow!.name}');
        await SunmiPrinter.lineWrap(1);

        await SunmiPrinter.setAlignment(SunmiPrintAlign.LEFT);
        await SunmiPrinter.printText('Litter : ${res.invoiceShow!.litter}');
        await SunmiPrinter.lineWrap(1);

        await SunmiPrinter.setAlignment(SunmiPrintAlign.LEFT);
        await SunmiPrinter.printText('Litter Price : ${sprice} SAR');
        await SunmiPrinter.lineWrap(1);

        await SunmiPrinter.line();

        await SunmiPrinter.setAlignment(SunmiPrintAlign.LEFT);
        await SunmiPrinter.printText('Price: $withoutvarprice SAR');
        await SunmiPrinter.lineWrap(1);

        await SunmiPrinter.setAlignment(SunmiPrintAlign.LEFT);
        await SunmiPrinter.printText('VAT: $vat SAR');
        await SunmiPrinter.lineWrap(1);

        await SunmiPrinter.setAlignment(SunmiPrintAlign.LEFT);
        await SunmiPrinter.printText('Net Price: $net SAR',style:SunmiStyle(bold: true) );
        await SunmiPrinter.lineWrap(4);


        await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
        await SunmiPrinter.printText('*** \n System Developed by Riddhosoft \n www.riddhosoft.com');
        await SunmiPrinter.lineWrap(2);

// you can add other print-relevant methods here..
// lastly add submit print here
        await SunmiPrinter.submitTransactionPrint(); // submit and start print, you can keep submit while in loop
// remember to exit the transaction mode after finish printing.
        await SunmiPrinter.exitTransactionPrint();
      }else{
        EasyLoading.dismiss();
      }
      log("_printerStatus"+_printerStatus.toString());
      EasyLoading.dismiss();
    }catch(e){
    EasyLoading.dismiss();
      log("_printTicket Error");
    }
    EasyLoading.dismiss();
    EasyLoading.dismiss();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    EasyLoading.dismiss();
  }

}
