
  // late int documentsCount;
  //function to get document length  
  // Future<void> getDocumentsCount() async {
    //first try .... it prints Future<int>
  //   print(
  //       '${FirebaseFirestore.instance.collection('chats/tsFHfvCL2rhytujspICh/messages').snapshots().length} + +++++++++++++++++++');

  // second try
  // it prints instance of JsonDocumentSnapshot
  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('chats/tsFHfvCL2rhytujspICh/messages')
  //       .doc()
  //       .get();
  //   print('$snapshot + sssssssssssssssssssssssss');


  //third try
  // make this function stops from working like chat
  //   // documentsCount = await FirebaseFirestore.instance
  //   //     .collection('chats/tsFHfvCL2rhytujspICh/messages')
  //   //     .snapshots()
  //   //     .length;
  // 


  // fourth try
  //   final QuerySnapshot qSnap = await FirebaseFirestore.instance
  //       .collection('chats/tsFHfvCL2rhytujspICh/messages')
  //       .get();
  //   final int documents = qSnap.docs.length;


  //   fifth try
  //   final String documentssss = FirebaseFirestore.instance
  //       .collection('chats/tsFHfvCL2rhytujspICh/messages')
  //       .snapshots()
  //       .length
  //       .toString();

  
  //   print(' LLLLLLLLLLLL L L L L + $documents');
  //   print(' LLLLLLLLLLLL L L L L + $documentssss');
  //   documentsCount = documents;
  //   print(documentsCount);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getDocumentsCount();
  // }














  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print('Got a message whilst in the foreground!');
    //   print('Message data: ${message.data}');

    //   if (message.notification != null) {
    //     print('Message also contained a notification: ${message.notification}');
    //   }
    // });




    
    //Use FirebaseMessaging.onMessageOpenedApp as a replacement for onLaunch and onResume handlers.
    //this function will trigger if the app was in background(onResume)
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!1011111111111010');

    //   print(message);
    // });