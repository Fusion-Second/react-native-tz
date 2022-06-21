package com.reactnativetz;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;
import java.util.TimeZone;
import java.util.Calendar;

@ReactModule(name = TzModule.NAME)
public class TzModule extends ReactContextBaseJavaModule {
    public static final String NAME = "Tz";

    public TzModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    @NonNull
    public String getName() {
        return NAME;
    }


    // Example method
    // See https://reactnative.dev/docs/native-modules-android
    // @ReactMethod
    // public void multiply(int a, int b, Promise promise) {
    //     promise.resolve(a * b);
    // }

    @ReactMethod
    public void getTimeZone(Promise promise) {
        try {
            Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
            TimeZone zone = calendar.getTimeZone();
            promise.resolve(zone.getID());
          }catch (Exception e){
            promise.reject(e);
          }
    }

    // public static native int nativeMultiply(int a, int b);
}
