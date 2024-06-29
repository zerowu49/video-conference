// server.js
import express from 'express';
import open from 'open';
import { AccessToken } from 'livekit-server-sdk';

const createToken = async () => {
  // if this room doesn't exist, it'll be automatically created when the first
  // client joins
  const roomName = 'quickstart-room';
  // identifier to be used for participant.
  // it's available as LocalParticipant.identity with livekit-client SDK
  const participantName = 'quickstart-username';

  // token to expire after 24 hours
  const hourTokenExpired = 24 * 60;
  const at = new AccessToken(process.env.LIVEKIT_API_KEY, process.env.LIVEKIT_API_SECRET, {
    identity: participantName,
    ttl: `${hourTokenExpired}m`,
  });
  at.addGrant({ roomJoin: true, room: roomName });
  const token = await at.toJwt()
  console.log(`=Token is: ${token}`);
  return token;
}

const app = express();
const port = 3000;

app.get('/getToken', async (req, res) => {
  res.send(await createToken());
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`)
  open(`http://localhost:${port}/getToken`)
})