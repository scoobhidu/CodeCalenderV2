import 'package:flutter/material.dart';

import '../../../theme/app_style.dart';

class ContestDateDisplay extends StatelessWidget {
  ContestDateDisplay({
    required this.start,
    required this.dateSize,
    required this.monthSize
  });

  DateTime start;
  double dateSize;
  double monthSize;
  
  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Text(
           start.day.toString(),
           style: AppStyle.txtSoraRegularWhite16.copyWith(
             fontWeight: FontWeight.w600,
             fontSize: dateSize,
           )
         ),
         Text(
           changeToMonth(start.month),
           style: AppStyle.txtSoraRegularWhite12.copyWith(
             fontSize: monthSize
           )
         ),
       ],
     ), 
    );
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
}

class ContestImage extends StatelessWidget {
  ContestImage({required this.platform, required this.size});

  String platform;
  double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/logos/dark/$platform.png', width: size, height: size,),
    );
  }
}