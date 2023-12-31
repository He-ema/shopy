import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy/core/utils/styles.dart';
import 'package:shopy/core/widgets/custom_button.dart';

import 'package:shopy/features/home/presentation/manager/get_products_cubit/get_products_cubit.dart';
import 'package:shopy/features/home/presentation/views/widgets/list_view_item.dart';
import 'package:shopy/features/home/presentation/views/widgets/page_view_image.dart';
import 'package:shopy/features/home/presentation/views/widgets/shimmer_body.dart';
import 'categories_row.dart';
import 'clipped_rectangle.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});
  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProductsCubit, GetProductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is GetProductsSuccess) {
          return Stack(
            children: [
              const ClippedRectangle(),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Stack(
                    children: [
                      const ClippedRectangle(bottom: true),
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'New products',
                                  style: styles.textStyle18,
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 30,
                                  child: CustomButton(
                                      text: 'View All', onPressed: () {}),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.products.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ListViewItem(
                                    productModel: state.products[index]),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
              Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: SearchAndCamera(),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  PageViewImage(products: [
                    state.products[0],
                    state.products[1],
                    state.products[2],
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  const CategoriesRow(),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              )
            ],
          );
        } else if (state is GetProductsFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const ShimmerViewBody();
        }
      },
    );
  }
}
