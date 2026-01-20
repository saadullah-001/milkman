import 'package:flutter/material.dart';
import 'package:milkman/utils/utils.dart';
import 'package:milkman/view_model/home_order_provider.dart';
import 'package:milkman/widgets/home_order_widget.dart';
import 'package:provider/provider.dart';

class HomeOrderView extends StatefulWidget {
  const HomeOrderView({super.key});

  @override
  State<HomeOrderView> createState() => _HomeOrderViewState();
}

class _HomeOrderViewState extends State<HomeOrderView> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Hello");
    final size = MediaQuery.of(context).size;
    final scheme = Theme.of(context).colorScheme;
    final provider = Provider.of<HomeOrderProvider>(context, listen: false);

    return Scaffold(
      appBar: HomeOrderWidget.myAppBar(context, size),
      backgroundColor: scheme.surface,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
        child: Column(
          children: [
            Input(
              controller: _searchController,
              hint: 'Search for milk, yogurt...',
              icon: Icons.search,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.02),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PromoCard(
                            title: 'Save 20% on\nSubscriptions',
                            subtitle:
                                'Get fresh milk delivered daily\nand save big.',
                            icon: Icons.local_offer_outlined,
                            gradient: true,
                          ),
                          SizedBox(width: size.width * 0.02),
                          PromoCard(
                            title: 'New! Organic\nFarmstead',
                            subtitle:
                                'Try our latest artisan\nstraight from farms.',
                            icon: Icons.eco_outlined,
                            gradient: false,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    HomeOrderWidget.subscriptionBanner(context, size),
                    SizedBox(height: size.height * 0.02),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: provider.getProducts.length,
                      itemBuilder: (context, index) {
                        return Consumer<HomeOrderProvider>(
                          builder: (context, value, child) {
                            final quantity = value.getQuantities[index];
                            final image = value.getImages[index];
                            final name = value.getProducts[index];
                            return ProductCard(
                              image: image,
                              name: name,
                              quantity: quantity.toString(),
                              onAdd: () {
                                value.addQuantity(index);
                              },
                              onRemove: () {
                                if (quantity > 0) {
                                  value.removeQuantity(index);
                                }
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
