import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuliner_1/component/main_header.dart';
import 'package:kuliner_1/controller/controllers.dart';
import 'package:kuliner_1/view/product/components/product_grid.dart';
import 'package:kuliner_1/view/product/components/product_loading_grid.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(
            child: Obx((){
              if(productController.isProductLoading.value){
                return const ProductLoadingGrid();
              } else {
                if(productController.productList.isNotEmpty){
                  return ProductGrid(products: productController.productList);
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/product_not_found.png'),
                      const SizedBox(height: 10),
                      const Text('Products Not Found!')
                    ],
                  );
                }
              }
            })
          )
        ],
      ),
    );
  }
}