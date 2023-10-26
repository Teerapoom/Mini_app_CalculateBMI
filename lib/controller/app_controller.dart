import 'package:get/get.dart';

import '../model/Utility/Constant/my_img.dart';

class MyController extends GetxController {
  RxDouble bmiResult = 0.0.obs;
  RxString rulesWeight = ''.obs;
  

  RxDouble changevalue(weightS, heightS) {
    double w = double.parse(weightS);
    double h = double.parse(heightS);

    double m = h / 100;
    double bmiValue = w / (m * m);

    bmiResult.value = bmiValue;
    return bmiResult;
  }

  String conditionWeight() {
    if (bmiResult.value >= 30) {
      return 'อ้วนมาก';
    } else if (bmiResult.value >= 25) {
      return 'อ้วน';
    } else if (bmiResult.value >= 18.5) {
      return 'ปกติ';
    } else {
      return 'ผอมเกินไป';
    }
  }

  String connditionimgWeight() {
    if (bmiResult.value >= 30) {
      return MyImage.bmi_Over;
    } else if (bmiResult.value >= 25) {
      return MyImage.bmi_Over;
    } else if (bmiResult.value >= 18.5) {
      return MyImage.bmicommon;
    } else {
      return MyImage.bmithin;
    }
  }
}
