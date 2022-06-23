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
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = serviceAPI.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("UAS"),
          ),
          body: Column(
            children: [
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Likepost();
                      }));
                    },
                    child: Text('View Liked Post')),
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
                              child: Wrap(
                                children: [
                                  Container(child: Text(isiData[index].ctitle)),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          berita newdata = berita(
                                            title: isiData[index].ctitle,
                                            link: isiData[index].clink,
                                            pubdate: isiData[index].cpubdate,
                                            description:
                                                isiData[index].cdescription,
                                            thumbnail:
                                                isiData[index].cthumbnail,
                                          );

                                          Database.tambahData(brt: newdata);
                                        },
                                        child: Text("Like")),
                                  ),
                                  Container(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Database.hapusdata(
                                              selectedTtitle:
                                                  isiData[index].ctitle);
                                        },
                                        child: Text("Dislike")),
                                  )
                                ],
                              ),
                            ),
                            leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(isiData[index].cthumbnail)),
                            subtitle: Text(isiData[index].cpubdate),
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
