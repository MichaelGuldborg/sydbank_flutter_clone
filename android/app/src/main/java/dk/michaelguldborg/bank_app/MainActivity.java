package dk.michaelguldborg.sydbank_flutter_clone;

import android.os.Bundle;
// import io.flutter.app.FlutterActivity;
import io.flutter.app.FlutterFragmentActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

// FlutterFragmentActivity instead of FlutterActivity because of biometric dependecy
public class MainActivity extends FlutterFragmentActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
  }
}
