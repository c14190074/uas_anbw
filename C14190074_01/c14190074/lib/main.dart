import 'package:c14190074/dbclass.dart';
import 'package:c14190074/dbservices.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'apiservices.dart';
import 'dataclass.dart';
import 'detaildata.dart';
import 'firebase_options.dart';
import 'likepost.dart';

void main() async {
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaterialApp(
    title: 'Berita',
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Services serviceAPI = Services();
  late Future<List<cData>> listData;
  // final globalKey = GlobalKey<ScaffoldState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState!
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    listData = serviceAPI.getAllData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text("Daftar Berita"),
          ),
          body: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 1))),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Likepost();
                            }));
                          },
                          child: Text('View Liked Post')),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                child: FutureBuilder<List<cData>>(
                  future: listData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<cData> isiData = snapshot.data!;
                      return ListView.builder(
                        itemCount: isiData.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Expanded(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                margin: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1, color: Colors.grey))),
                                child: Wrap(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                            child: Text(isiData[index].ctitle)),
                                        Container(
                                            margin: EdgeInsets.only(
                                                bottom: 5, top: 5),
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              isiData[index].cpubdate,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey),
                                            )),
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      berita newdata = berita(
                                                        title: isiData[index]
                                                            .ctitle,
                                                        link: isiData[index]
                                                            .clink,
                                                        pubdate: isiData[index]
                                                            .cpubdate,
                                                        description:
                                                            isiData[index]
                                                                .cdescription,
                                                        thumbnail:
                                                            isiData[index]
                                                                .cthumbnail,
                                                      );

                                                      Database.tambahData(
                                                          brt: newdata);
                                                      showInSnackBar("Liked");
                                                    },
                                                    child: Icon(
                                                        Icons.thumb_up_sharp)),
                                              ),
                                              Container(
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      Database.hapusdata(
                                                          selectedTtitle:
                                                              isiData[index]
                                                                  .ctitle);
                                                      showInSnackBar(
                                                          "Disliked");
                                                    },
                                                    child: Icon(Icons
                                                        .thumb_down_alt_sharp)),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(isiData[index].cthumbnail)),
                            // subtitle: Text(isiData[index].cpubdate),
                            onTap: () {
                              // showData(isiData[index].cid);
                              // Future<cData> response =
                              //     serviceAPI.getSingleData(isiData[index].cid);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Detaildata(
                                    title: isiData[index].ctitle,
                                    description: isiData[index].cdescription,
                                    link: isiData[index].clink,
                                    pubdate: isiData[index].cpubdate,
                                    thumbnail: isiData[index].cthumbnail);
                              }));
                            },
                            onLongPress: () {
                              // deleteData(isiData[index].cid, context);
                            },
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ))
            ],
          )),
    );
  }
}
