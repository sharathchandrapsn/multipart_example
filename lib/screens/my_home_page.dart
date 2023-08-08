import 'package:flutter/material.dart';
import 'package:multipart_example/screens/upload_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
        appBar: AppBar(title: const Text('Flutter File Upload Example')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                  "Insert the URL that will receive the Multipart POST request (including the starting http://)",
                  style: Theme.of(context).textTheme.headline1),
              TextField(
                controller: controller,
                onSubmitted: (str) => switchScreen(str, context),
              ),
              TextButton(
                child: const Text("Take me to the upload screen"),
                onPressed: () => switchScreen(controller.text, context),
              )
            ],
          ),
        ));
  }

  void switchScreen(str, context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => UploadPage(url: str)));
}