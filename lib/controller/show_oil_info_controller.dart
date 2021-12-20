
import 'package:gas_vat/model/oil_info_model.dart';
import 'package:gas_vat/show_oil_info_services/show_oil_info_services.dart';
import 'package:get/get.dart';


class ShowOilInfoController extends GetxController {

  var oilInfoData = ShowOilInfoModel().obs;
  var loader = true.obs;

  ShowOilInfoServices _showOilInfoServices =
  ShowOilInfoServices();

  @override
  void onInit() {
    super.onInit();

  }

  void getDataCalling() async {
    try {
      loader(true);
      var data = await _showOilInfoServices.fetchData();
      if (data != null) {
        oilInfoData.value = data;
      }
    } finally {
      loader(false);
    }
  }
}
