import 'package:flutter/material.dart';
 
import 'package:cloud_firestore_all/cloud_firestore_all.dart';

class ClientListPage extends StatefulWidget {
  
  final String title;
  const ClientListPage({Key key, this.title = "Client List", this.firestore}) : super(key: key);
  final Firestore firestore;

  @override
  _ClientListPageState createState() => _ClientListPageState();
}

class _ClientListPageState extends State<ClientListPage> {
  final Firestore firestore = firestoreInstance;
  CollectionReference get messages => firestore.collection('messages');
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').onSnapshot,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        final int messageCount = snapshot.data.docs.length;
        return ListView.builder(
          itemCount: messageCount,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document = snapshot.data.docs[index];
            final dynamic message = document['message'];
            return ListTile(
              title: Text(
                message != null ? message.toString() : '<No message retrieved>',
              ),
              subtitle: Text('Message ${index + 1} of $messageCount'),
              trailing: Text(
                DateTime.fromMillisecondsSinceEpoch(
                  document['created_at']?.millisecondsSinceEpoch ?? 0,
                  isUtc: true,
                ).toString(),
              ),
            );
          },
        );
      },
    
      ),
    );
  }
}
  