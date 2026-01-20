import 'package:flutter/material.dart';
import 'package:milkman/utils/utils.dart';
import 'package:milkman/widgets/home_order_widget.dart';

class HomeOrderView extends StatefulWidget {
  const HomeOrderView({super.key});

  @override
  State<HomeOrderView> createState() => _HomeOrderViewState();
}

class _HomeOrderViewState extends State<HomeOrderView> {
  final _searchController = TextEditingController();

  final List<String> products = const [
    'Yogurt',
    'Paneer',
    'Cheese',
    'Cow Milk',
    'Buffalo Milk',
    'Goat Milk',
    'Camel Milk',
  ];

  final List<String> images = const [
    'https://images.pexels.com/photos/5945660/pexels-photo-5945660.jpeg',
    'https://images.pexels.com/photos/17200452/pexels-photo-17200452.jpeg',
    'https://images.pexels.com/photos/773253/pexels-photo-773253.jpeg',
    'https://images.pexels.com/photos/422218/pexels-photo-422218.jpeg',
    'https://images.pexels.com/photos/26167584/pexels-photo-26167584.jpeg',
    'https://images.pexels.com/photos/28430652/pexels-photo-28430652.jpeg',
    'https://images.pexels.com/photos/7057286/pexels-photo-7057286.jpeg',
  ];

  List<int> quantities = [0, 0, 0, 0, 0, 0, 0];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scheme = Theme.of(context).colorScheme;

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
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          image: images[index],
                          name: products[index],
                          quantity: quantities[index].toString(),
                          onAdd: () {
                            setState(() {
                              quantities[index]++;
                              print(quantities[index]);
                            });
                          },
                          onRemove: () {
                            setState(() {
                              if (quantities[index] > 0) {
                                quantities[index]--;
                                print(quantities[index]);
                              }
                            });
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
