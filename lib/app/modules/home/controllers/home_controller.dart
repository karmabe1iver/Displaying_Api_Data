import 'package:apitest_jsonplaceholder/app/data/services/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/api_model.dart';

class HomeController extends GetxController {
  List<Welcome>? Data= <Welcome>[].obs;
  RxBool isload=false.obs;
  @override
  void onInit() {
    super.onInit();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,));
    getData();
  }
  getData() async{

    Data= (await RemoteServices().getPost());
    if(Data != null)
      isload.value=true;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
