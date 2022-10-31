import 'package:flutter/material.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/math_utils.dart';
import '../theme/app_style.dart';

class StatsBasicBox extends StatelessWidget {
  StatsBasicBox({
    required this.height,
    required this.width,
    required this.heading,
    required this.description,
    required this.headingColor,
    required this.descriptionColor,
  });

  late double height;
  late double width;

  late String heading;
  late String description;

  late Color headingColor;
  late Color descriptionColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: ColorConstant.whiteA700.withOpacity(0.1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              heading,
              textAlign: TextAlign.center,
              style: AppStyle.getTxtSoraMedium16(headingColor),
              softWrap: true,
            ),
            SizedBox(height: 10,),
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppStyle.getTxtSoraBold14(descriptionColor),
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
