import 'dart:convert';
import 'package:http/http.dart' as http;

class Transaction {
  final String date;
  final String description;
  final String category;
  final double cost;
  final List<String> names;
  final List<double> owedShare;
  final List<double> paidShare;
  final List<double> expectedSpent;
  final List<double> realSpent;
  final List<double> youOwe;


  Transaction({
    required this.date,
    required this.description,
    required this.category,
    required this.cost,
    required this.names,
    required this.owedShare,
    required this.paidShare,
    required this.expectedSpent,
    required this.realSpent,
    required this.youOwe,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      date: json['Date'],
      description: json['Description'],
      category: json['Category Name'],
      cost: json['Cost'].toDouble(),
      names: List<String>.from(json['names'].split(',')),
      owedShare: List<double>.from(json['owedshare'].split(',').map((e) => double.parse(e))),
      paidShare: List<double>.from(json['paidshare'].split(',').map((e) => double.parse(e))),
      expectedSpent: json['Expected Spending'].toDouble(),
      realSpent: json['Real Spending'].toDouble(),
      youOwe: json['You Owe'].toDouble(),

    );
  }

  static Future<List<Transaction>> fetchAll() async {
      final response = await http.get(Uri.parse("https://script.google.com/macros/s/AKfycby0GZStlx4K5CSxli5ks5GDZuhC34Kj8XS_vQ67ch01S4GNzdJTeA35Efzyv84ML3Tj/exec"));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Transaction.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
  }
}




