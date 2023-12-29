import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http; 



final weatherProvider =  FutureProvider<double>((ref) async {

  final response = await http.get(Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=-33.8678&longitude=151.2073&current=temperature_2m&timezone=Australia%2FSydney&forecast_days=1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final temperature = data['current']['temperature_2m'];
      return temperature.toDouble();
    } else {
      throw Exception('Failed to load data');
    }
  }
  
);
