import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:video_conference/app/modules/video_conference/views/video_conference_page.dart';

import '../controllers/video_conference_controller.dart';

class VideoConferenceArgs {
  final Room room;
  final EventsListener<RoomEvent> listener;

  VideoConferenceArgs({
    required this.room,
    required this.listener,
  });
}

class VideoConferenceView extends StatelessWidget {
  const VideoConferenceView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoConferenceController>(
      builder: (controller) {
        final room = controller.args.room;
        final listener = controller.args.listener;

        return VideoConferencePage(
          room: room,
          listener: listener,
        );
      },
    );
  }
}
