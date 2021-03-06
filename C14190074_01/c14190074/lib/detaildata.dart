import 'dart:developer';

import 'package:flutter/material.dart';

import 'apiservices.dart';
import 'dataclass.dart';
import 'main.dart';

class Detaildata extends StatefulWidget {
  final String title;
  final String link;
  final String pubdate;
  final String description;
  final String thumbnail;
  const Detaildata(
      {Key? key,
      required this.title,
      required this.link,
      required this.pubdate,
      required this.description,
      required this.thumbnail})
      : super(key: key);
  @override
  _DetailDataState createState() => _DetailDataState();
}

class _DetailDataState extends State<Detaildata> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Halaman Detail'),
          ),
          body: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Image(image: NetworkImage(widget.thumbnail))),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(widget.title,
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(widget.description)),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text('Link: ' + widget.link)),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text('Published Date: ' + widget.pubdate)),
                    Container(
                      //height: 20,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 4,
                        runSpacing: 5,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MyApp();
                                }));
                              },
                              child: Text('Back to List')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
