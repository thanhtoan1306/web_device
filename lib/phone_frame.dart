import 'package:flutter/material.dart';

enum DeviceType { ios, android }

class PhoneFrame extends StatefulWidget {
  final DeviceType model;
  final double phoneWidth;
  final Widget child;
  final Color background;
  const PhoneFrame({
    Key? key,
    required this.model,
    required this.phoneWidth,
    required this.child,
    this.background = Colors.grey,
  }) : super(key: key);

  @override
  State<PhoneFrame> createState() => _PhoneFrameState();
}

class _PhoneFrameState extends State<PhoneFrame> {
  double standardWidth = 350;
  double standardHeight = 700;
  double get scale => standardWidth / standardHeight;

  double scaleBySize(int value) {
    return (widget.phoneWidth * value) / standardWidth;
  }

  String _getModel() {
    switch (widget.model) {
      case DeviceType.ios:
        return 'assets/ios_frame.png';
      case DeviceType.android:
        return 'assets/android_frame.png';
      default:
        return '';
    }
  }

  double _getHeight() {
    switch (widget.model) {
      case DeviceType.ios:
        return widget.phoneWidth / scale;
      case DeviceType.android:
        return widget.phoneWidth / scale;
      default:
        return 0;
    }
  }

  Widget _renderChild() {
    switch (widget.model) {
      case DeviceType.ios:
        return Container(
            margin: EdgeInsets.all(scaleBySize(13)),
            padding: EdgeInsets.fromLTRB(scaleBySize(4), scaleBySize(32),
                scaleBySize(4), scaleBySize(4)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(scaleBySize(35)),
                color: widget.background),
            child: widget.child);
      case DeviceType.android:
        return Container(
            margin: EdgeInsets.all(scaleBySize(18)),
            padding: EdgeInsets.fromLTRB(scaleBySize(11), scaleBySize(50),
                scaleBySize(11), scaleBySize(11)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(scaleBySize(35)),
                color: widget.background),
            child: widget.child);
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.phoneWidth,
      height: _getHeight(),
      foregroundDecoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage(_getModel()), fit: BoxFit.fill),
      ),
      child: _renderChild(),
    );
  }
}
