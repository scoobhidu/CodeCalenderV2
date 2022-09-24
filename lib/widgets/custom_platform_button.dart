import 'package:codecalenderv2/core/app_export.dart';
import 'package:codecalenderv2/presentation/mainContestView_Screen/widgets/ButtonDetailWidgets.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/color_constant.dart';


import '../../../core/utils/math_utils.dart';
import '../../../data/models/ContestsModel/ContestsModel.dart';

class PlatformButton extends StatelessWidget {
  PlatformButton({required this.site, required this.controller});

  String site;
  Rx<bool> controller;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTap: (){
            controller.value = !controller.value;
            print("Tapped");
          },
          child: Container(
            height: size.height * 0.075,
            width: size.width * 0.15,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: controller.value? ColorConstant.whiteA700 : ColorConstant.whiteA700.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: ContestImage(platform: site, size: 25,),
            )
          ),
        )
    );
  }
}