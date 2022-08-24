import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/components.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: textstyle.copyWith(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return buildNotifications();
        },
        separatorBuilder: (BuildContext context, int index) {
          return myLine(
              width: 20,
              color: Colors.grey.shade500,
              left: 25,
              right: 25,
              top: 5);
        },
        itemCount: 11,
      ),
    );
  }
}
