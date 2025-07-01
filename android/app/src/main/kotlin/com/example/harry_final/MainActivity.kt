// package com.example.harry_final

// import io.flutter.embedding.android.FlutterActivity

// class MainActivity : FlutterActivity()
package com.example.harry_final  // Replace with your package name

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.webviewflutter.WebViewFlutterPlugin  // Add this

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // Manually register the WebView plugin
        flutterEngine.plugins.add(WebViewFlutterPlugin())
    }
}