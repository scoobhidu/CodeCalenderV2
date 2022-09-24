import 'package:flutter/material.dart';
import '../core/utils/color_constant.dart';

import '../core/utils/math_utils.dart';

class NewCustomButton extends StatelessWidget {
  NewCustomButton({
    required this.onTap
  });

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: size.height * 0.07,
          width: size.width,
          child: ElevatedButton(
            focusNode: FocusNode(),
            onPressed: onTap,
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
              backgroundColor:
                  MaterialStateProperty.all(ColorConstant.black500),
              shadowColor: MaterialStateProperty.all(ColorConstant.black100),
              elevation: MaterialStateProperty.all(25),
            ),
            child: Text('Login with Google'),
          )),
    );
  }
}
