import 'package:http/http.dart' as http;

Future<void> testApi() async {
  final url = Uri.https(
    'api.giphy.com',
    '/v1/gifs/trending',
    {
      'api_key': 'FBXMG235bXLRPUzx8udTLXBfXrEE9Ofm'
    }
  );
  try {
    final response = await http.get(url);
    if (response.statusCode == 200){
      print(response.body);
    } else {
      print('Server error:  ${response.statusCode}');
    }
  } catch (e) {
    print('Netwrok error: $e');
  }
  

}