import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OscCommands extends StatefulWidget {

  OscCommands({Key? key}) : super(key: key);

  @override
  State<OscCommands> createState() => _OscCommandsState();
}

class _OscCommandsState extends State<OscCommands> {
  final controller = WebViewController()..setJavaScriptMode(JavaScriptMode.disabled)..loadRequest(Uri.parse('https://wiki.pangolin.com/doku.php?id=beyond:pangoscript_commands'));

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Osc Commands',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: WebViewWidget(controller: controller)
    );
  }
}


