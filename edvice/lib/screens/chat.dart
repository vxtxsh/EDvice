import 'package:edu_bvrit/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'bottom.dart';

class Cahc extends StatelessWidget {
  const Cahc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        title: Text(
          'Chat',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              initialUrl: 'http://192.168.1.9:5000',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {},
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onWebResourceError: (WebResourceError error) {
                print("Web resource error: $error");
              }, 
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(currentIndex: 3),
    );
  }
}