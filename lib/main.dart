import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://cdnmedia.webthethao.vn/uploads/img/files/images/fullsize/ao-shin.jpg'), which flutter dart
              ),
              Text(
                'Cuong Lai Tan',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico'),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.0,
                width: 150.0,
                child: Divider(
                  color: Colors.blue,
                ),
              ),
              Card(
                color: Colors.blue,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        '01206870169',
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blue,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.email,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'nidalee002@gmail.com',
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
