import 'package:get/get.dart';

import '../controllers/video_conference_controller.dart';

class VideoConferenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoConferenceController>(
      () => VideoConferenceController(),
    );
  }
}
