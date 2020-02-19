import 'package:flutter/material.dart';

class ClientShowPage extends StatefulWidget {
  final String title;
  const ClientShowPage({Key key, this.title = "ClientShow"}) : super(key: key);

  @override
  _ClientShowPageState createState() => _ClientShowPageState();
}

class _ClientShowPageState extends State<ClientShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Client")
        ),
        body: ListView(
            children: <Widget>[
              //Hero(
                //tag: "avatar_",
                //child: Image.network(
                //    record.photo
                //),
              //),
              // 3
              GestureDetector(
                   onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(32.0),
                    child: Row(
                      children: [
                        // First child in the Row for the name and the
                        // Release date information.
                        Expanded(
                          // Name and Address are in the same column
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Code to create the view for name.
                              Container(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "Name: " ,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // Code to create the view for address.
                              Text(
                                "Address: " ,
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Icon to indicate the phone number.
                        Icon(
                          Icons.phone,
                          color: Colors.red[500],
                        ),
                        Text("Contato"),
                      ],
                    ),
                  )
              ),
            ]
        )
    );
  }
}
