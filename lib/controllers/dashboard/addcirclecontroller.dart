import 'package:get/get.dart';
import 'package:ajosuite_saver/services/backend.dart';

class AddCircleController extends GetxController {
  Backend backend = Backend();

  addcicrle(Map data) async {
    dynamic bodydata;
    await backend.availblecirles(data: data).then((value) {
      bodydata = value;
      return bodydata;
    });
    return bodydata;
  }

  singlecircle(Map data) async {
    dynamic bodydata;
    await backend.availblecirle(data: data).then((value) {
      bodydata = value;
      return bodydata;
    });
    return bodydata;
  }

  loadMore(Map data, String url) async {
    dynamic bodydata;
    await backend.paginator(url: url, data: data).then((value) {
      bodydata = value;
      return bodydata;
    });
    return bodydata;
  }

  joincircle(Map data) async {
    dynamic bodydata;
    await backend.joincircle(data: data).then((value) {
      bodydata = value;
      return bodydata;
    });
    return bodydata;
  }

  // selectdatesUpload joincircle
}
