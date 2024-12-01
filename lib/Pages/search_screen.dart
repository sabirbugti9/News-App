import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/Bloc/cubit.dart';
import 'package:news_app/Shared/Bloc/states.dart';
import 'package:news_app/Shared/Components/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context, state) {},
        builder: (context, state) {
        var cubit = NewsCubit.get(context);
        var list = cubit.search;
          return  Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                } ,
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
              title:  Container(
                decoration: BoxDecoration(
                  color: NewsCubit.get(context).isDark? Colors.grey[700]
                      : Colors.grey[200],
                  borderRadius: BorderRadiusDirectional.circular(6.0),
                ),
                padding: const EdgeInsetsDirectional.only(top: 3.0),
                width: 300.0,
                height: 44.0,
                child: defaultFormField(
                    type: TextInputType.text,
                    hint: 'Search',
                    controller: searchController,
                    style: TextStyle(
                        color: Theme.of(context).inputDecorationTheme.labelStyle?.color,
                    ),
                    preficon: Icons.search,
                    prefixColor: Theme.of(context).inputDecorationTheme.prefixIconColor,
                    fillColor:  Theme.of(context).inputDecorationTheme.fillColor,
                    hintColor:  Theme.of(context).inputDecorationTheme.hintStyle?.color,
                    inputBorder: InputBorder.none,
                    validator: (String? value){
                      if(value!.isEmpty){
                        return ('search data must not be null');
                      }
                      return null;
                    },
                    onChange: (String value) {
                      cubit.getSearchData(value: value);
                    }
                ),
              ),
            ),
            body: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: articleBuilder(list: list , isSearch: true)),
              ],
            ),
          );
        },

    );
  }
}

