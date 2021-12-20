
import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
import 'package:flutter/cupertino.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';

class DemoPrint extends StatefulWidget {
  const DemoPrint({Key? key}) : super(key: key);

  @override
  _DemoPrintState createState() => _DemoPrintState();
}

class _DemoPrintState extends State<DemoPrint> {


  PrinterBluetoothManager _bluetoothManager= new PrinterBluetoothManager();
  List<PrinterBluetooth> _listDevices= [];
  String deviceMsg= "";

  @override
  void initState() {
    initPrinter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Print", style: TextStyle(fontSize: 20),),
      ),
      body: _listDevices.isEmpty ? Center(child: Text(deviceMsg),) :
          ListView.builder(
            itemCount: _listDevices.length,
            itemBuilder: (c,i){
              return ListTile(
                leading: Icon(Icons.print),
                title: Text(_listDevices[i].name!),
                subtitle: Text(_listDevices[i].address!),
                onTap: (){
                  print("print_device: ${_listDevices[i].name}");
                  startPrint(_listDevices[i]);
                },
              );
            },
          )
    );
  }

  void initPrinter(){
    _bluetoothManager.startScan(Duration(seconds: 2));
    _bluetoothManager.scanResults.listen((event) {
      if(!mounted) return;
      setState(() {
        _listDevices= event;
        print("check_device: $_listDevices");
      });
      if(_listDevices.isEmpty){
        deviceMsg= "No Device Found";
      }
    });
  }

  Future <void> startPrint(PrinterBluetooth printerBluetooth) async{
    _bluetoothManager.selectPrinter(printerBluetooth);
    const PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();
    final result= await _bluetoothManager.printTicket(await testTicket(paper, profile));
    print("print_result_ $result");
  }

  Future<List<int>> testTicket(
      PaperSize paper, CapabilityProfile profile) async {
    final Generator generator = Generator(paper, profile);
    List<int> bytes = [];

    bytes += generator.text('Test demo title');
    bytes += generator.text('Bold text', styles: PosStyles(bold: true));
    bytes += generator.text('Reverse text', styles: PosStyles(reverse: true));
    bytes += generator.text('Underlined text',
        styles: PosStyles(underline: true), linesAfter: 1);
    bytes +=
        generator.text('Align left', styles: PosStyles(align: PosAlign.left));
    bytes += generator.text('Align center',
        styles: PosStyles(align: PosAlign.center));
    bytes += generator.text('Align right',
        styles: PosStyles(align: PosAlign.right), linesAfter: 1);

    bytes += generator.row([
      PosColumn(
        text: 'col3',
        width: 3,
        styles: PosStyles(align: PosAlign.center, underline: true),
      ),
      PosColumn(
        text: 'col6',
        width: 6,
        styles: PosStyles(align: PosAlign.center, underline: true),
      ),
      PosColumn(
        text: 'col3',
        width: 3,
        styles: PosStyles(align: PosAlign.center, underline: true),
      ),
    ]);

    bytes += generator.text('Text size 200%',
        styles: PosStyles(
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ));

    // Print barcode
    final List<int> barData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4];
    bytes += generator.barcode(Barcode.upcA(barData));
    bytes += generator.feed(2);
    bytes += generator.cut();
    return bytes;
  }

}
