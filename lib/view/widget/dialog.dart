import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  static Future alerError() {
    return Get.dialog(AlertDialog(
      title: const Text('เเจ้งเตือน'),
      content: const Text('กรอกข้อมูลให้ครบทวน'),
      actions: [
        TextButton(onPressed: () => Get.back(), child: const Text('OK'))
      ],
    ));
  }
}
