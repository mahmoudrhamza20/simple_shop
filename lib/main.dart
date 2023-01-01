import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/shared/cubits/home_cubit/home_cubit.dart';

import 'package:shop/shared/network/local/cache_helper.dart';
import 'package:shop/views/home_view.dart';
import 'package:shop/views/login_view.dart';
import 'package:shop/views/on_boarding_view.dart';
import 'shared/bloc_observer.dart';
import 'shared/componantes/constsants.dart';
import 'shared/network/remote/dio_helper.dart';



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  String? token = CacheHelper.getData(key: 'token');
  print('token = $token');
  Widget widget; // toggle between  onBoarding and Login with token

  if (onBoarding != null) {
    if (token != null) {
      widget = const HomeView();
    } else {
      widget = ShopLoginView();
    }
  } else {
    widget = const OnBoardingView();
  }

  runApp(Shop(
    startWidget: widget,
  ));
}

class Shop extends StatelessWidget {
  const Shop({super.key, required this.startWidget}); //constructor
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HomeCubit()
              ..getHomeData()
              ..getCategoriesData()
              ..getFavoritesData()
              ..getUserData()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: startWidget,
      ),
    );
  }
}
