import 'dart:developer';

import 'package:get/get.dart';
import 'package:keep/model/notes.dart';

/// Author : Mohammad
/// 12/10/2021
/// project : keep-clone
///
class NoteController extends GetxController {
  RxList<Note> myNotes = List<Note>.empty().obs;
  RxBool hasMore = true.obs;

  static NoteController get to => Get.find();

  void loadMoreNote() async {
    log("loading more notes");
    if (hasMore.isTrue) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        notes.shuffle();
        myNotes.addAll(notes);
        log("loading more notes complete");
      });
    }
  }
}
