import 'package:c14190074/dbservices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Likepost extends StatelessWidget {
  const Likepost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List of Liked Post",
      home: Scaffold(
          appBar: AppBar(title: Text("List of Liked Posts")),
          body: Column(
            children: [
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyApp()));
                    },
                    child: Text("Back to Home")),
              ),
              Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                stream: Database.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error');
                  } else if (snapshot.hasData || snapshot.data != null) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          DocumentSnapshot dsData = snapshot.data!.docs[index];
                          String lvTitle = dsData['title'];
                          String lvDescription = dsData['description'];
                          String lvLink = dsData['link'];
                          String lvPubdate = dsData['pubdate'];
                          String lvThumbnail = dsData['thumbnail'];

                          // _jumlah = snapshot.data!.docs.length;
                          return ListTile(
                            onTap: () {
                              // // final dtBaru = itemCatatan(
                              // //     itemJudul: lvJudul, itemIsi: lvIsi + "n");
                              // // Database.ubahData(item: dtBaru);
                              // final selected_data = user(
                              //     username: lvUsername, password: lvPassword);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Register(
                              //               dataUser: selected_data,
                              //             )));
                            },
                            onLongPress: () {
                              // Database.hapusdata(judulHapus: lvJudul);
                            },
                            title: Text(lvTitle),
                            subtitle: Text(lvDescription),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 8.0,
                            ),
                        itemCount: snapshot.data!.docs.length);
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.pinkAccent,
                      ),
                    ),
                  );
                },
              )),
            ],
          )),
    );
  }
}
