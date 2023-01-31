

import 'package:apitest_jsonplaceholder/app/data/api_model.dart';
import 'package:http/http.dart 'as http;

class RemoteServices{
  Future<List<Welcome>?> getPost() async{
    var client= http.Client();
    var uri= Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var reponse= await client.get(uri);
    if(reponse.statusCode==200){
      var json= reponse.body;
      return welcomeFromJson(json);
    }
  }
}