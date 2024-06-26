import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoConferenceController extends GetxController {
  static VideoConferenceController find() => Get.find();

  // Room Info
  final roomName = "On Air Studio".obs;
  final roomTag = "+broadcast.org".obs;
  final dataUser = [
    {
      "name": "Yaya Touré",
      "urlProfile":
          "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "isWaiting": false,
    },
    {
      "name": "Maria Lopez",
      "urlProfile":
          "https://upload.wikimedia.org/wikipedia/commons/8/86/Woman_at_Lover%27s_Bridge_Tanjung_Sepat_%28cropped%29.jpg",
      "isWaiting": false,
    },
    // {
    //   "name": "Tommy Soeharto",
    //   "urlProfile":
    //       "https://thumb.viva.co.id/media/frontend/tokoh/2017/04/05/58e4ba4367d2d-tommy-soeharto2_216_287.jpg",
    //   "isWaiting": false,
    // },
    // {
    //   "name": "James Lye",
    //   "urlProfile":
    //       "https://upload.wikimedia.org/wikipedia/commons/7/79/James_Rodriguez_2018.jpg",
    //   "isWaiting": false,
    // },
  ].obs;
  final dataChat = [
    {
      'name': "Gaby G",
      'imageUrl':
          'https://cdns.klimg.com/dream.co.id/resources/news/2022/03/22/194557/1200x600-beda-potret-lulu-tobing-kenakan-hijab-saat-umroh-perdana-220322t.jpg',
      'time': "12:15PM",
      'chat': 'Go People Go!',
      'like': 1,
    },
    {
      'name': "Bani M",
      'imageUrl':
          'https://thumb.viva.co.id/media/frontend/thumbs3/2023/07/25/64bf554ab549d-bani-maulana-mulia_665_374.jpg',
      'time': "12:16PM",
      'chat': 'Never stop innovating!',
      'like': 3,
    },
    {
      "name": "Maria Lopez",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/8/86/Woman_at_Lover%27s_Bridge_Tanjung_Sepat_%28cropped%29.jpg",
      "time": "12:20PM",
      "chat": "Love the background view.",
      "like": 1,
    },
  ].obs;

  // Screen
  final isShareScreen = true.obs;

  // Button Call
  final isMicOn = false.obs;
  final isVideoOn = false.obs;
  final isTranscriptOpen = false.obs;
  final isChatOpen = false.obs;

  // Transcript
  final isMaximizeTranscript = false.obs;

  // Chat
  final chatTextController = TextEditingController().obs;

  void changeShareScreenStatus(bool status) {
    isShareScreen.value = status;
    update();
  }

  void changeMicStatus(bool status) {
    isMicOn.value = status;
    update();
  }

  void changeVideoStatus(bool status) {
    isVideoOn.value = status;
    update();
  }

  void changeTranscriptStatus(bool status) {
    isTranscriptOpen.value = status;
    update();
  }

  void changeChatStatus(bool status) {
    isChatOpen.value = status;
    update();
  }

  void changeMaximizeTranscript(bool status) {
    isMaximizeTranscript.value = status;
    update();
  }

  void changeChatInput(String message) {
    chatTextController.value.text = message;
    update();
  }
}
