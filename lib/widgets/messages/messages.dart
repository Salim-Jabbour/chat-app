import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('/chat')
          .orderBy(
            'createdAt',
            descending: true,
          )
          .snapshots(),
      builder: (context, AsyncSnapshot chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final chatDocs = chatSnapshot.data.docs;

        // print('LLLLLLLLLLLLLLLLLLLLL + ${chatDocs[0].reference.id}');
        return ListView.builder(
          reverse: true,
          itemCount: chatDocs!.length,
          itemBuilder: (context, index) => MessageBubble(
            message: chatDocs[index]['text'],
            userName: chatDocs[index]['username'],
            userImage: chatDocs[index]['userImage'],
            isMe: chatDocs[index]['userId'] ==
                FirebaseAuth.instance.currentUser!.uid,
            key: ValueKey(chatDocs[index].reference.id),
          ),
        );
      },
    );
  }
}
