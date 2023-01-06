import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class Controller extends GetxController {
  var name = Rx<String?>(null);
  changeName(newName) => name.value = newName;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Page1(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Page1 extends StatelessWidget {
  final get = Get.put(Controller());
  Page1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Motionlab Task W4"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(get.name.value ?? "")),
            Container(
              child: ElevatedButton(
                  child: Text("Halaman Selanjutnya"),
                  onPressed: () {
                    Get.to(() => Page2())?.then((value) {
                      get.changeName(value);
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Motionlab Task W4"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " ",
              textScaleFactor: 2,
            ),
            Container(
              child: ElevatedButton(
                  child: Text("Halaman Sebelumnya"),
                  onPressed: () => Get.back(result: "Wildan Syukri Ni'am")),
            ),
          ],
        ),
      ),
    );
  }
}
