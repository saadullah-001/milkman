import 'package:flutter/material.dart';
import 'package:milkman/utils/theme/colors.dart';
import 'package:milkman/utils/theme/responsive_text.dart';

String time() {
  int hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 17) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}

class HomeOrderWidget {
  static AppBar myAppBar(BuildContext context, Size size) {
    final scheme = Theme.of(context).colorScheme;
    return AppBar(
      backgroundColor: scheme.surface,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Row(
        children: [
          SizedBox(width: size.width * 0.01),
          CircleAvatar(
            maxRadius: 18,
            child: Icon(Icons.person, color: AppColors.buttonColor, size: 28),
          ),
          SizedBox(width: size.width * 0.02),
          Text(
            '${time().toString()}, User!',
            style: ResponsiveText.body(
              context,
            ).copyWith(fontWeight: FontWeight.w800),
          ),
        ],
      ),

      actions: [
        Padding(
          padding: EdgeInsets.only(right: size.width * 0.02),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
          ),
        ),
      ],
    );
  }

  static Widget subscriptionBanner(BuildContext context, Size size) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFFFE8EA),

          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFFF6B6B)),
        ),
        child: Row(
          children: [
            Icon(
              Icons.local_fire_department_outlined,
              color: const Color(0xFFFF3B3B),
            ),
            SizedBox(width: size.width * 0.025),
            Expanded(
              child: Text(
                'Subscriptions',
                style: ResponsiveText.body(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFFFF3B3B),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: const Color(0xFFFF3B3B),
            ),
          ],
        ),
      ),
    );
  }

  static Container productCard(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: scheme.outlineVariant.withAlpha(60)),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: const Offset(0, 4),
            color: Colors.black.withAlpha(06),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://picsum.photos/200/300',
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: scheme.surfaceContainerHighest,
                  child: const Center(child: Icon(Icons.image_not_supported)),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Name',
                style: ResponsiveText.body(
                  context,
                ).copyWith(fontWeight: FontWeight.w800),
              ),
              Text(
                '100 PKR',
                style: ResponsiveText.body(
                  context,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.01),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: _quantityBtn(
                  size: size,
                  scheme: scheme,
                  icon: Icons.remove,
                ),
              ),
              SizedBox(width: size.width * 0.025),
              Text(
                '1',
                style: ResponsiveText.body(
                  context,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(width: size.width * 0.025),
              InkWell(
                onTap: () {},
                child: _quantityBtn(
                  size: size,
                  scheme: scheme,
                  icon: Icons.add,
                ),
              ),
              Spacer(),
              InkWell(onTap: () {}, child: _addBtn(scheme, size, context)),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _quantityBtn({
  required dynamic size,
  required dynamic scheme,
  required IconData icon,
}) {
  return Container(
    width: size.width * 0.072,
    height: size.height * 0.032,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: scheme.outlineVariant.withOpacity(0.5)),
    ),
    alignment: Alignment.center,

    child: Icon(icon, size: 18),
  );
}

Widget _addBtn(dynamic scheme, dynamic size, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: scheme.primary.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      "Add",
      style: TextStyle(
        color: scheme.primary,
        fontWeight: FontWeight.w700,
        fontSize: 12,
      ),
    ),
  );
}
