import 'package:block/business_layer/characters/cubit.dart';
import 'package:block/business_layer/characters/state.dart';
import 'package:block/constants/app_colors.dart';
import 'package:block/presentation_layer/widgets/character_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_layer/model/characters.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {

  late List<Character> allCharacters;

  @override
  void initState() {
    super.initState();

    //read all data from cubit
    allCharacters= BlocProvider.of<CharactersCubit>(context).getAllCharactersData();
  }

  Widget buildBlocWidget(){
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return buildLoadedListWidget();
        } else {
          return showLoadingIndicator();
        };
      });
  }
Widget showLoadingIndicator(){
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.grey,
      ),
    );
}
  Widget buildLoadedListWidget(){
    return SingleChildScrollView(
      child: Column(
        children: [
          buildCharacterList(),
        ],
      ),
    );
  }

  Widget buildCharacterList(){
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      childAspectRatio: 2/3,
    ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: allCharacters.length,
        itemBuilder: (ctx, index){
      //TODO
      return CharacterItemWidget();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.yellow,
          title: Text("Characters", style: TextStyle(color: AppColors.grey),),
        ),
      body: buildBlocWidget(),
    );
  }
}
