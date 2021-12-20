// import 'package:bluetooth_print/bluetooth_print.dart';
// import 'package:bluetooth_print/bluetooth_print_model.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class PrinterPage extends StatefulWidget {
//   final String? data;
//
//   const PrinterPage({Key? key, this.data}) : super(key: key);
//   @override
//   _PrinterPageState createState() => _PrinterPageState();
// }
//
// class _PrinterPageState extends State<PrinterPage> {
//   BluetoothPrint ? bluetoothPrint;
//   List<BluetoothDevice> device = [];
//   String  ? deviceMessage;
//  // final f = NumberFormat("\$###,###.00", "en_US");
//   @override
//   void initState() {
//  bluetoothPrint   = BluetoothPrint.instance;
//     super.initState();
//     WidgetsBinding.instance!
//         .addPostFrameCallback((timeStamp) => {initPrinter()});
//   }
//
//   Future<void> initPrinter() async {
//     bluetoothPrint!.startScan(timeout: Duration(seconds: 2));
//     if (!mounted) return;
//     bluetoothPrint!.scanResults.listen((event) {
//       if (!mounted) return;
//       setState(() => {device = event});
//       if (device.isEmpty) {
//         deviceMessage = "No Devices";
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Text(
//           "Select Printer",
//           style: TextStyle(
//               fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
//         ),
//       ),
//       body: device.isEmpty
//           ? Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(
//                 child: Text(
//                   deviceMessage ?? "",
//                   style: TextStyle(fontSize: 18, color: Colors.black),
//                 ),
//               ),
//             )
//           : Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 primary: false,
//                 itemCount: device.length,
//                 itemBuilder: (_, index) {
//                   return ListTile(
//                     onTap: (){
//                       _startPrint(device[index]);
//                     },
//                     title: Text(
//                       widget.data!,
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.black,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   );
//                 },
//               ),
//             ),
//     );
//   }
//
//   Future<void> _startPrint(BluetoothDevice bluetoothDevice) async {
//     if (bluetoothDevice != null && bluetoothDevice.address != null) {
//       await bluetoothPrint!.connect(bluetoothDevice);
//       List<LineText> list = [];
//       list.add(
//         LineText(
//           type: LineText.TYPE_TEXT,
//           content: "Gas Vat App",
//           weight: 2,
//           width: 2,
//           height: 2,
//           align: LineText.ALIGN_CENTER,
//         ),
//       );
//
//       for (var i = 0; i < widget.data!.length; i++) {
//         list.add(
//           LineText(
//             type: LineText.TYPE_TEXT,
//             content: widget.data,
//             weight: 0,
//             align: LineText.ALIGN_LEFT,
//             linefeed: 1,
//           ),
//         );
//       }
//     }
//   }
// }
