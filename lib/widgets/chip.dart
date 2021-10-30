import 'package:flutter/material.dart';
import 'package:learn_feed_demo/models/tags.dart';
import 'package:learn_feed_demo/utils/color_config.dart';
import 'package:learn_feed_demo/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class ChipTile extends StatelessWidget {
  final Tag tag;
  final bool? isSelected;
  final Function onTagSelected;

  const ChipTile(
      {Key? key,
      required this.tag,
      this.isSelected = false,
      required this.onTagSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTagSelected();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.5.h),
        child: Container(
          decoration: BoxDecoration(
            color: ColorConfig.getTagColor(tag.color!).withOpacity(0.1),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: tag.color == 'white'
                    ? Colors.black
                    : ColorConfig.getTagColor(tag.color!).withOpacity(0.2)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.4.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                isSelected!
                    ? Icon(
                        Icons.check,
                        size: 10.sp,
                      )
                    : const SizedBox(),
                isSelected! ?  SizedBox(width: 2.w): const SizedBox(),
                TextWidget(
                  text: tag.name!,
                  textStyle: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700,
                    color: tag.color == 'white'
                        ? Colors.black
                        : ColorConfig.getTagColor(tag.color!),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    /*ChoiceChip(
      labelStyle: TextStyle(
        fontSize: 8.sp,
        fontWeight: FontWeight.bold,
        color: tag.color == 'white'
            ? Colors.black
            : ColorConfig.getTagColor(tag.color!),
      ),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      label: Text(
        tag.name ?? '',
      ),
      padding: EdgeInsets.zero,
      selected: isSelected!,
      side: BorderSide(
          color: tag.color == 'white'
              ? Colors.black
              : ColorConfig.getTagColor(tag.color!)),
      backgroundColor: ColorConfig.getTagColor(tag.color!).withOpacity(0.2),
      selectedColor: ColorConfig.getTagColor(tag.color!).withOpacity(0.2),
      disabledColor: ColorConfig.getTagColor(tag.color!).withOpacity(0.2),
      avatar: isSelected!
          ? Icon(
              Icons.check,
              size: 10.sp,
            )
          : const SizedBox(),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      onSelected: (value) {
        onTagSelected(value);
      },
    );*/
  }
}
