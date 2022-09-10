import 'package:codecalenderv2/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.height,
      this.width,
      this.child,
      this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? height;

  double? width;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        constraints: BoxConstraints(
          minHeight: getSize(height ?? 0),
          minWidth: getSize(width ?? 0),
        ),
        padding: EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: getSize(width ?? 0),
          height: getSize(height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll16:
        return getPadding(
          all: 16,
        );
      case IconButtonPadding.PaddingAll9:
        return getPadding(
          all: 9,
        );
      default:
        return getPadding(
          all: 12,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.OutlineGray300cc:
        return ColorConstant.whiteA700;
      case IconButtonVariant.FillIndigo600:
        return ColorConstant.indigo600;
      case IconButtonVariant.OutlineRed700:
      case IconButtonVariant.OutlineGreen600:
        return null;
      default:
        return ColorConstant.gray101;
    }
  }

  _setBorder() {
    switch (variant) {
      case IconButtonVariant.OutlineRed700:
        return Border.all(
          color: ColorConstant.red700,
          width: getHorizontalSize(
            2.00,
          ),
        );
      case IconButtonVariant.OutlineGreen600:
        return Border.all(
          color: ColorConstant.green600,
          width: getHorizontalSize(
            2.00,
          ),
        );
      case IconButtonVariant.FillGray101:
      case IconButtonVariant.OutlineGray300cc:
      case IconButtonVariant.FillIndigo600:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.CircleBorder25:
        return BorderRadius.circular(
          getHorizontalSize(
            25.00,
          ),
        );
      case IconButtonShape.CircleBorder20:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
      case IconButtonShape.RoundedBorder17:
        return BorderRadius.circular(
          getHorizontalSize(
            17.50,
          ),
        );
      case IconButtonShape.RoundedBorder22:
        return BorderRadius.circular(
          getHorizontalSize(
            22.50,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            12.00,
          ),
        );
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case IconButtonVariant.OutlineGray300cc:
        return [
          BoxShadow(
            color: ColorConstant.gray300Cc,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              4,
              4,
            ),
          )
        ];
      case IconButtonVariant.FillGray101:
      case IconButtonVariant.OutlineRed700:
      case IconButtonVariant.OutlineGreen600:
      case IconButtonVariant.FillIndigo600:
        return null;
      default:
        return null;
    }
  }
}

enum IconButtonShape {
  RoundedBorder12,
  CircleBorder25,
  CircleBorder20,
  RoundedBorder17,
  RoundedBorder22,
}

enum IconButtonPadding {
  PaddingAll12,
  PaddingAll16,
  PaddingAll9,
}

enum IconButtonVariant {
  FillGray101,
  OutlineGray300cc,
  OutlineRed700,
  OutlineGreen600,
  FillIndigo600,
}
