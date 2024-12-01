import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/Bloc/cubit.dart';
import 'package:news_app/Shared/Bloc/states.dart';
import 'package:news_app/Shared/Components/components.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BusinessScreen extends StatelessWidget {
  BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, NewsStates state) {},
        builder: (BuildContext context, NewsStates state) {
          List<dynamic> businessArticles = NewsCubit.get(context).business;

          return ScreenTypeLayout.builder(
            mobile: (p0) => Builder(
              builder: (context) {
                NewsCubit.get(context).setDesktop(false);
                return articleBuilder(list: businessArticles);
              },
            ),
            desktop: (p0) {
              return Builder(
                builder: (context) {
                  NewsCubit.get(context).setDesktop(true);
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: articleBuilder(list: businessArticles)),
                      if (businessArticles.isNotEmpty)
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            color: Colors.grey[300],
                            padding: const EdgeInsetsDirectional.all(20.0),
                            child: Text(
                              NewsCubit.get(context).selectedItem == null
                                  ? ''
                                  : '${businessArticles[NewsCubit.get(context).selectedItem!]['title']}',
                              style: const TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              );
            },
            breakpoints: const ScreenBreakpoints(
              desktop: 610.0,
              watch: 300.0,
              tablet: 300.0,
            ),
          );
        });
  }
}
