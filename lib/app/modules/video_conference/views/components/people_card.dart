import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:video_conference/app/modules/video_conference/controllers/video_conference_controller.dart';
import 'package:video_conference/app/modules/video_conference/views/video_conference_page.dart';
import 'package:video_conference/utils/index.dart';

class PeopleImageCard extends StatefulWidget {
  final String urlProfile;
  final bool isWaiting, isMultipleParticipant;

  final LocalParticipant participant;
  final ParticipantTrackType type;

  const PeopleImageCard(
    this.participant,
    this.type, {
    super.key,
    required this.urlProfile,
    this.isWaiting = false,
    this.isMultipleParticipant = false,
  });

  @override
  State<PeopleImageCard> createState() => _PeopleImageCardState();
}

class _PeopleImageCardState extends State<PeopleImageCard> {
  TrackPublication<VideoTrack>? get videoPublication =>
      widget.participant.videoTrackPublications
          .where((element) => element.source == widget.type.lkVideoSourceType)
          .firstOrNull;
  TrackPublication<AudioTrack>? get audioPublication =>
      widget.participant.audioTrackPublications
          .where((element) => element.source == widget.type.lkAudioSourceType)
          .firstOrNull;

  VideoTrack? get activeVideoTrack => videoPublication?.track;
  AudioTrack? get activeAudioTrack => audioPublication?.track;

  bool get isScreenShare => widget.type == ParticipantTrackType.kScreenShare;
  EventsListener<ParticipantEvent>? _listener;

  @override
  void initState() {
    super.initState();
    _listener = widget.participant.createListener();
    _listener?.on<TranscriptionEvent>((e) {
      for (var seg in e.segments) {
        print('Transcription: ${seg.text} ${seg.isFinal}');
      }
    });

    widget.participant.addListener(_onParticipantChanged);
    _onParticipantChanged();
  }

  @override
  void dispose() {
    widget.participant.removeListener(_onParticipantChanged);
    _listener?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PeopleImageCard oldWidget) {
    oldWidget.participant.removeListener(_onParticipantChanged);
    widget.participant.addListener(_onParticipantChanged);
    _onParticipantChanged();
    super.didUpdateWidget(oldWidget);
  }

  // Notify Flutter that UI re-build is required, but we don't set anything here
  // since the updated values are computed properties.
  void _onParticipantChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final imageBorderRadius = BorderRadius.circular(50);

