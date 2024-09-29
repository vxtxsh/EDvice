package com.example.edu_bvrit

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.webkit.ValueCallback
import android.webkit.WebChromeClient
import android.webkit.WebView
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    private var filePathCallback: ValueCallback<Array<Uri>>? = null
    private val FILE_PICKER_REQUEST_CODE = 1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode == FILE_PICKER_REQUEST_CODE) {
            filePathCallback?.let { callback ->
                val result = if (resultCode == RESULT_OK) arrayOf(data?.data!!) else null
                callback.onReceiveValue(result)
                filePathCallback = null
            }
        }
        super.onActivityResult(requestCode, resultCode, data)
    }

    fun setFilePathCallback(callback: ValueCallback<Array<Uri>>) {
        filePathCallback = callback
    }
}
