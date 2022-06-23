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
          title: Text('Detail Data'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                //height: 20,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Row(
                      children: [
                        Image(image: NetworkImage(widget.thumbnail)),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Title: ' + widget.title),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Description: ' + widget.description),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Date: ' + widget.pubdate),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Link: ' + widget.link),
                      ],
                    ),
                  ],
                ),
              ),
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
      ),
    );
  }
}