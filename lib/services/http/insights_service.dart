/*
  Copyright 2024 Srisoftwarez. All rights reserved.
  Use of this source code is governed by a BSD-style license that can be
  found in the LICENSE file.
*/

import 'dart:convert';
import 'http_config.dart';
import 'package:http/http.dart' as http;

class InsightsService extends HttpConfig {
  getDomain() async {
    var data = await super.getdomain();
    var url = Uri.parse("$data/insights.php");
    return url;
  }

  getHeader() async {
    var headers = await super.getHeaders();
    return headers;
  }

  Future getChartData({required Map formData}) async {
    try {
      var url = await getDomain();
      var headers = await getHeader();
      var message =
          await http.post(url, headers: headers, body: jsonEncode(formData));
      var response = json.decode(message.body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
