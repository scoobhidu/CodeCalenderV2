import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/math_utils.dart';
import '../../../widgets/StatsBasicBox.dart';


class CodechefStats extends StatelessWidget {
  CodechefStats({required this.data});

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
                      heading: "Rating",
                      description: (data['rating'] ?? '').toString(),
                      headingColor: ColorConstant.CodeChef,
                      descriptionColor: ColorConstant.CodeChef.withOpacity(0.6),
                    ),
                    StatsBasicBox(
                      height: size.height * 0.15,
                      width: size.width * 0.32,
                      heading: "Max Rating",
                      description: (data['highest_rating'] ?? '').toString(),
                      headingColor: ColorConstant.CodeChef,
                      descriptionColor: ColorConstant.CodeChef.withOpacity(0.6),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StatsBasicBox(
                      height: size.height * 0.15,
                      width: size.width * 0.32,
                      heading: "Star(s)",
                      description: (data['stars'] ?? '').toString(),
                      headingColor: ColorConstant.CodeChef,
                      descriptionColor: ColorConstant.CodeChef.withOpacity(0.6),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatsBasicBox(
                      height: size.height * 0.15,
                      width: size.width * 0.32,
                      heading: "Global Rank",
                      description: (data['global_rank'] ?? '').toString(),
                      headingColor: ColorConstant.CodeChef,
                      descriptionColor: ColorConstant.CodeChef.withOpacity(0.6),
                    ),
                    StatsBasicBox(
                      height: size.height * 0.15,
                      width: size.width * 0.32,
                      heading: "National Rank",
                      description: (data['country_rank'] ?? '').toString(),
                      headingColor: ColorConstant.CodeChef,
                      descriptionColor: ColorConstant.CodeChef.withOpacity(0.6),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatsBasicBox(
                      height: size.height * 0.15,
                      width: size.width * 0.32,
                      heading: "Avg Rating",
                      description: (data['avg_rating'] ?? '0').toStringAsFixed(0),
                      headingColor: ColorConstant.CodeChef,
                      descriptionColor: ColorConstant.CodeChef.withOpacity(0.6),

                    ),
                    StatsBasicBox(
                      height: size.height * 0.15,
                      width: size.width * 0.32,
                      heading: "Avg Rank",
                      description: (data['avg_rank'] ?? '0').toStringAsFixed(0),
                      headingColor: ColorConstant.CodeChef,
                      descriptionColor: ColorConstant.CodeChef.withOpacity(0.6),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
