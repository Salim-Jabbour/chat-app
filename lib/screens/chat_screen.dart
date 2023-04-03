import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../widgets/messages/messages.dart';
import '../widgets/messages/new_mesage.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //if the app was in foreground and it's replacement of onMessage

  Future<void> init() async {
    try {
      //subscribe to this specific topic so you can send and recieve notifications
      await FirebaseMessaging.instance.subscribeToTopic('chatTopic');

      //you must get the token to make the notification work on foreground
      final token = await FirebaseMessaging.instance.getToken();

      FirebaseMessaging.onMessage.listen(receivedMessage);
    } catch (e) {
      print('$e ');
    }
  }

  void receivedMessage(RemoteMessage message) {
    if (message.notification != null) {
      print(
          'Message also contained a notification: ${message.notification!.body}');
    }
  }

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.black87,
            ),
            child: DropdownButton(
                underline: const SizedBox.shrink(),
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: Theme.of(context).primaryIconTheme.color,
                ),
                items: [
                  DropdownMenuItem(
                    value: 'logout',
                    child: Row(
                      children: [
                        Icon(
                          Icons.exit_to_app_rounded,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
                onChanged: (itemIdentifier) {
                  if (itemIdentifier == 'logout') {
                    FirebaseAuth.instance.signOut();
                  }
                }),
          ),
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: Messages(),
          ),
          NewMessage(),
        ],
      ),
    );
  }
}
