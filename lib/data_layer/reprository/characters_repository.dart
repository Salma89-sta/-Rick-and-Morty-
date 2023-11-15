import 'package:block/data_layer/web_services/characters_webservices.dart';
import 'package:flutter/cupertino.dart';

import '../model/characters.dart';

class CharactersRepository{
  CharactersWebServices charactersWebServices;
  CharactersRepository( this.charactersWebServices);


  Future<List<Character>> getAllCharactersData ()async{
    final characters =await  charactersWebServices.getAllCharactersData();
    return characters.map((character) => Character.fromJson(character)).toList();
  }

}