import 'package:flutter/material.dart';
import 'package:learn_feed_demo/providers/learn_feed_provider.dart';
import 'package:learn_feed_demo/widgets/chip.dart';
import 'package:learn_feed_demo/widgets/learn_content.dart';
import 'package:learn_feed_demo/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LearnFeedScreen extends StatelessWidget {
  const LearnFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LearnFeedProvider>(
        builder: (context, learnFeedProvider, _) {
      if (!learnFeedProvider.dataLoaded) {
        learnFeedProvider.loadProcess();
      }
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          centerTitle: true,
          title: TextWidget(
            text: 'Learn',
            textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff76939e),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Container(
                color: const Color(0xfff6fafd),
                height: 5.h,
                width: 5.h,
                child: Center(
                  child: Image.asset(
                    'assets/images/save-white-icon.png',
                    height: 2.h,
                    width: 2.h,
                  ),
                ),
              ),
            ),

          ],
        ),
        body: SafeArea(
          child: learnFeedProvider.isScreenLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  height: 100.h,
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: List.generate(
                          learnFeedProvider.getTagList().length,
                          (index) => ChipTile(
                            tag: learnFeedProvider.getTagList()[index],
                            isSelected: learnFeedProvider.selectedTag == index
                                ? true
                                : false,
                            onTagSelected: () {
                              learnFeedProvider.changeSelectedTag(index);
                              learnFeedProvider.currentTag =
                                  learnFeedProvider.getTagList()[index];
                              learnFeedProvider.getLearnFeedList();
                              learnFeedProvider.refreshUI();
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Expanded(
                        child: SizedBox(
                          child: learnFeedProvider.getLearnFeedList().isNotEmpty
                              ? ListView.separated(
                                  itemCount: learnFeedProvider
                                      .getLearnFeedList()
                                      .length,
                                  itemBuilder: (context, index) =>
                                      LearnContentTile(
                                    learnContent: learnFeedProvider
                                        .getLearnFeedList()[index],
                                    onLikedClick: () {},
                                    onDislikedMarkClick: () {},
                                    onBookMarkClick: () {
                                      learnFeedProvider
                                              .getLearnFeedList()[index]
                                              .isBookMark =
                                          !learnFeedProvider
                                              .getLearnFeedList()[index]
                                              .isBookMark;
                                      learnFeedProvider.refreshUI();
                                    },
                                  ),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 1.h),
                                )
                              : Center(
                                  child: TextWidget(
                                    text:
                                        'No Data available in ${learnFeedProvider.currentTag.name}',
                                    textStyle: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff76939e),
                                    ),
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
