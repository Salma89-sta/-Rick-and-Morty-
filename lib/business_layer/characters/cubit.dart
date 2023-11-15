import 'package:bloc/bloc.dart';
import 'package:characters/src/characters.dart';

import '../../data_layer/model/characters.dart';
import '../../data_layer/reprository/characters_repository.dart';
import 'state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersRepository charactersRepository;
  late List<Character> characters;

  CharactersCubit(this.charactersRepository) : super(CharactersState().init());

  List<Character> getAllCharactersData(){
    charactersRepository.getAllCharactersData().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters= characters;
    } );

    return characters;

}
}
