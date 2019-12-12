import 'package:flutter/material.dart';
// import 'package:content_placeholder/placeholder_item.dart';

import 'placeholder_item.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: View(),
    );
  }
}

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            ContentPlaceholder(isAnimationEnabled: false,),
            ContentPlaceholder(),
            ContentPlaceholder(height: 10),
            // ContentPlaceholder(width: 50),
            ContentPlaceholder(
              context: context,
              child: Column(
                children: <Widget>[
                  ContentPlaceholder.block(),
                  ContentPlaceholder.block(height: 100),
                  Text('Hi')
                  // ContentPlaceholder.block(width: 200),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
