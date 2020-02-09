const functions = require('firebase-functions');
const admin = require("firebase-admin");
admin.initializeApp(functions.config().firebase);

// On sing up
exports.processSignUp = functions.auth.user().onCreate(user => {
    const customClaims = {
        "https://hasura.io/jwt/claims": {
            "x-hasura-default-role": "user",
            "x-hasura-allowed-roles": ["user"],
            "x-hasura-user-id": user.uid
        }
    };

    return admin
        .auth()
        .setCustomUserClaims(user.uid, customClaims)
        .then(() => {
            const metadataRef = admin.database().ref("metadata/" + user.uid);
            return metadataRef.set(
                {
                    refreshTime: new Date().getTime()
                }
            );
        })
        .catch(error => {
            console.log(error);
        });
});

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
