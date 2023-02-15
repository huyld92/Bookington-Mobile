import 'package:flutter/material.dart';
import 'package:bookington_v2_2/core/app_export.dart';

// ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.shape,
        this.padding,
        this.variant,
        this.alignment,
        this.margin,
        this.width,
        this.height,
        this.child,
        this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? width;

  double? height;

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
        iconSize: getSize(height ?? 0),
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
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll6:
        return getPadding(
          all: 6,
        );
      case IconButtonPadding.PaddingAll16:
        return getPadding(
          all: 16,
        );
      default:
        return getPadding(
          all: 10,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.OutlineGray300:
        return ColorConstant.whiteA700;
      case IconButtonVariant.OutlineGray50:
        return ColorConstant.blue500;
      case IconButtonVariant.FillBlue500:
        return ColorConstant.blue500;
      case IconButtonVariant.OutlineBluegray50:
        return ColorConstant.gray50;
      case IconButtonVariant.OutlineBluegray50_1:
        return ColorConstant.blue500;
      case IconButtonVariant.OutlineBluegray50_2:
        return ColorConstant.whiteA700;
      default:
        return ColorConstant.blueGray50;
    }
  }

  _setBorder() {
    switch (variant) {
      case IconButtonVariant.OutlineGray300:
        return Border.all(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case IconButtonVariant.OutlineGray50:
        return Border.all(
          color: ColorConstant.gray50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case IconButtonVariant.OutlineBluegray50:
        return Border.all(
          color: ColorConstant.blueGray50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case IconButtonVariant.OutlineBluegray50_1:
        return Border.all(
          color: ColorConstant.blueGray50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case IconButtonVariant.OutlineBluegray50_2:
        return Border.all(
          color: ColorConstant.blueGray50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case IconButtonVariant.FillBluegray50:
      case IconButtonVariant.FillBlue500:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.CircleBorder12:
        return BorderRadius.circular(
          getHorizontalSize(
            12.00,
          ),
        );
      case IconButtonShape.RoundedBorder5:
        return BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
    }
  }
}

enum IconButtonShape {
  CircleBorder12,
  CircleBorder20,
  RoundedBorder5,
}

enum IconButtonPadding {
  PaddingAll10,
  PaddingAll6,
  PaddingAll16,
}

enum IconButtonVariant {
  FillBluegray50,
  OutlineGray300,
  OutlineGray50,
  FillBlue500,
  OutlineBluegray50,
  OutlineBluegray50_1,
  OutlineBluegray50_2,
}
