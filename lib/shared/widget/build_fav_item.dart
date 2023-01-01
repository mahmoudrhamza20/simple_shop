
import 'package:flutter/material.dart';


import '../componantes/constsants.dart';
import '../cubits/home_cubit/home_cubit.dart';

class BuildFavItem extends StatelessWidget {
  const BuildFavItem({
    Key? key, this.model,  this.isOldPrice= true,
  }) : super(key: key);
  final  model;
  final bool isOldPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model!.image!),
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                if (model!.discount != 0 && isOldPrice)
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
            const SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model!.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, height: 1.25),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        model!.price!.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: kPrimaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (model!.discount != 0 && isOldPrice)
                        Text(
                          model!.oldPrice!.toString(),
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          HomeCubit.get(context).changeFavorites(model!.id!);
                        },
                        icon: CircleAvatar(
                          radius: 15,
                          backgroundColor:HomeCubit.get(context).favorites[model!.id!]! ? kPrimaryColor : Colors.grey,
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
      ),
    );
  }
}