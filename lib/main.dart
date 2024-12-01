import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/Layout/news_layout.dart';
import 'package:news_app/Network/Local/cache_helper.dart';
import 'package:news_app/Network/Remote/dio_helper.dart';
import 'package:news_app/Shared/Bloc/cubit.dart';
import 'package:news_app/Shared/Bloc/states.dart';
import 'package:news_app/Shared/Components/components.dart';
import 'package:news_app/Styles/themes.dart';
import 'Shared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // to ensure that all methods finished before executing run app() method
  //to set minimum width and height in desktop app
// if (Platform.isWindows) {
//     DesktopWindow.setMinWindowSize(Size(400,400));
//
// }
  //Add internet connection checker
  bool result = await InternetConnectionChecker().hasConnection;
  if(result == true) {
   return;
  } else {
     showToast(message: 'No Internet Connection, check internet and try again', state: ToastStates.NOTIFY);
  }

  await CacheHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  bool? isDarkTheme = CacheHelper.getBoolean(key: 'isDark');
  runApp((MyApp(isDarkTheme)));
}

class MyApp extends StatelessWidget {
  final bool? issDark;
  MyApp(this.issDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..setMode(fromShared: issDark)
        ..getBusinessData()
        ..getSportsData()
        ..getScienceData(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'News App',
            debugShowCheckedModeBanner: false,
            //theme parameter executed when the theme mode is light
            //dark theme will executed when the theme mode is dark
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
