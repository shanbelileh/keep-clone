

import 'package:get/get.dart';
import 'package:keep/screens/home/note_controller.dart';

import 'screens/home/home_controller.dart';

/// Author : Mohammad
/// 12/10/2021
/// project : keep-clone
///
class AppBindings extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<NoteController>(() => NoteController());
  }

}