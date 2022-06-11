package io.widget

import androidx.multidex.MultiDex
import io.flutter.app.FlutterApplication

/**
 * @author LiWeNHuI
 * @date 2022/4/7
 * @describe Application
 */
class MyApplication : FlutterApplication() {
  override fun onCreate() {
    super.onCreate()

    MultiDex.install(this)
  }
}