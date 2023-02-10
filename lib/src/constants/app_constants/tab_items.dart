import 'package:flutter/material.dart';

class TabItems {
  static const myCourses = <Tab>[
    Tab(
      text: 'All',
      icon: Icon(Icons.widgets),
    ),
    Tab(
      text: 'Downloaded',
      icon: Icon(Icons.download_done),
    ),
    Tab(
      text: 'Favorited',
      icon: Icon(Icons.favorite),
    ),
    Tab(
      text: 'Archived',
      icon: Icon(Icons.archive),
    ),
  ];
}
