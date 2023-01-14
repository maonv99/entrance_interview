// import 'dart:async';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:rxdart/transformers.dart';
// import 'string.dart';
// import 'collect.dart';
//
// extension Cilly on CollectionReference {
//   Stream<bool> streamHasData(String path) =>
//       doc(path).get().asStream().map((document) => document.data != null);
//
//   Stream<QuerySnapshot> streamAfter(Query query,
//       {String after, StreamTransformer transformer, bool snapshot}) {
//     var queryStream = query.getStream(snapshot);
//     if (!after.isNullOrEmpty) {
//       queryStream = doc(after)
//           .get()
//           .asStream()
//           .map((doc) => query.startAfterDocument(doc))
//           .map((query) => query.getStream(snapshot))
//           .transform(transformer ??
//               FlatMapStreamTransformer<Stream<QuerySnapshot>, QuerySnapshot>(
//                   (value) => value));
//     }
//     return queryStream;
//   }
// }
//
// extension Oeq on Stream<List<DocumentSnapshot>> {
//   Stream<List<T>> convert<T>(T modelCreator(Map data, String id)) {
//     return map((documents) {
//       return documents
//           .map((documentSnapshot) =>
//               modelCreator(documentSnapshot.data(), documentSnapshot.id))
//           .toList();
//     });
//   }
// }
//
// extension Seq on Stream<QuerySnapshot> {
//   Stream<List<T>> obs<T>(T modelCreator(Map data, String id),
//       {bool condition(DocumentSnapshot item)}) {
//     var obs = map((snapshot) => snapshot.docs);
//     if (condition != null)
//       obs = obs.map((documents) => documents.where(condition).toList());
//     return obs.convert(modelCreator);
//   }
// }
//
// extension Quilly on Query {
//   Stream<QuerySnapshot> getStream(snapshot) =>
//       snapshot ? snapshots() : get().asStream();
// }
