import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: Column(children: [
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text(
            'Notification 1',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            'This is notification 1',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text(
            'Notification 1',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            'This is notification 1',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text(
            'Notification 1',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            'This is notification 1',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text(
            'Notification 1',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            'This is notification 1',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ]),
    );
  }
}
