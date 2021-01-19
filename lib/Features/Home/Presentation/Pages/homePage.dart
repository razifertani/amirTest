import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amirTest/Core/Utils/loadingWidget.dart';
import 'package:amirTest/Features/Home/Presentation/Widgets/homeDisplay.dart';
import 'package:amirTest/Features/Home/Presentation/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is EmptyHomeState) {
          return HomeDisplay();
        }

        if (state is GoToHomeState) {
          return HomeDisplay();
        }

        if (state is LoadingHomeState) {
          return LoadingWidget();
        }

        return LoadingWidget();
      },
    );
  }
}
