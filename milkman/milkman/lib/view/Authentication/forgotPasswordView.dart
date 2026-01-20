import 'package:flutter/material.dart';
import 'package:milkman/utils/routes/route_names.dart';
import 'package:milkman/utils/theme/responsive_text.dart';
import 'package:milkman/utils/utils.dart';
// import your global Input widget file here
// import 'package:milkman/widgets/input.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  int _selected = 0; // 0 = Email, 1 = Phone

  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    const primary = Color(0xFF2B9DEE);

    return Scaffold(
      backgroundColor: scheme.surface,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back
                  IconButton(
                    onPressed: () => Navigator.maybePop(context),
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: scheme.onSurface,
                    ),
                    splashRadius: 22,
                  ),

                  const SizedBox(height: 16),

                  // Icon Circle
                  Center(
                    child: Container(
                      width: 112,
                      height: 112,
                      decoration: BoxDecoration(
                        color: primary.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.lock_reset_outlined,
                        size: 48,
                        color: primary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Title + description
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Forgot Password?',
                          textAlign: TextAlign.center,
                          style: ResponsiveText.title(context).copyWith(
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.6,
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Text(
                            "Don't worry! It happens. Please enter the address associated with your account.",
                            textAlign: TextAlign.center,
                            style: ResponsiveText.body(context).copyWith(
                              color: scheme.onSurfaceVariant,
                              fontWeight: FontWeight.w600,
                              height: 1.35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Segmented Control (Email / Phone)
                  _Segmented(
                    selectedIndex: _selected,
                    onChanged: (i) => setState(() => _selected = i),
                  ),

                  const SizedBox(height: 18),

                  // Label
                  Text(
                    _selected == 0 ? 'Email Address' : 'Phone Number',
                    style: ResponsiveText.caption(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: scheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // ✅ USE YOUR GLOBAL _Input HERE
                  if (_selected == 0)
                    Input(
                      controller: _emailCtrl,
                      hint: 'john.doe@example.com',
                      icon: Icons.mail_outline,
                      keyboardType: TextInputType.emailAddress,
                    )
                  else
                    Input(
                      controller: _phoneCtrl,
                      hint: '(555) 000-0000',
                      icon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                    ),

                  const SizedBox(height: 22),

                  // Button
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        'Send Reset Code',
                        style: ResponsiveText.body(context).copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),

                  //const SizedBox(height: 28),
                  Spacer(),
                  // Footer
                  Center(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          'Remember Password? ',
                          style: ResponsiveText.caption(context).copyWith(
                            color: scheme.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RouteNames.loginView);
                          },
                          child: Text(
                            'Login',
                            style: ResponsiveText.caption(context).copyWith(
                              color: primary,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Segmented control similar to your HTML (Email/Phone)
class _Segmented extends StatelessWidget {
  const _Segmented({required this.selectedIndex, required this.onChanged});

  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    const primary = Color(0xFF2B9DEE);

    final bg = scheme.brightness == Brightness.dark
        ? const Color(0xFF1F2937) // slate-ish
        : const Color(0xFFF0F3F4);

    final active = scheme.brightness == Brightness.dark
        ? const Color(0xFF334155) // slate-700
        : Colors.white;

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            alignment: selectedIndex == 0
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              width:
                  (MediaQuery.of(context).size.width > 480
                          ? 480
                          : MediaQuery.of(context).size.width) /
                      2 -
                  34,
              height: 44,
              decoration: BoxDecoration(
                color: active,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _SegItem(
                  label: 'Email',
                  selected: selectedIndex == 0,
                  onTap: () => onChanged(0),
                  primary: primary,
                ),
              ),
              Expanded(
                child: _SegItem(
                  label: 'Phone',
                  selected: selectedIndex == 1,
                  onTap: () => onChanged(1),
                  primary: primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SegItem extends StatelessWidget {
  const _SegItem({
    required this.label,
    required this.selected,
    required this.onTap,
    required this.primary,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 44,
        child: Center(
          child: Text(
            label,
            style: ResponsiveText.caption(context).copyWith(
              fontWeight: selected ? FontWeight.w800 : FontWeight.w700,
              color: selected ? scheme.onSurface : scheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}
