import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://www.jsonkeeper.com/b/1IXK";
  final String secondUrl = "https://www.npoint.io/docs/e728bb91e0cd56cc0711";

  ApiService();

  

  // Method to perform a GET request
  Future<Map<String, dynamic>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } 
      else {
        final backupRespone = await http.get(Uri.parse(baseUrl));
        if (backupRespone.statusCode == 200) {
          return jsonDecode(response.body) as Map<String, dynamic>;
        }
        else{
          throw Exception('Failed to load data: ${response.statusCode}');
        }
      }
    } catch(e){
      return e as Map<String, dynamic>;
    }
  }
}