import 'package:flutter/cupertino.dart';

import '../../data_layer/model/characters.dart';

class CharactersState {
  CharactersState init() {
    return CharactersState();
  }

  CharactersState clone() {
    return CharactersState();
  }
}

class CharacterInitial extends CharactersState{}

class CharactersLoaded extends CharactersState{
  final List<Character>  characters;

  CharactersLoaded(this.characters);

}


