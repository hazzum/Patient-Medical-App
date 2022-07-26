import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  List doctorsJsonList = [];
  getData() {
    return FirebaseFirestore.instance
        .collection('doctors')
        .get()
        .then((QuerySnapshot doc) {
      for (int i = 0; i < doc.docs.length; ++i) {
        doctorsJsonList.add(doc.docs[i].data());
      }
    });
  }

  returnData() {
    getData();
    return doctorsJsonList;
  }
}
