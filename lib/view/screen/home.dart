import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/app_controller.dart';
import '../widget/dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getController_app = Get.put(MyController());
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    final inputWeight_Controller = TextEditingController();
    final inputheight_Controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
          title: const Text(
            'Mini app BMI',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); // ซ่อนคีบอร์ดเมื่อคลิกพื้นที่อื่น
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('โปรแกรมคำนวนค่าดัชนีมวลกาย - BMI',
                          style: textTheme.bodyLarge!),
                    ),
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      Form(
                          child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'น้ำหนักตัว (kg.)',
                                labelStyle:
                                    TextStyle(color: Colors.grey.shade400)),
                            keyboardType: TextInputType.number,
                            controller: inputWeight_Controller,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'ส่วนสูง (cm.)',
                                labelStyle:
                                    TextStyle(color: Colors.grey.shade400)),
                            keyboardType: TextInputType.number,
                            controller: inputheight_Controller,
                          ),
                        ],
                      )),
                      const SizedBox(height: 40),
                      ElevatedButton(
                          onPressed: () {
                            if (inputWeight_Controller.text.isNotEmpty &&
                                inputheight_Controller.text.isNotEmpty) {
                              getController_app.changevalue(
                                  inputWeight_Controller.text,
                                  inputheight_Controller.text);
                            }else{
                              CustomDialog.alerError();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade300, // สีพื้นหลังของปุ่ม
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // ปรับค่านี้เพื่อทำให้มีโค้งน้อยลง
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'คำนวณ',
                                style: TextStyle(color: Colors.black),
                              ),
                              Icon(
                                Icons.arrow_downward,
                                color: Colors.black,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context)
                      .size
                      .width, // ใช้ความกว้างของหน้าจอ
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        8.0), // ปรับค่านี้เพื่อทำให้มีโค้งน้อยลง
                    color: Colors.grey.shade200,
                  ),
                  child: Column(
                    children: [
                      const Text('BMI'),
                      Obx(() => Text(
                            getController_app.bmiResult.value
                                .toStringAsFixed(3),
                            style: TextStyle(fontSize: 70),
                          )),
                      Text(getController_app.conditionWeight()),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Image.asset(
                            getController_app.connditionimgWeight(),
                            width: 300,
                            height: 300),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
