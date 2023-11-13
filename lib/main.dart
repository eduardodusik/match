import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MatchScreen(),
    );
  }
}

class MatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Congratulations, It's a ",
              style: TextStyle(fontSize: 24.0, color: Colors.black),
            ),
            Text(
              "match!",
              style: TextStyle(
                fontSize: 28.0,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProfileImage("https://static.glamurama.uol.com.br/2014/07/nota-marge0-copy.jpg"),
                SizedBox(width: 20.0),
                _buildProfileImage("https://inteligenciafinanceira.com.br/wp-content/uploads/2023/02/homer-simpson-1-264a0.jpeg"),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              "Homer, 45",
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Text(
              "Start a conversation about something interesting or just say hi for an initial chat",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                minimumSize: Size(double.infinity, 50.0),
              ),
              child: Text("Say Hi"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(String imageUrl) {
    return Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
