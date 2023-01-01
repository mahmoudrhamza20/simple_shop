

import 'package:flutter/material.dart';
import 'package:shop/shared/cubits/home_cubit/home_cubit.dart';

import '../../models/home_model.dart';
import '../componantes/constsants.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(productModel.image!),
                width: double.infinity,
                height: 200,
              ),
              if (productModel.discount! != 0)
                Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: const Text(
                    'DISCOUNT',
                    style: TextStyle(fontSize: 9, color: Colors.white),
                  ),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, height: 1.25),
                ),
                Row(
                  children: [
                    Text(
                      '${productModel.price!.round()}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: kPrimaryColor,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (productModel.discount! != 0)
                      Text(
                        '${productModel.oldPrice!.round()}',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        HomeCubit.get(context).changeFavorites(productModel.id!);
                        print(productModel.id!);
                      },
                      icon: CircleAvatar(
                        radius: 15,
                          backgroundColor:HomeCubit.get(context).favorites[productModel.id!]! ? kPrimaryColor : Colors.grey,
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 14,
                          ),
                      ),

                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}