import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/math_utils.dart';
import '../../../widgets/StatsBasicBox.dart';


class CodeforcesStats extends StatelessWidget {
  CodeforcesStats({required this.data});

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
                      headingColor: ColorConstant.CodeForces,
                      descriptionColor: ColorConstant.CodeForces.withOpacity(0.6),
                    ),
                    StatsBasicBox(
                      height: size.height * 0.15,
                      width: size.width * 0.32,
                      heading: "Max Rating",
                      description: (data['max rating'] ?? '').toString(),
                      headingColor: ColorConstant.CodeForces,
                      descriptionColor: ColorConstant.CodeForces.withOpacity(0.6),
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
                      heading: "Rank",
                      description: (data['rank'] ?? '').toString(),
                      headingColor: ColorConstant.CodeForces,
                      descriptionColor: ColorConstant.CodeForces.withOpacity(0.6),
                    ),
                    StatsBasicBox(
                      height: size.height * 0.15,
                      width: size.width * 0.32,
                      heading: "Max Rank",
                      description: data['max rank'],
                      headingColor: ColorConstant.CodeForces,
                      descriptionColor: ColorConstant.CodeForces.withOpacity(0.6),
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
                      heading: "Avg Rating Change",
                      description: (data['avg_rating_change'] ?? '0').toStringAsFixed(0),
                      headingColor: ColorConstant.CodeForces,
                      descriptionColor: ColorConstant.CodeForces.withOpacity(0.6),
                      emoji: (data['avg_rating_change'] ?? 0) < 0 ?
                        Icon(Icons.arrow_drop_down_outlined, color: Colors.red,) :
                        (data['avg_rating_change'] ?? 0) > 0 ? Icon(Icons.arrow_drop_up_outlined, color: Colors.green,) : null,
                    ),
                    StatsBasicBox(
                      height: size.height * 0.15,
                      width: size.width * 0.32,
                      heading: "Avg Solved in Contest",
                      description: (data['avg_solved_in_contest'] ?? '0').toStringAsFixed(0),
                      headingColor: ColorConstant.CodeForces,
                      descriptionColor: ColorConstant.CodeForces.withOpacity(0.6),
                      emoji: (data['avg_solved_in_contest'] ?? 0) < 0 ?
                        Icon(Icons.arrow_drop_down_outlined, color: Colors.red,) :
                        (data['avg_solved_in_contest'] ?? 0) > 0 ? Icon(Icons.arrow_drop_up_outlined, color: Colors.green,) : null,
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
