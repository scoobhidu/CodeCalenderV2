import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/math_utils.dart';
import '../../../widgets/StatsBasicBox.dart';


class InterviewBitStats extends StatelessWidget {
  InterviewBitStats({required this.data});

  dynamic data;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Expanded(
          flex: 6,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatsBasicBox(
                      height: size.height * 0.15,
                      width: size.width * 0.32,
                      heading: "Rank",
                      description: data['rank'].toString(),
                      headingColor: ColorConstant.InterviewBit,
                      descriptionColor: ColorConstant.InterviewBit.withOpacity(0.6),
                    ),
                    StatsBasicBox(
                      height: size.height * 0.15,
                      width: size.width * 0.32,
                      heading: "Score",
                      description: data['score'].toString(),
                      headingColor: ColorConstant.InterviewBit,
                      descriptionColor: ColorConstant.InterviewBit.withOpacity(0.6),
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                StatsBasicBox(
                  height: size.height * 0.15,
                  width: size.width * 0.32,
                  heading: "Score",
                  description: data['streak'],
                  headingColor: ColorConstant.InterviewBit,
                  descriptionColor: ColorConstant.InterviewBit.withOpacity(0.6),
                ),
              ],
            ),
          ),
        )
    );
  }
}
