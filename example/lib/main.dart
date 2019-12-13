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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SectionHolder(
                    label: 'Normal',
                    placeholder: ContentPlaceholder(),
                  ),
                  SectionHolder(
                    label: 'Without Animation',
                    placeholder: ContentPlaceholder(
                      isAnimationEnabled: false,
                    ),
                  ),
                  SectionHolder(
                    label: 'Height & Width',
                    placeholder: ContentPlaceholder(
                      height: 50,
                      width: 150,
                    ),
                  ),
                  Builder(builder: (context) {
                    return SectionHolder(
                      label: 'Grouped',
                      placeholder: ContentPlaceholder(
                        context: context,
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ContentPlaceholder.block(
                                  width: 100,
                                  height: 100,
                                  rightSpacing: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    ContentPlaceholder.block(
                                      width:
                                          MediaQuery.of(context).size.width - 150,
                                      height: 25,
                                    ),
                                    ContentPlaceholder.block(
                                      width: MediaQuery.of(context).size.width / 2,
                                      height: 25,
                                    ),
                                    ContentPlaceholder.block(
                                      width: 80,
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SectionHolder extends StatelessWidget {
  final String label;
  final ContentPlaceholder placeholder;

  SectionHolder({
    @required this.placeholder,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(this.label, style: Theme.of(context).textTheme.headline),
        SizedBox(height: 10),
        this.placeholder,
        SizedBox(height: 20),
      ],
    );
  }
}
