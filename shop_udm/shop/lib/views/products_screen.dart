import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/utils/app_route.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<Products>(context, listen: false).loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final productItems = products.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Produtos'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: products.itemCount,
            itemBuilder: (ctx, i) => Column(
              children: [
                ProductItem(productItems[i]),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
