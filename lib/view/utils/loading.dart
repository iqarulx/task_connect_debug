import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_connect_debug/view/utils/assets.dart';
import 'package:task_connect_debug/view/utils/colors.dart';

futureLoading(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const CircularProgressIndicator(
            color: greenColor,
          ),
        ),
      ),
    ),
  );
}

futureFileUploadLoading(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Center(
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child:
                Lottie.asset(LottieAssets.fileUpload, height: 200, width: 200)),
      ),
    ),
  );
}

futureWaitingLoading() {
  return const Center(
    child: CircularProgressIndicator(
      color: greenColor,
    ),
  );
}
