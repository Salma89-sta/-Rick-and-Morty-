import 'package:block/constants/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class CharactersWebServices{
  late Dio dio ;

  CharactersWebServices(){
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: Duration(seconds: 20) ,
      connectTimeout:  Duration(seconds: 20),
    );

    dio= Dio(options);
  }

  Future<List<dynamic>> getAllCharactersData()async{

    try{
      Response response = await dio.get('characters');
      print("response of data ..................${response.data.toString()}");
      return response.data;
    }catch(e)
    {
      print(e.toString());
      return [];
    }

}
}