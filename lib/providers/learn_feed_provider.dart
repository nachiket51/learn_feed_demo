import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:learn_feed_demo/models/learn_content.dart' as content;
import 'package:learn_feed_demo/models/tags.dart';
import 'package:dio/dio.dart' as dio;
import 'package:learn_feed_demo/utils/keys.dart';

class LearnFeedProvider extends ChangeNotifier {
  bool isScreenLoading = true;
  int loadingCount = 0;
  bool dataLoaded = false;
  Tags tags = Tags();
  content.LearnContent learnContent = content.LearnContent();

  int selectedTag = 0;

  Tag currentTag = Tag(name: 'All', color: 'white');

  Future<void> loadProcess() async {
    await getTagsFromApi();
    await getLearnFeedContent();
    changeProgressIndicator();
    dataLoaded = true;
  }

  changeSelectedTag(int value) {
    selectedTag = value;
  }

  Future<Tags> getTagsFromApi() async {
    dio.Response response = await dio.Dio().getUri(
        Uri.https(
          PrimaryKeys.baseUrl,
          PrimaryKeys.tagsEndPoint,
        ), onReceiveProgress: (progress, total) {
      loadingCount = progress;
      print(total);
    });
    if (response.statusCode == 200) {
      tags = Tags.fromJson(response.data);
      return tags;
    }
    throw response.statusCode!;
  }

  Future<content.LearnContent> getLearnFeedContent() async {
    dio.Response response = await dio.Dio().getUri(
        Uri.https(
          PrimaryKeys.baseUrl,
          PrimaryKeys.contentEndPoint,
        ), onReceiveProgress: (progress, total) {
      loadingCount = progress;
      print(total);
    });
    if (response.statusCode == 200) {
      learnContent = content.LearnContent.fromJson(response.data);
      return learnContent;
    }
    throw response.statusCode!;
  }

  List<Tag> getTagList() {
    List<Tag> resultList = [];
    resultList.add(Tag(name: 'All', color: 'white'));
    for (var kTag in tags.tag!) {
      resultList.add(kTag);
    }
    return resultList;
  }

  List<content.Learn_content> getLearnFeedList() {
    List<content.Learn_content> resultList = [];
    if (currentTag.name == 'All') {
      resultList.addAll(learnContent.learnContent!);
    } else {
      for (var content in learnContent.learnContent!) {
        if (content.tags![0].name == currentTag.name) {
          resultList.add(content);
        }
      }
    }
    return resultList;
  }

  changeProgressIndicator() {
    isScreenLoading = false;
    notifyListeners();
  }

  refreshUI() {
    notifyListeners();
  }
}
