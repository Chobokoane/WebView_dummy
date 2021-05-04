import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:ui' as ui;

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar : AppBar(
        title: Text("WebView"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 150,
          child: SizedBox(
              width: 150,
              height: 40,
              child: Container(
                child: FlatButton(
                    color: Colors.blue,
                    child: Text(
                      'WebView',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: (){
                      forWeb();
                    }),
              )),
        ),
      ),
    );
  }
  void forWeb() {
    if(kIsWeb){
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
          'hello-world-html',
              (int viewId) => IFrameElement()
            ..width = '640'
            ..height = '360'
            ..src = 'https://www.youtube.com/embed/IyFZznAk69U'
            ..style.border = 'none');

      runApp(Directionality(
        textDirection: TextDirection.ltr,
        child: SizedBox(
          width: 640,
          height: 360,
          child: HtmlElementView(viewType: 'hello-world-html'),
        ),
      ));

    }
  }
}
