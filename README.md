# App Name

Video Conference App

## Assumption

This project assume that:

- Initial app is loaded using dark theme by default
- Font family set to "Poppins" which quite similar since the font of "LEMON MILK Pro" isn't the same as Google Font's "Lemon" font family. 
- Adding new `share-screen` button
- Transcription use `speech_to_text` package to generate transcript
- Assume that `1-1` and `Group` method generate same room (which in real case may differ according to business needs)

## Step-by-step to run App

1. Head to 'livekit-token' and install dependencies:
    - `cd ./livekit-token`
    - `yarn` / `npm i`
2. Copy file 'dev.env.example' and rename with 'dev.env', then fill the env data
3. Load the env, then run the server.js
    - `source dev.env`
    - `node server.js`
4. Copy the token from the browser opened. This will be used to run the flutter project

5. Run Flutter project by using the token from step 4
```
flutter run --dart-define=LIVEKIT_WEBSOCKET_URL=<replace> --dart-define=LIVEKIT_TOKEN=<replace>
```

More detail for step 1-4 for
generating token based on configuration : [Docs](https://docs.livekit.io/realtime/server/generating-tokens/)