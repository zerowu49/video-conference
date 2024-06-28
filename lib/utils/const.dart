class Const {
  static const String livekitWebsocketUrl =
      String.fromEnvironment('LIVEKIT_WEBSOCKET_URL', defaultValue: '');
  static const String livekitAPIKey =
      String.fromEnvironment('LIVEKIT_API_KEY', defaultValue: '');
}
