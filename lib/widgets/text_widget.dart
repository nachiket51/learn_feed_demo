import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final int? maxLines;
  final double? maxWidth;
  final double? maxHeight;
  final TextAlign? textAlign;

  const TextWidget(
      {Key? key,
      required this.text,
      this.textStyle,
      this.maxLines = 1, // default maxLines is 1
      this.textAlign,
      this.maxWidth,
      this.maxHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// text could be extend its Width and Height till reach device screen size
    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? 100.w,
        maxHeight: maxHeight ?? 100.h,
      ),
      child: Text(
        text,
        style: textStyle,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
      ),
    );
  }
}
