import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'dbservices.dart';
import 'main.dart';

class Likepost extends StatefulWidget {
  const Likepost({Key? key}) : super(key: key);

  @override
  _LikepostState createState() => _LikepostState();
}

class _LikepostState extends State<Likepost> {
  final txt_search = TextEditingController();

  @override
  void dispose() {
    txt_search.dispose();
    super.dispose();
  }

  @override
  void initState() {
    txt_search.addListener(onSearch);
    super.initState();
  }

  Stream<QuerySnapshot<Object?>> onSearch() {
    setState(() {});
    return Database.getData(txt_search.text);
  }

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
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: txt_search,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Search by Complete Title"),
                ),
              ),
              Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                stream: onSearch(),
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

                          return ListTile(
                            title: Expanded(
                              child: Wrap(
                                children: [
                                  Container(
                                      child: Text(
                                    lvTitle,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        lvDescription,
                                        style: TextStyle(fontSize: 13),
                                      )),
                                ],
                              ),
                            ),
                            leading: CircleAvatar(
                                backgroundImage: NetworkImage(lvThumbnail)),
                            subtitle: Text(lvPubdate),
                            onTap: () {},
                            onLongPress: () {
                              // deleteData(isiData[index].cid, context);
                            },
                          );

                          // _jumlah = snapshot.data!.docs.length;
                          // return ListTile(
                          //   onTap: () {
                          //     // // final dtBaru = itemCatatan(
                          //     // //     itemJudul: lvJudul, itemIsi: lvIsi + "n");
                          //     // // Database.ubahData(item: dtBaru);
                          //     // final selected_data = user(
                          //     //     username: lvUsername, password: lvPassword);
                          //     // Navigator.push(
                          //     //     context,
                          //     //     MaterialPageRoute(
                          //     //         builder: (context) => Register(
                          //     //               dataUser: selected_data,
                          //     //             )));
                          //   },
                          //   onLongPress: () {
                          //     // Database.hapusdata(judulHapus: lvJudul);
                          //   },
                          //   title: Text(lvTitle),
                          //   subtitle: Text(lvDescription),
                          // );
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
