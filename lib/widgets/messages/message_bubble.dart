import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    required this.message,
    required this.isMe,
    required this.userImage,
    required this.userName,
    super.key,
  });
  final String message;
  final String userName;
  final String userImage;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isMe
                    ? Colors.grey[300]
                    : Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: !isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                  bottomRight: isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                ),
              ),
              width: 150,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin:
                  EdgeInsets.symmetric(vertical: isMe ? 4 : 8, horizontal: 8),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  isMe
                      ? const SizedBox.shrink()
                      : Text(
                          userName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 240, 196, 240),
                            fontSize: 17,
                          ),
                          textAlign: isMe ? TextAlign.end : TextAlign.start,
                        ),
                  Padding(
                    padding: isMe      
                        ? EdgeInsets.zero
                        : const EdgeInsets.only(top: 8.0),
                    child: Text(
                      message,
                      style: TextStyle(
                        color: isMe
                            ? Colors.black
                            : Theme.of(context)
                                .primaryTextTheme
                                .headline1!
                                .color,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        isMe
            ? const SizedBox.shrink()
            : Positioned(
                top: -7,
                left: 135,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    userImage,
                  ),
                ),
              ),
      ],
    );
  }
}
