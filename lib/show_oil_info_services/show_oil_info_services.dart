import 'dart:developer';

import 'package:gas_vat/component/saved_data.dart';
import 'package:gas_vat/model/oil_info_model.dart';
import 'package:http/http.dart' as http;

class ShowOilInfoServices {
  Future<ShowOilInfoModel?> fetchData() async {
    String? token;
    await MyPrefs.getAuthCode().then((value) {
      token = value;
    });
    String url = "https://riddhosoft.com/api/v1/invoice";

    print("URL.......>>> $token>>$url");


    var response = await http.get(
      Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    log(response.body);
    if (response.statusCode == 200) {
      var explore = response.body;

      print("RESONSE ____$explore");
      return showOilInfoFromJson(explore);
    } else {
      return null;
    }
  }
}
