import 'package:notepad/src/controller/note_controller.dart';
import 'package:notepad/src/controller/states_controller.dart';
import 'package:notepad/src/services/api.dart';
import 'package:get/instance_manager.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.put(Api());
    Get.put(MyStates());
    Get.lazyPut(() => NoteController());
  }
}
