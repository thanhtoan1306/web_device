import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum SimpleButtonColorMode { FILL, OUT_LINE }

class SimpleButtonWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final String? text;
  final EdgeInsets? padding;
  final Function()? onTap;
  final TextStyle? textStyle;
  final SimpleButtonColorMode mode;
  final double radius;
  final Color? primary;
  final Color? secondary;
  final Color? overlayColor;

  const SimpleButtonWidget(
      {Key? key,
      this.child,
      required this.onTap,
      this.textStyle =
          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      this.text,
      this.width,
      this.primary = const Color(0XFF3729A0),
      this.secondary = const Color(0XFF94A6D2),
      this.overlayColor = Colors.white,
      this.height = 50,
      this.radius = 16,
      this.padding = const EdgeInsets.symmetric(horizontal: 24),
      this.mode = SimpleButtonColorMode.FILL})
      : super(key: key);

  BoxDecoration _getBoxDecoration() {
    if (onTap == null) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: secondary,
      );
    }

    if (mode == SimpleButtonColorMode.FILL) {
      return BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(radius),
      );
    } else {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          width: 2,
          color: secondary ?? const Color(0XFF94A6D2),
        ),
      );
    }
  }

  Widget _renderChildWidget() {
    if (text != null && onTap == null) {
      return Text(text!, style: textStyle?.copyWith(color: Colors.white));
    }

    if (text != null) {
      return Text(text!,
          textAlign: TextAlign.center,
          style: textStyle?.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold));
    }
    return child!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: _getBoxDecoration(),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          overlayColor:
              MaterialStateProperty.all(overlayColor!.withOpacity(0.1)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onTap,
        child: Container(
          width: width,
          padding: padding!,
          alignment: Alignment.center,
          child: _renderChildWidget(),
        ),
      ),
    );
  }
}
