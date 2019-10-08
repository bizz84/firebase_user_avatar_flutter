import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Advanced Provider Tutorials',
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(height: 32),
            Text(
              'by Andrea Bizzotto',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(height: 32),
            Text(
              'codingwithflutter.com',
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}
