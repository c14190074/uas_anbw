import 'package:flutter/material.dart';

import 'apiservices.dart';
import 'dataclass.dart';

void main() {
  // runApp(const MyApp());
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
                            title: Text(isiData[index].ctitle),
                            leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(isiData[index].cthumbnail)),
                            subtitle: Text(isiData[index].cpubdate),
                            onTap: () {
                              // showData(isiData[index].cid);
                              // Future<cData> response =
                              //     serviceAPI.getSingleData(isiData[index].cid);
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return Detaildata(
                              //       nama: isiData[index].cnama,
                              //       avatar: isiData[index].cavatar,
                              //       alamat: isiData[index].calamat,
                              //       email: isiData[index].cemail,
                              //       pekerjaan: isiData[index].cpekerjaan,
                              //       quote: isiData[index].cquote);
                              // }));
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
