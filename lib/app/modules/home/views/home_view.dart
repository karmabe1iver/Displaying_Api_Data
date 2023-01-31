import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
   HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Api learning'),
          centerTitle: true,
        ),
        body: Obx(
          ()=>
          Visibility(
            visible:controller.isload.value,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
      overscroll.disallowIndicator();
      return true;},
                child:
            RefreshIndicator(
              onRefresh: ()async{
                await Future.delayed(Duration(milliseconds: 900));
              },
              child: ListView.builder(
                  itemCount: controller.Data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child:Text(
                                      controller.Data![index].title ?? '',
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 24, fontWeight: FontWeight.bold),
                                    ),

                                ),
                                Container(
                                  child:  Text(
                                      controller.Data![index].body ?? '',
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w300),
                                    ),

                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),),
            replacement: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ));
  }
}
