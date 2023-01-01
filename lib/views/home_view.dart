import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/shared/componantes/componantes.dart';
import 'package:shop/shared/cubits/home_cubit/home_cubit.dart';
import 'package:shop/views/home/search/search_view.dart';



class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
        actions: [
          IconButton(onPressed: (){navigateTo(context, SearchView());}, icon:const Icon(Icons.search))
        ],
      ),
      body:cubit.bottomsScreens[cubit.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex:cubit.currentIndex ,
        onTap: (index){
          cubit.changeBottom(index);
        },
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
        ],
      ) ,
    );
  },
);
  }
}
