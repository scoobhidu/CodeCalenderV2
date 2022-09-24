import 'package:codecalenderv2/core/app_export.dart';
import 'package:codecalenderv2/presentation/mainContestView_Screen/widgets/ButtonDetailWidgets.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/math_utils.dart';
import '../data/models/ContestsModel/ContestsModel.dart';
import '../theme/app_style.dart';
import 'custom_button.dart';

class CustomBottomsheet extends StatelessWidget {
  Contests contest;

  CustomBottomsheet({
    required this.contest
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.7,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.mirror,
            stops: [0, 2],
            colors: [
              ColorConstant.bluegray801,
              ColorConstant.black100
            ],
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width * 0.65,
                  child: Text(
                    contest.name!.toString(),
                    softWrap: true,
                    style: AppStyle.txtSoraBold14.copyWith(
                      color: ColorConstant.whiteA700,
                      fontSize: 18,
                    ),
                    maxLines: 2,
                  ),
                ),
                Container(
                  width: size.width * 0.15,
                  child: ContestImage(
                      platform: contest.site!,
                      size: 48
                  )
                )
              ],
            ), // title and logo
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        DateTime.parse(contest.startTime!).day.toString(),
                        style: AppStyle.txtSoraRegularWhite16.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                          changeToMonth(DateTime.parse(contest.startTime!).month),
                          style: AppStyle.txtSoraRegularWhite12.copyWith(
                              fontSize: 14
                          )
                      ),
                    ),
                  ],
                ),

                changeIntToDay(DateTime.parse(contest.startTime!).weekday).toString()
                    != changeIntToDay(DateTime.parse(contest.endTime!).weekday).toString() ?
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          changeIntToDay(DateTime.parse(contest.startTime!).weekday).toString(),
                          style: AppStyle.txtSoraBoldGray1341.copyWith(
                            fontSize: 15
                          ),
                        ),
                        Text(
                          " ${FormatHrWithAZero(DateTime.parse(contest.startTime!).hour)}:"
                          "${FormatMinWithAZero(DateTime.parse(contest.startTime!).minute)} "
                          "${AMorPM(DateTime.parse(contest.startTime!))} to ",
                          style: AppStyle.txtSoraBoldGray1341.copyWith(
                            fontSize: 15
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          changeIntToDay(DateTime.parse(contest.endTime!).weekday).toString(),
                          style: AppStyle.txtSoraBoldGray1341.copyWith(
                              fontSize: 15
                          ),
                        ),
                        Text(
                          " ${FormatHrWithAZero(DateTime.parse(contest.endTime!).hour)}:"
                              "${FormatMinWithAZero(DateTime.parse(contest.endTime!).minute)} "
                              "${AMorPM(DateTime.parse(contest.endTime!))}",
                          style: AppStyle.txtSoraBoldGray1341.copyWith(
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                  ],
                ) :
                Row(
                  children: [
                    Text(
                      changeIntToDay(DateTime.parse(contest.startTime!).weekday).toString(),
                      style: AppStyle.txtSoraBoldGray1341.copyWith(
                          fontSize: 15
                      ),
                    ),
                    Text(
                      " ${FormatHrWithAZero(DateTime.parse(contest.startTime!).hour)}:"
                          "${FormatMinWithAZero(DateTime.parse(contest.startTime!).minute)} "
                          "${AMorPM(DateTime.parse(contest.startTime!))} to ",
                      style: AppStyle.txtSoraBoldGray1341.copyWith(
                          fontSize: 15
                      ),
                    ),
                    Text(
                      "${FormatHrWithAZero(DateTime.parse(contest.endTime!).hour)}:"
                          "${FormatMinWithAZero(DateTime.parse(contest.endTime!).minute)} "
                          "${AMorPM(DateTime.parse(contest.endTime!))}",
                      style: AppStyle.txtSoraBoldGray1341.copyWith(
                          fontSize: 15
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: size.height * 0.07,
                    width: size.width,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                      focusNode: FocusNode(),
                      onPressed: RegisterWebView,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        textStyle: MaterialStateProperty.all(
                          TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        backgroundColor: MaterialStateProperty.all(ColorConstant.whiteA700.withOpacity(0.15)),
                        shadowColor: MaterialStateProperty.all(ColorConstant.black100),
                        elevation: MaterialStateProperty.all(25),
                      ),
                      child: Text('Register'),
                    )),

                Container(
                    height: size.height * 0.07,
                    width: size.width,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                      focusNode: FocusNode(),
                      onPressed: (){},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        textStyle: MaterialStateProperty.all(
                          TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        backgroundColor: MaterialStateProperty.all(ColorConstant.whiteA700.withOpacity(0.15)),
                        shadowColor: MaterialStateProperty.all(ColorConstant.black100),
                        elevation: MaterialStateProperty.all(25),
                      ),
                      child: Text('Schedule Calender Event'),
                    )),

                Container(
                    height: size.height * 0.07,
                    width: size.width,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                      focusNode: FocusNode(),
                      onPressed: (){},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        textStyle: MaterialStateProperty.all(
                          TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        backgroundColor: MaterialStateProperty.all(ColorConstant.whiteA700.withOpacity(0.15)),
                        shadowColor: MaterialStateProperty.all(ColorConstant.black100),
                        elevation: MaterialStateProperty.all(25),
                      ),
                      child: Text('Push Notification'),
                    )),
              ],
            )
            // webview button + redirect when registered with a flag if possible
            // create schedule button
            // create notification
            // note that notification will be 5 minutes or 10 minutes prior to contest
          ],
        ),
      ),
    );
  }

  RegisterWebView(){
    Get.toNamed(AppRoutes.webViewScreen, arguments: [contest.url]);
  }

  AMorPM(DateTime time){
    if(time.hour >= 12){
      return "PM";
    } else {
      return "AM";
    }
  }

  FormatHrWithAZero(int time){
    if(time < 10){
      return '0' + time.toString();
    } else if(time > 13){
      time = time % 12;
      return time.toString();
    } else {
      return time.toString();
    }
  }
  FormatMinWithAZero(int time){
    if(time < 10){
      return '0' + time.toString();
    } else{
      return time.toString();
    }
  }

  changeToMonth(int month){
    switch(month){
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
    }
  }

  changeIntToDay(int day){
    switch(day){
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
    }
  }
}

//Usage Instruction for Custom Bottomsheet

// Get.bottomSheet(
//   CustomBottomsheet(
      // required parameters
//   ),
// );