

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/categories_model.dart';
import '../cubits/home_cubit/home_cubit.dart';

class CustomCategoriesItem extends StatelessWidget {
  const CustomCategoriesItem({
    Key? key, this.dataModel,
  }) : super(key: key);
  final DataModel? dataModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image(
              image: NetworkImage(
                  dataModel!.image!),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Container(
              width: 100,
              color: Colors.black.withOpacity(0.8),
              child:  Text(
                dataModel!.name!,
                textAlign: TextAlign.center,
                maxLines: 1,
                style:const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,

                ),
              ),
            ),
          ],
        );
      },
    );
  }
}