import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/video_conference/bindings/video_conference_binding.dart';
import '../modules/video_conference/views/video_conference_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_CONFERENCE,
      page: () => const VideoConferenceView(),
      binding: VideoConferenceBinding(),
    ),
  ];
}
