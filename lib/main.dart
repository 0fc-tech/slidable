// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> entries =["aa","nbc","dlsf","fsdf","fsdf","aa","nbc","dlsf","fsdf","fsdf","aa","nbc","dlsf","fsdf","fsdf","aa","nbc","dlsf","fsdf","fsdf","aa","nbc","dlsf","fsdf","fsdf","aa","nbc","dlsf","fsdf","fsdf","aa","nbc","dlsf","fsdf","fsdf"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      ListView.separated(
          separatorBuilder:(index, n)=>const Divider() ,
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index)
            => Slidable(
              key: Key(index.toString()),
              closeOnScroll: true,
              startActionPane: ActionPane(
                dismissible: DismissiblePane(
                  key: Key(index.toString()),
                  onDismissed: () {
                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                      content: Text(entries[index]),
                      duration: const Duration(seconds: 1),
                    ));
                }),
                motion: ScrollMotion(),
                children: [],
              ),
              child: ListTile(
                title: Center(child: Text('Entry ${entries[index]}')),
              ),
            )
      ),

    );
  }
}
