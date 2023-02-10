const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

exports.increase = functions
  .region("asia-southeast1")
  .firestore.document("reviews/{id}")
  .onCreate(async (querySnapshot, _) => {
    const review = querySnapshot.data();

    const ratingCounts = admin.firestore().collection("ratingCounts");
    const docRef = ratingCounts.doc(review.courseId);
    const docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      return docRef.update({
        [review.rating]: admin.firestore.FieldValue.increment(1),
      });
    } else {
      // Create new document
      let initRatingCount = { 5: 0, 4: 0, 3: 0, 2: 0, 1: 0 };
      initRatingCount[review.rating] = 1;
      return docRef.set(initRatingCount);
    }
  });
