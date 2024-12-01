import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Network/Local/cache_helper.dart';
import 'package:news_app/Pages/search_screen.dart';
import 'package:news_app/Shared/Bloc/cubit.dart';
import 'package:news_app/Shared/Bloc/states.dart';
import 'package:news_app/Shared/Components/components.dart';

class NewsLayout extends StatelessWidget {
  NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        if (state is NewsChangeModeState){
          bool? isDark = CacheHelper.getBoolean(key: 'isDark');
          NewsCubit.get(context).setMode(fromShared: isDark);
        }
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
            'News App',
            style: TextStyle(
              color: NewsCubit.get(context).isDark? Colors.white :Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),

            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context: context, widget: SearchScreen());
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  NewsCubit.get(context).changeMode(context: context);
                },
                icon: const Icon(
                  Icons.brightness_4,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            key: key,
            currentIndex: cubit.currentIndex,
            onTap: (int index) {
              cubit.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.business_sharp),
                label: "Business",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_baseball),
                label: "Sports",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.science_outlined),
                label: "Science",
              ),
            ],
          ),
        );
      },
    );
  }
}
