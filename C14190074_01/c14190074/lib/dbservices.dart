import 'package:c14190074/dbclass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference tblData =
    FirebaseFirestore.instance.collection("tabelData");

class Database {
  static Stream<QuerySnapshot> getData(String keyword) {
    if (keyword == "") {
      return tblData.snapshots();
    } else {
      return tblData.where("title", isEqualTo: keyword).snapshots();
    }
  }

  // static Future<List> getGroupedData() async {
  //   // Get docs from collection reference
  //   QuerySnapshot querySnapshot = await tblMahasiswa.get();
  //   // Get data from docs and convert map to List
  //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  //   return allData;
  // }

  static Future<void> tambahData({required berita brt}) async {
    DocumentReference docRef = tblData.doc(brt.title);
    await docRef
        .set(brt.toJson())
        .whenComplete(() => print("Data berhasil diinput!"))
        .catchError((e) => print(e));
  }

  // static Future<void> ubahData({required mahasiswa mhs}) async {
  //   DocumentReference docRef = tblMahasiswa.doc(mhs.nrp);
  //   await docRef
  //       .update(mhs.toJson())
  //       .whenComplete(() => print("Data Berhasil Diubah!"))
  //       .catchError((e) => print(e));
  // }

  static Future<void> hapusdata({required String selectedTtitle}) async {
    DocumentReference docRef = tblData.doc(selectedTtitle);
    await docRef
        .delete()
        .whenComplete(() => print("Data Berhasil Dihapus!"))
        .catchError((e) => print(e));
  }
}
