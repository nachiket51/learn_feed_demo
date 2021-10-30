import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learn_feed_demo/models/learn_content.dart';
import 'package:learn_feed_demo/utils/color_config.dart';
import 'package:learn_feed_demo/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class LearnContentTile extends StatelessWidget {
  final Learn_content learnContent;
  final Function onBookMarkClick;
  final Function onLikedClick;
  final Function onDislikedMarkClick;

  const LearnContentTile(
      {Key? key,
      required this.learnContent,
      required this.onBookMarkClick,
      required this.onLikedClick,
      required this.onDislikedMarkClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(learnContent.createdAt!);
    String formattedDate = DateFormat('MMMM dd, yyyy').format(dateTime);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          child: SizedBox(
            height: 15.h,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Colors.black,
                            height: 9.h,
                            width: 9.h,
                            child: Image.network(
                              learnContent.thumbnailUrl!,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/images/article-icon.png',
                                  height: 1.5.h,
                                  width: 1.5.h,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                TextWidget(
                                  text: 'Article $formattedDate',
                                  textStyle: TextStyle(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff76939e),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 0.3.h),
                            TextWidget(
                              text: learnContent.title ?? '',
                              textStyle: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff76939e),
                              ),
                              maxWidth: 60.w,
                              maxLines: 1,
                            ),
                            SizedBox(height: 0.3.h),
                            TextWidget(
                              text: learnContent.description ?? '',
                              textStyle: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff76939e),
                              ),
                              maxWidth: 60.w,
                              maxLines: 2,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 1.h),
                    TextWidget(
                      text: 'Shared by OnLoop',
                      textStyle: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff76939e),
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: ColorConfig.getTagColor(
                                learnContent.tags![0].color!)
                            .withOpacity(0.2),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 0.3.h),
                          child: TextWidget(
                            text: learnContent.tags![0].name!,
                            textStyle: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w700,
                              color: ColorConfig.getTagColor(
                                  learnContent.tags![0].color!),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      onBookMarkClick();
                    },
                    child: learnContent.isBookMark
                        ? Image.asset(
                            'assets/images/save-grey-icon.png',
                            height: 3.h,
                            width: 3.h,
                          )
                        : Image.asset(
                            'assets/images/save-white-icon.png',
                            height: 3.h,
                            width: 3.h,
                          ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          onDislikedMarkClick();
                        },
                        child: Image.asset(
                          'assets/images/thumbs-down.png',
                          height: 4.h,
                          width: 4.h,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          onLikedClick();
                        },
                        child: Image.asset(
                          'assets/images/thumbs-up.png',
                          height: 4.h,
                          width: 4.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
