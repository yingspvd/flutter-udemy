const { onDocumentCreated } = require('firebase-functions/v2/firestore');
const admin = require('firebase-admin');

admin.initializeApp();

exports.myFunction = onDocumentCreated('chat/{messageId}', async (event) => {
  const messageData = event.data.data();

  const payload = {
    notification: {
      title: messageData['username'] || 'New Message',
      body: messageData['text'] || '',
    },
    data: {
      click_action: 'FLUTTER_NOTIFICATION_CLICK',
    },
    topic: 'chat',
  };

  try {
    const response = await admin.messaging().send(payload);
    console.log('Successfully sent message:', response);
  } catch (error) {
    console.error('Error sending message:', error);
  }
});
