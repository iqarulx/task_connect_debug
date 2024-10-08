/*
  Copyright 2024 Srisoftwarez. All rights reserved.
  Use of this source code is governed by a BSD-style license that can be
  found in the LICENSE file.
*/

import 'package:flutter/material.dart';
import 'package:task_connect_debug/services/local_db/local_db.dart';
import 'package:task_connect_debug/view/auth/login.dart';
import 'package:task_connect_debug/view/utils/confirm_dialog.dart';
import 'package:task_connect_debug/view/utils/snackbar.dart';

logout(context) async {
  await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const ConfirmDialog(
            title: "Logout",
            content: "Are you sure want to logout?",
          )).then((onValue) {
    if (onValue) {
      LocalDBConfig().clearDB().then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
        );
        showSnackBar(context, content: "Logout Successfully", isSuccess: true);
      });
    }
  });
}
