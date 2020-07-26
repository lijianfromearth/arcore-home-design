package com.jian.homedesigner;

import android.content.Intent;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import java.util.Map;
public class MainActivity extends FlutterActivity {
    static String model = "sofa";
    String success = "ar success";
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    new MethodChannel(getFlutterView(), "flutter.ar").setMethodCallHandler(
            new MethodChannel.MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                  model=call.method ;
                  Map partm = (Map)call.arguments;
                  if((int)partm.get("ar")==1){startMar();}
                  else startar();
                result.success(partm.get("ar"));
              }
            }
    );
  }

    private void startar() {
        startActivity(new Intent(this,ARActivity.class));
    }
    private void startMar() {
        startActivity(new Intent(this,MARActivity.class));
    }
}
