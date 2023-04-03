// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart ';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _enteredMessage = '';

//to send notification
  Future<bool> callOnFcmApiSendPushNotifications(
      {required String title, required String body}) async {
    const postUrl = 'https://fcm.googleapis.com/fcm/send';
    final data = {
      "to": "/topics/chatTopic",
      "notification": {
        "title": title,
        "body": body,
      },
      "data": {
        "type": 'Chat',
        "id": Timestamp.now().toString(),
        "click_action": 'FLUTTER_NOTIFICATION_CLICK',
      }
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization':
          'key=AAAALlJaSjQ:APA91bEdtbuDd7lzsI_1_pPfLJC3Hm_jQckIocI-xYAteX9uwXV4oCJQqf3XJ_KFzU_bdhuFWVr6uLT5Lezmot9FZ7_wDtbHkziY1LEttMDETOwPDtjN1PBaqbjj36GFBmUV2S_31yu-' // 'key=YOUR_SERVER_KEY'
    };

    final response = await http.post(Uri.parse(postUrl),
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);

    if (response.statusCode == 200) {
      // on success do sth
      print('test ok push CFM');
      return true;
    } else {
      print(' CFM error');
      // on failure do sth
      return false;
    }
  }

  void _sendMessage() async {
    // FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    FirebaseFirestore.instance.collection('/chat').add({
      'text': _enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData['username'],
      'userImage': userData['image_url']
    });
    await callOnFcmApiSendPushNotifications(
      title: userData['username'],
      body: _enteredMessage,
    );
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          //put Expanded
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              maxLines: null,
              //for letting the action button(alzr elle balzweh) do certain things
              textInputAction: TextInputAction.newline,
              //we put onsubmitted to make the function work when we press it
              // onSubmitted: (value) => print('object'),
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Send a message...',
              ),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.send,
            ),
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
          ),
        ],
      ),
    );
  }
}
