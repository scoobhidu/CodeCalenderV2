import 'package:codecalenderv2/core/app_export.dart';
import 'package:codecalenderv2/presentation/mainContestView_Screen/widgets/ButtonDetailWidgets.dart';
import 'package:codecalenderv2/theme/app_style.dart';
import 'package:codecalenderv2/widgets/custom_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/utils/color_constant.dart';


import '../../../core/utils/math_utils.dart';
import '../../../data/models/ContestsModel/ContestsModel.dart';
import '../../../theme/app_decoration.dart';

class ContestButton extends StatelessWidget {
  ContestButton({required this.contest});

  Contests contest;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTap: (){
            Get.bottomSheet(
              CustomBottomsheet(contest: contest)
            );
          },
          child: Container(
            height: size.height * 0.2,
            width: size.width * 0.4,
            margin: EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              color: ColorConstant.whiteA700.withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ContestDateDisplay(
                        start: DateTime.parse(contest.startTime!),
                        dateSize: 16,
                        monthSize: 12,
                      ),
                      ContestImage(platform: contest.site!, size: 30,),
                    ],
                  ),
                  Text(
                    contest.name!.length < 30 ?
                    contest.name! :
                    contest.name!.substring(0, 30) + '...',
                    style: AppStyle.txtSoraMediumWhite14,
                    softWrap: true,
                    maxLines: 3,
                    ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
