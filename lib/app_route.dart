import 'package:block/data_layer/reprository/characters_repository.dart';
import 'package:block/data_layer/web_services/characters_webservices.dart';
import 'package:block/presentation_layer/screens/characters_details.dart';
import 'package:block/presentation_layer/screens/characters_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_layer/characters/cubit.dart';
import 'constants/strings.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

AppRouter(){
  charactersRepository= CharactersRepository( CharactersWebServices());
  charactersCubit= CharactersCubit(charactersRepository);
}

  Route? generateRout(RouteSettings settings){
    switch(settings.name){
      case charactersScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create:(BuildContext context)=> CharactersCubit(charactersRepository) ,
          child: CharacterScreen(),
        ));

      case charactersDetailsScreen:
        return MaterialPageRoute(builder: (_) =>  CharactersDetailsScreen());

    }
  }
}