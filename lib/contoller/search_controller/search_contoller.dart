import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchCOntroller with ChangeNotifier {
  List<dynamic> searchResults = [];
  bool isLoading = false;

  // Function to handle API Call
  Future<void> searchProducts(String query) async {
    final String apiUrl = 'https://real-time-amazon-data.p.rapidapi.com/search';
    final Map<String, String> headers = {
      'X-Rapidapi-Key': '1ffed9338emsh81419ee580155c7p155293jsn7fcddb9c6982',
      'X-Rapidapi-Host': 'real-time-amazon-data.p.rapidapi.com',
    };
    isLoading = false;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse(
            '$apiUrl?query=$query&page=1&country=US&sort_by=RELEVANCE&product_condition=ALL&is_prime=false'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        searchResults = json.decode(response.body)['products'] ?? [];
        isLoading = false;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print('Error: $e');
    }
  }
}
