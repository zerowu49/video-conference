part of 'index.dart';

class Const {
  static const String livekitWebsocketUrl =
      String.fromEnvironment('LIVEKIT_WEBSOCKET_URL', defaultValue: '');
  static const String livekitToken =
      String.fromEnvironment('LIVEKIT_TOKEN', defaultValue: '');
}
