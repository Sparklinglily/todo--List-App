import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            physics: null,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    margin: EdgeInsets.only(left: 24, right: 24),
                    elevation: 3,
                    //  shape: CircleBorder(side: BorderSide(width: 4)),
                    child: Image.asset(
                      'images/carla.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Name: Carla Ejemeh Inya-Agha',
                    style: TextStyle(fontSize: 21),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebViewPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 235, 159, 194),
                          borderRadius: BorderRadius.circular(24)),
                      child: Text('GitHub Profile'),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController webViewController;
  bool isLoading = true;
  final key = UniqueKey();

  @override
  void initState() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progess) {
            setState(() {
              isLoading = false;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
        ),
      )
      ..loadRequest(Uri.parse('https://github.com/Sparklinglily'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(children: [
        WebViewWidget(
          controller: webViewController,
          key: key,
        ),
        if (isLoading)
          Center(
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.amber),
            ),
          )
      ]),
    );
  }
}