    String userName = widget.participant.identity;
    if (userName == "") {
      userName = "You";
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxImageHeight = widget.isMultipleParticipant ? 150 : 300;
        final double maxHeight = constraints.maxHeight < maxImageHeight
            ? constraints.maxHeight
            : maxImageHeight;

        final imageHeight = maxHeight * 0.7;
        final imageWidth = maxHeight * 0.5;
        return SizedBox(
          width: widget.isMultipleParticipant ? imageWidth : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.isMultipleParticipant
                ? [
                    Flexible(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: imageBorderRadius,
                            child: activeVideoTrack != null &&
                                    !activeVideoTrack!.muted
                                ? Flexible(
                                    child: SizedBox(
                                      height: imageHeight,
                                      width: imageWidth,
                                      child: VideoTrackRenderer(
                                        activeVideoTrack!,
                                        fit: RTCVideoViewObjectFit
                                            .RTCVideoViewObjectFitCover,
                                      ),
                                    ),
                                  )
                                : Image.network(
                                    widget.urlProfile,
                                    fit: BoxFit.cover,
                                    height: imageHeight,
                                    width: imageWidth,
                                  ),
                          ),
                          widget.isWaiting
                              ? Positioned(
                                  top: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: imageBorderRadius,
                                      color: Colors.grey.withOpacity(0.6),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          widget.isWaiting
                              ? Text(
                                  "Waiting ..",
                                  textAlign: TextAlign.center,
                                  style: MyRegularText.body1
                                      .copyWith(color: Colors.black),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    const SizedBox(height: Spacing.large),
                    Text(
                      userName,
                      style: MyBoldText.body1,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]
                : [
                    Text(
                      userName,
                      style: MyBoldText.body1.copyWith(),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: Spacing.large),
                    Flexible(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: imageBorderRadius,
                            child: activeVideoTrack != null &&
                                    !activeVideoTrack!.muted
                                ? Flexible(
                                    child: SizedBox(
                                      height: imageHeight,
                                      width: imageWidth,
                                      child: VideoTrackRenderer(
                                        activeVideoTrack!,
                                        fit: RTCVideoViewObjectFit
                                            .RTCVideoViewObjectFitCover,
                                      ),
                                    ),
                                  )
                                : Image.network(
                                    widget.urlProfile,
                                    fit: BoxFit.cover,
                                    height: imageHeight,
                                    width: imageWidth,
                                  ),
                          ),
                          widget.isWaiting
                              ? Positioned(
                                  top: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: imageBorderRadius,
                                      color: Colors.grey.withOpacity(0.6),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          widget.isWaiting
                              ? Text(
                                  "Waiting ...",
                                  textAlign: TextAlign.center,
                                  style: MyRegularText.body1
                                      .copyWith(color: Colors.black),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
          ),
        );
      },
    );
  }
}

class PeopleCard extends StatelessWidget {
  final List<ParticipantTrack> participantTrack;

  const PeopleCard({
    super.key,
    required this.participantTrack,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoConferenceController>(
      builder: (controller) {
        final isMicOn = controller.isMicOn.value;
        final isShareScreen = controller.isShareScreen.value;

        return LayoutBuilder(
          builder: (_, constraints) {
            if (constraints.maxHeight < 100) {
              return SizedBox();
            }
            return AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              height: 0,
              child: Container(
                padding: const EdgeInsets.all(Spacing.medium),
                decoration: isShareScreen || participantTrack.length > 2
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(Spacing.large),
                        color: MyColor.darkButton,
                      )
                    : null,
                child: participantTrack.length <= 2
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              padding: const EdgeInsets.symmetric(
                                horizontal: Spacing.medium,
                              ),
                              child: Image.asset(
                                "asset/images/ic_talk_${isMicOn ? "on" : "off"}.png",
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: participantTrack.map(
                                (currentParticipant) {
                                  String userName =
                                      currentParticipant.participant.identity;
                                  if (userName == "") {
                                    userName = "You";
                                  }

                                  return Flexible(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: PeopleImageCard(
                                            currentParticipant.participant
                                                as LocalParticipant,
                                            currentParticipant.type,
                                            urlProfile: controller.dataUser[0]
                                                ['urlProfile'] as String,
                                          ),
                                        ),
                                        SizedBox(width: Spacing.medium),
                                      ],
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "asset/images/ic_talk_${isMicOn ? "on" : "off"}.png",
                                    color: MyColor.green,
                                    width: 20,
                                  ),
                                  SizedBox(width: Spacing.small),
                                  Text(
                                    "You & ${participantTrack.length - 1} participants",
                                    style: MyRegularText.body1.copyWith(
                                      color: MyColor.green,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  // controller.changeMaximizeTranscript(
                                  //   isMaximizeTranscript ? false : true,
                                  // );
                                },
                                icon: Image.asset(
                                  "asset/images/ic_resize_full.png",
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: participantTrack.map(
                                  (currentParticipant) {
                                    String userName =
                                        currentParticipant.participant.identity;
                                    if (userName == "") {
                                      userName = "You";
                                    }
                                    return Row(
                                      children: [
                                        PeopleImageCard(
                                          currentParticipant.participant
                                              as LocalParticipant,
                                          currentParticipant.type,
                                          urlProfile: controller.dataUser[0]
                                              ['urlProfile'] as String,
                                        ),
                                        SizedBox(width: Spacing.medium),
                                      ],
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            );
          },
        );
      },
    );
  }
}
