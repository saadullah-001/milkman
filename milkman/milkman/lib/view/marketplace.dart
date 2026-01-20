import 'package:flutter/material.dart';
import 'package:milkman/utils/theme/colors.dart';

class MarketplaceView extends StatefulWidget {
  const MarketplaceView({super.key});

  @override
  State<MarketplaceView> createState() => _MarketplaceViewState();
}

class _MarketplaceViewState extends State<MarketplaceView> {
  final int _navIndex = 1;

  final items = const <MarketItem>[
    MarketItem(
      title: ' Rajasthani Goat',
      subtitle: 'Current Bid: ₹15,000',
      meta: 'Ends in 2h 15m',
      metaEmphasis: true,
      verified: true,
      //  imageUrl:
      //      'https://images.unsplash.com/photo-1543248939-4296e1fea89b?w=800',
    ),
    MarketItem(
      title: ' Sahiwal Cow',
      subtitle: 'Current Bid: ₹75,000',
      meta: 'Ends in 5h 30m',
      verified: false,
      // imageUrl:
      //     'https://images.unsplash.com/photo-1546447147-3fc2b8181a2a?w=800',
    ),
    MarketItem(
      title: ' Bikaneri Sheep',
      subtitle: 'Buy Now: ₹12,500',
      meta: 'Jaipur, Rajasthan',
      verified: false,
      //   imageUrl:
      //      'https://images.unsplash.com/photo-1553284965-83fd3e82fa5a?w=800',
    ),
    MarketItem(
      title: ' Murrah Buffalo',
      subtitle: 'Current Bid: ₹90,000',
      meta: 'Ends in 1d 4h',
      verified: false,
      //   imageUrl:
      //       'https://images.unsplash.com/photo-1594761051656-7d6b5a6a3e1a?w=800',
    ),
    MarketItem(
      title: ' Goat Pair',
      subtitle: 'Current Bid: ₹28,000',
      meta: 'Ends in 3d 8h',
      verified: true,
      //   imageUrl:
      //       'https://images.unsplash.com/photo-1517849845537-4d257902454a?w=800',
    ),
    MarketItem(
      title: 'Gir Cow',
      subtitle: 'Current Bid: ₹65,000',
      meta: 'Ends in 1h 5m',
      metaEmphasis: true,
      verified: false,
      //    imageUrl:
      //       'https://images.unsplash.com/photo-1560807707-8cc77767d783?w=800',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Container(
          decoration: BoxDecoration(
            color: cs.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDark ? 0.25 : 0.06),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: cs.onSurface),
                  onPressed: () {},
                ),
                Expanded(
                  child: Text(
                    'Animal Marketplace',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: cs.onSurface,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search, color: cs.onSurface),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.add, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: SafeArea(
        top: false,
        child: Column(
          children: [
            _PaymentBanner(onClose: () {}),
            const SizedBox(height: 8),
            _FilterChips(
              onFilters: () {},
              onCategory: () {},
              onLocation: () {},
              onPrice: () {},
              onEndingSoon: () {},
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 120, top: 4),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.72,
                  ),
                  itemCount: items.length,
                  itemBuilder: (_, i) => _MarketCard(item: items[i]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentBanner extends StatelessWidget {
  const _PaymentBanner({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = AppColors.buttonColor.withOpacity(isDark ? 0.20 : 0.10);

    return Container(
      padding: const EdgeInsets.all(16),
      color: bg,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.buttonColor.withOpacity(isDark ? 0.30 : 0.20),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.verified_user,
              color: isDark ? Colors.white : AppColors.buttonColor,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Your Payment is Secure. Funds are held until you confirm delivery.',
              style: TextStyle(fontSize: 13.5, height: 1.25),
            ),
          ),
          IconButton(
            onPressed: onClose,
            icon: Icon(
              Icons.close,
              color: Theme.of(
                context,
              ).textTheme.bodyMedium?.color?.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChips extends StatelessWidget {
  const _FilterChips({
    required this.onFilters,
    required this.onCategory,
    required this.onLocation,
    required this.onPrice,
    required this.onEndingSoon,
  });

  final VoidCallback onFilters;
  final VoidCallback onCategory;
  final VoidCallback onLocation;
  final VoidCallback onPrice;
  final VoidCallback onEndingSoon;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final border = BorderSide(
      color: (isDark ? Colors.white : Colors.black).withOpacity(0.12),
    );

    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              shape: const StadiumBorder(),
              elevation: 0,
            ),
            onPressed: onFilters,
            icon: const Icon(Icons.tune, size: 18),
            label: const Text(
              'Filters',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 10),
          _OutlinedChipButton(
            text: 'Goats',
            trailing: Icons.arrow_drop_down,
            border: border,
            onTap: onCategory,
          ),
          const SizedBox(width: 10),
          _OutlinedChipButton(
            text: 'Location',
            trailing: Icons.arrow_drop_down,
            border: border,
            onTap: onLocation,
          ),
          const SizedBox(width: 10),
          _OutlinedChipButton(
            text: 'Price',
            trailing: Icons.arrow_drop_down,
            border: border,
            onTap: onPrice,
          ),
          const SizedBox(width: 10),
          _OutlinedChipButton(
            text: 'Ending Soon',
            border: border,
            onTap: onEndingSoon,
          ),
        ],
      ),
    );
  }
}

class _OutlinedChipButton extends StatelessWidget {
  const _OutlinedChipButton({
    required this.text,
    required this.border,
    required this.onTap,
    this.trailing,
  });

  final String text;
  final BorderSide border;
  final VoidCallback onTap;
  final IconData? trailing;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? const Color(0xFF2A3440) : Colors.white;

    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: bg,
          border: Border.fromBorderSide(border),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 6),
              Icon(trailing, size: 20),
            ],
          ],
        ),
      ),
    );
  }
}

class _MarketCard extends StatelessWidget {
  const _MarketCard({required this.item});

  final MarketItem item;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final cardBg = isDark ? const Color(0xFF1B2530) : Colors.white;
    final border = (isDark ? Colors.white : Colors.black).withOpacity(0.12);

    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.18 : 0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 1,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Image.network(item.imageUrl, fit: BoxFit.cover),
                    if (item.verified)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDCFCE7).withOpacity(0.85),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.verified,
                                size: 14,
                                color: Color(0xFF16A34A),
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Verified Seller',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF15803D),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              item.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.subtitle,
              style: TextStyle(
                fontSize: 12.5,
                color: (isDark ? Colors.white : Colors.black).withOpacity(0.60),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.meta,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: item.metaEmphasis
                    ? FontWeight.w800
                    : FontWeight.w600,
                color: item.metaEmphasis
                    ? const Color(0xFFD97706) // amber
                    : (isDark ? Colors.white : Colors.black).withOpacity(0.45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MarketItem {
  final String title;
  final String subtitle;
  final String meta;
  final bool metaEmphasis;
  final bool verified;
  // final String imageUrl;

  const MarketItem({
    required this.title,
    required this.subtitle,
    required this.meta,
    ////  required this.imageUrl,
    this.metaEmphasis = false,
    this.verified = false,
  });
}
