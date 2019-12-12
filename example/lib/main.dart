import 'package:flutter/material.dart';

import 'package:content_placeholder/content_placeholder.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                ContentPlaceholder(
                  isAnimationEnabled: false,
                ),
                ContentPlaceholder(),
                ContentPlaceholder(
                  height: 20,
                ),
                ContentPlaceholder(
                  context: context,
                  child: Column(
                    children: <Widget>[
                      ContentPlaceholder.block(),
                      ContentPlaceholder.block(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
