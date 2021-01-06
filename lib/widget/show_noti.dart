import 'package:flutter/material.dart';

class ShowNoti extends StatefulWidget {
  final String title;
  final String message;

  const ShowNoti({
    Key key,
    this.title,
    this.message,
  }) : super(key: key);

  @override
  _ShowNotiState createState() => _ShowNotiState();
}

class _ShowNotiState extends State<ShowNoti> {
  String title, message;

  @override
  void initState() {
    super.initState();
    title = widget.title;
    message = widget.message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Notification'),
      ),
      body: ListTile(
        title: Text(title),
        subtitle: Text(message),
      ),
    );
  }
}
