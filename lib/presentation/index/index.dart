import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_derma_blog/presentation/index/index_controller.dart';
import 'package:prime_derma_blog/utils/color_constant.dart';


class IndexPage extends StatelessWidget {
  IndexPage({super.key});

  final SkinCareAwareController c = Get.put(SkinCareAwareController());

  static const _bgCream = Color(0xFFFCFAF6);
  static const _foreground = Color(0xFF003C52);

  TextStyle _display(BuildContext context, double size,
      {FontWeight weight = FontWeight.w700, Color? color, double? height}) {
    return TextStyle(
      fontFamily: 'PlayfairDisplay',
      fontSize: size,
      fontWeight: weight,
      color: color ?? _foreground,
      height: height,
    );
  }

  TextStyle _sans(BuildContext context, double size,
      {FontWeight weight = FontWeight.w500, Color? color, double? height}) {
    return TextStyle(
      fontFamily: 'DMSans',
      fontSize: size,
      fontWeight: weight,
      color: color ?? _foreground,
      height: height,
    );
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgCream,
      endDrawer: _MobileDrawer(c: c),
      body: Column(
        children: [
          _TopNav(c: c),
          Expanded(
            child: SingleChildScrollView(
              controller: c.scrollController,
              child: Column(
                children: [
                  _HeroSection(
                    display: _display,
                    sans: _sans,
                    onPrimary: c.onSigns,
                    onSecondary: c.onTypes,
                  ),
                  _AboutSection(
                    key: c.aboutKey,
                    display: _display,
                    sans: _sans,
                  ),
                  _TypesSection(
                    key: c.typesKey,
                    display: _display,
                    sans: _sans,
                  ),
                  _SignsSection(
                    key: c.signsKey,
                    display: _display,
                    sans: _sans,
                  ),
                  _PreventionSection(
                    key: c.preventionKey,
                    display: _display,
                    sans: _sans,
                  ),
                  _CtaSection(
                    key: c.ctaKey,
                    display: _display,
                    sans: _sans,
                  ),
                  _Footer(display: _display, sans: _sans),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopNav extends StatelessWidget {
  const _TopNav({required this.c});
  final SkinCareAwareController c;

  static const _foreground = Color(0xFF003C52);
  static final _coral = ColorConstant.primary;
  static const _border = Color(0xFFE8DED4);
  static const _bg = Color(0xFFFCFAF6);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        return Container(
          height: 72,
          decoration: BoxDecoration(
            color: _bg.withOpacity(0.90),
            border: const Border(bottom: BorderSide(color: _border, width: 1)),
          ),
          padding: EdgeInsets.symmetric(horizontal: isDesktop ? 16 : 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 40,
                ),
              ),
              const Spacer(),
              if (isDesktop) ...[
                TextButton(onPressed: c.onAbout, child: Text('About',style: TextStyle(color: ColorConstant.primary),)),
                TextButton(onPressed: c.onTypes, child: Text('Types',style: TextStyle(color: ColorConstant.primary),)),
                TextButton(onPressed: c.onSigns, child: Text('Warning Signs',style: TextStyle(color: ColorConstant.primary),)),
                TextButton(onPressed: c.onPrevention, child: Text('Prevention',style: TextStyle(color: ColorConstant.primary),)),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: c.onGetChecked,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _coral,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Get Checked'),
                ),
              ] else ...[
                Builder(
                  builder: (ctx) => IconButton(
                    icon: const Icon(Icons.menu, color: _foreground),
                    onPressed: () => Scaffold.of(ctx).openEndDrawer(),
                    tooltip: "Menu",
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer({required this.c});
  final SkinCareAwareController c;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Image.asset("assets/images/logo.png", height: 40),
            const SizedBox(height: 16),

            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                c.onAbout();
              },
            ),
            ListTile(
              title: const Text('Types'),
              onTap: () {
                Navigator.pop(context);
                c.onTypes();
              },
            ),
            ListTile(
              title: const Text('Warning Signs'),
              onTap: () {
                Navigator.pop(context);
                c.onSigns();
              },
            ),
            ListTile(
              title: const Text('Prevention'),
              onTap: () {
                Navigator.pop(context);
                c.onPrevention();
              },
            ),

            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  c.onGetChecked();
                },
                child: const Text('Get Checked'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _HeroSection extends StatelessWidget {
  const _HeroSection({
    required this.display,
    required this.sans,
    required this.onPrimary,
    required this.onSecondary,
  });

  final TextStyle Function(BuildContext, double,
      {FontWeight weight, Color? color, double? height}) display;
  final TextStyle Function(BuildContext, double,
      {FontWeight weight, Color? color, double? height}) sans;
  final VoidCallback onPrimary;
  final VoidCallback onSecondary;

  static const _foreground = Color(0xFF003C52);
  static const _muted = Color(0xFF6B7280);
  static final _coral = ColorConstant.primary;
  static const _coralLight = Color(0xFFFFE3DD);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;
    return Stack(
      children: [
        // Positioned.fill(
        //   child: Opacity(
        //     opacity: 0.30,
        //     child: Image.asset(
        //       'assets/images/logo.png',
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFCFAF6),
                  Color(0xFFFFF1EE),
                  Color(0xFFF1FAF6),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: isDesktop ?  100 : 20, top: isDesktop ? 100 : 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 820),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: _coralLight,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.sunny, size: 18, color: _coral),
                        const SizedBox(width: 8),
                        Text(
                          'Skin Cancer Awareness Month',
                          style: sans(context, 13,
                              weight: FontWeight.w600, color: _coral),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  RichText(
                    text: TextSpan(
                      style: display(
                          context, 54,
                          weight: FontWeight.bold,
                          color: _foreground,
                          height: 1.08,
                        ),
                      children: [
                        const TextSpan(text: 'Early Detection\n', style: TextStyle(fontSize: 50)),
                        TextSpan(text: 'Saves Lives', style: TextStyle(color: _coral,fontSize: 50)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Skin cancer is the most common cancer worldwide, but when detected early, the 5-year survival rate is 99%. Learn to protect yourself and recognize the warning signs.',
                    style: sans(context, 18,
                        weight: FontWeight.w500, color: _muted, height: 1.5),
                  ),
                  const SizedBox(height: 22),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      ElevatedButton(
                        onPressed: onPrimary,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _foreground,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 26, vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Learn Warning Signs',
                          style: sans(context, 16,
                              weight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: onSecondary,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _foreground,
                          side: const BorderSide(
                              color: Color(0x331A2333), width: 2),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 26, vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Understand the Risk',
                          style: sans(context, 16, weight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                   const SizedBox(height: 30),
                  // const Center(
                  //   child: Icon(Icons.keyboard_arrow_down,
                  //       size: 34, color: _muted),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection({super.key, required this.display, required this.sans});

  final TextStyle Function(BuildContext, double,
      {FontWeight weight, Color? color, double? height}) display;
  final TextStyle Function(BuildContext, double,
      {FontWeight weight, Color? color, double? height}) sans;

  static const _card = Color(0xFFF7F2EC);
  static const _muted = Color(0xFF6B7280);
  static final _coral = ColorConstant.primary;
  static const _coralLight = Color(0xFFFFE3DD);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;
    return Column(
      children: [
        SizedBox(height: isDesktop ?  100 : 30),
        Padding(
          padding: EdgeInsets.only(left: isDesktop ? 0 : 20),
          child: Text('Understanding the Impact',
              style: display(context, 36, weight: FontWeight.w800)),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: isDesktop ? 0 : 10, right: isDesktop ? 0 : 10),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Text(
              "Knowledge is your first line of defense. Here's what you need to know about skin cancer.",
              textAlign: TextAlign.center,
              style: sans(context, 16, color: _muted, height: 1.6),
            ),
          ),
        ),
        SizedBox(height: isDesktop ?  100 : 30),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: _card.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _StatCard(
                top: '1 in 5',
                label: 'Americans will develop skin cancer by age 70',
                icon: Icons.shield,
                iconBg: _coralLight,
                iconColor: _coral,
              ),
              _StatCard(
                top: '99%',
                label: 'Survival rate when detected early',
                icon: Icons.favorite,
                iconBg: _coralLight,
                iconColor: _coral,
              ),
              _StatCard(
                top: '9,500+',
                label: 'People diagnosed daily in the US',
                icon: Icons.remove_red_eye,
                iconBg: _coralLight,
                iconColor: _coral,
              ),
              _StatCard(
                top: '2+',
                label: 'People die from skin cancer every hour',
                icon: Icons.sunny,
                iconBg: _coralLight,
                iconColor: _coral,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.top,
    required this.label,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
  });

  final String top;
  final String label;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;

  static const _muted = Color(0xFF6B7280);
  static final _coral = ColorConstant.primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 18,
            spreadRadius: -6,
            offset: Offset(0, 8),
            color: Color(0x24000000),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(14),
            ),
            alignment: Alignment.center,
            child: Icon(icon, color: iconColor, size: 26),
          ),
          const SizedBox(height: 16),
          Text(
            top,
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: _coral,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'DMSans',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _muted,
              height: 1.4,
              overflow: TextOverflow.ellipsis
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

class _TypesSection extends StatelessWidget {
  const _TypesSection({super.key, required this.display, required this.sans});

  final TextStyle Function(BuildContext, double,
      {FontWeight weight, Color? color, double? height}) display;
  final TextStyle Function(BuildContext, double,
      {FontWeight weight, Color? color, double? height}) sans;

  static const _muted = Color(0xFF6B7280);
  static final _coral = ColorConstant.primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFCFAF6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      child: Column(
        children: [
          Text('Types of Skin Cancer',
              style: display(context, 36, weight: FontWeight.w800)),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Text(
              'Understanding the different types helps in early recognition and treatment.',
              textAlign: TextAlign.center,
              style: sans(context, 16, color: _muted, height: 1.6),
            ),
          ),
          const SizedBox(height: 26),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              const _TypeCard(
                badge: 'Low Risk',
                badgeBg: Color(0xFFDDF1E8),
                badgeFg: Color(0xFF4E8A73),
                big: '80%',
                title: 'Basal Cell Carcinoma',
                desc:
                    'The most common form, often appearing as a slightly transparent or pearly bump on sun-exposed skin. It rarely spreads but can be disfiguring if left untreated.',
              ),
              _TypeCard(
                badge: 'Medium Risk',
                badgeBg: const Color(0xFFFFE3DD),
                badgeFg: _coral,
                big: '16%',
                title: 'Squamous Cell Carcinoma',
                desc:
                    'The second most common type, often appearing as a firm red nodule or flat, scaly lesion. It can spread to other parts of the body if left untreated.',
              ),
              const _TypeCard(
                badge: 'High Risk',
                badgeBg: Color(0x1A1A2333),
                badgeFg: Color(0xFF003C52),
                big: '4%',
                title: 'Melanoma',
                desc:
                    'The most dangerous form, developing in the cells that give skin its color. It can spread quickly and affect other organs if not caught early.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TypeCard extends StatelessWidget {
  const _TypeCard({
    required this.badge,
    required this.badgeBg,
    required this.badgeFg,
    required this.big,
    required this.title,
    required this.desc,
  });

  final String badge;
  final Color badgeBg;
  final Color badgeFg;
  final String big;
  final String title;
  final String desc;

  static const _muted = Color(0xFF6B7280);
  static const _border = Color(0xFFE8DED4);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F2EC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _border, width: 1),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: badgeBg,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                badge,
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: badge == 'High Risk' ? badgeFg : badgeFg,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                big,
                style: const TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 44,
                  fontWeight: FontWeight.w800,
                  color: Color(0x33EE7C67),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF003C52),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                desc,
                style: const TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _muted,
                  height: 1.55,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SignsSection extends StatelessWidget {
   const _SignsSection({super.key, required this.display, required this.sans});

  final TextStyle Function(BuildContext, double,
      {FontWeight weight, Color? color, double? height}) display;
  final TextStyle Function(BuildContext, double,
      {FontWeight weight, Color? color, double? height}) sans;

  static const _muted = Color(0xFF6B7280);
  static const _coralLight = Color(0xFFFFE3DD);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;
    return Container(
      width: MediaQuery.of(context).size.width,
      color: _coralLight,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('The ABCDE Warning Signs',
              style: display(context, 36, weight: FontWeight.bold),),
          const SizedBox(height: 10),
          Text(
            'Use this simple guide to check your moles regularly. If you notice any of these signs, consult a dermatologist.',
            style: sans(context, 20, color: _muted, height: 1.6),
          ),
          SizedBox(height: isDesktop ? 50 : 25),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: const [
              _AbcdeItem(letter: 'A', title: 'Asymmetry', desc: "One half doesn't match the other half"),
              _AbcdeItem(letter: 'B', title: 'Border', desc: 'Edges are irregular, ragged, or blurred'),
              _AbcdeItem(letter: 'C', title: 'Color', desc: 'Uneven color with shades of brown, black, or pink'),
              _AbcdeItem(letter: 'D', title: 'Diameter', desc: 'Larger than 6mm (size of a pencil eraser)'),
              _AbcdeItem(letter: 'E', title: 'Evolving', desc: 'Size, shape, or color is changing over time'),
            ],
          ),
        ],
      ),
    );
  }
}

class _AbcdeItem extends StatelessWidget {
  const _AbcdeItem({required this.letter, required this.title, required this.desc});

  final String letter;
  final String title;
  final String desc;

  static const _muted = Color(0xFF6B7280);
  static final _coral = ColorConstant.primary;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 84,
          height: 84,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(999),
            boxShadow: const [
              BoxShadow(
                blurRadius: 18,
                spreadRadius: -8,
                offset: Offset(0, 10),
                color: Color(0x24000000),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            letter,
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: _coral,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF003C52),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'DMSans',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: _muted,
            height: 1.4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _PreventionSection extends StatelessWidget {
  const _PreventionSection({super.key, required this.display, required this.sans});

  final TextStyle Function(BuildContext, double,
      {FontWeight weight, Color? color, double? height}) display;
  final TextStyle Function(BuildContext, double,
      {FontWeight weight, Color? color, double? height}) sans;

  static const _muted = Color(0xFF6B7280);
  static final _coral = ColorConstant.primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFCFAF6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: display(context, 36, weight: FontWeight.w800),
                      children: [
                        const TextSpan(text: 'Prevention is '),
                        TextSpan(text: 'Better', style: TextStyle(color: _coral)),
                        const TextSpan(text: ' Than Cure'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Most skin cancers are preventable. Follow these guidelines to protect yourself and your loved ones.',
                    style: sans(context, 16, color: _muted, height: 1.6),
                  ),
                  const SizedBox(height: 20),
                  const _PreventionItem(
                    icon: Icons.sunny,
                    title: 'Use Sunscreen Daily',
                    desc: 'Apply SPF 30+ sunscreen 15 minutes before going outside, even on cloudy days.',
                  ),
                  const _PreventionItem(
                    icon: Icons.shield,
                    title: 'Seek Shade',
                    desc: 'Avoid direct sun exposure between 10 AM and 4 PM when UV rays are strongest.',
                  ),
                  const _PreventionItem(
                    icon: Icons.remove_red_eye,
                    title: 'Monthly Self-Exams',
                    desc: 'Check your skin monthly for new or changing spots, moles, or lesions.',
                  ),
                  const _PreventionItem(
                    icon: Icons.favorite,
                    title: 'Annual Dermatologist Visits',
                    desc: 'Get a professional skin exam once a year, especially if you have risk factors.',
                  ),
                ],
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Container(
                height: 420,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFFE3DD),
                      Color(0xFFDDF1E8),
                      Color(0xFFFCFAF6),
                    ],
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(999),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 18,
                          spreadRadius: -8,
                          offset: Offset(0, 10),
                          color: Color(0x24000000),
                        )
                      ],
                    ),
                    child: Icon(Icons.sunny, size: 74, color: _coral),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PreventionItem extends StatelessWidget {
  const _PreventionItem({required this.icon, required this.title, required this.desc});

  final IconData icon;
  final String title;
  final String desc;

  static const _muted = Color(0xFF6B7280);
  static const _sage = Color(0xFF4E8A73);
  static const _sageLight = Color(0xFFDDF1E8);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _sageLight,
              borderRadius: BorderRadius.circular(14),
            ),
            alignment: Alignment.center,
            child: Icon(icon, color: _sage, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF003C52),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: _muted,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CtaSection extends StatelessWidget {
  const _CtaSection({super.key, required this.display, required this.sans});

  final TextStyle Function(BuildContext, double,
      {FontWeight weight, Color? color, double? height}) display;
  final TextStyle Function(BuildContext, double,
      {FontWeight weight, Color? color, double? height}) sans;

  static final _coral = ColorConstant.primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF003C52),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
      child: ConstrainedBox(
        constraints:  BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
        child: Column(
          children: [
            Text(
              "Don't Wait Until It's Too Late",
              textAlign: TextAlign.center,
              style: display(context, 36,
                  weight: FontWeight.w800, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              'Schedule your skin check today. Early detection can save your life. Find a board-certified dermatologist near you.',
              textAlign: TextAlign.center,
              style: sans(context, 16,
                  weight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.70),
                  height: 1.6),
            ),
            const SizedBox(height: 18),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _coral,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  icon: const Icon(Icons.phone, size: 18),
                  label: const Text(
                    'Schedule Appointment',
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: BorderSide(
                      color: Colors.white.withOpacity(0.30),
                      width: 2,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text(
                    'Find a Dermatologist',
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            Container(height: 1, color: Colors.white.withOpacity(0.10)),
            const SizedBox(height: 18),
            Wrap(
              spacing: 18,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                _CtaInfo(icon: Icons.phone, text: '1-800-SKIN-CHECK'),
                _CtaInfo(icon: Icons.mail, text: 'info@skincareaware.org'),
                _CtaInfo(icon: Icons.location_pin, text: 'Find Local Resources'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CtaInfo extends StatelessWidget {
  const _CtaInfo({required this.icon, required this.text});
  final IconData icon;
  final String text;

  static final _coral = ColorConstant.primary;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: _coral),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'DMSans',
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.80),
          ),
        ),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.display, required this.sans});
  final TextStyle Function(BuildContext, double,
      {FontWeight weight, Color? color, double? height}) display;
  final TextStyle Function(BuildContext, double,
      {FontWeight weight, Color? color, double? height}) sans;

  static const _card = Color(0xFFF7F2EC);
  static const _muted = Color(0xFF6B7280);
  static const _border = Color(0xFFE8DED4);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
      decoration: const BoxDecoration(
        color: _card,
        border: Border(top: BorderSide(color: _border, width: 1)),
      ),
      child: ConstrainedBox(
        constraints:  BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 40,
            ),
            Text('© 2024 SkinCareAware. All rights reserved.',
                style: sans(context, 12, color: _muted)),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:get/utils.dart';
// import 'package:prime_derma_blog/utils/color_constant.dart';

// class IndexPage extends StatelessWidget {
//   const IndexPage({super.key});

//   List<_NavItem> _navItems(BuildContext context) => [
//         _NavItem("Home", () {
//           debugPrint("Home clicked");
//         }),
//         _NavItem("About Us", () {
//           debugPrint("About Us clicked");
//         }),
//         _NavItem("Services", () {
//           debugPrint("Services clicked");
//         }),
//         _NavItem("Blog", () {
//           debugPrint("Blog clicked");
//         }),
//         _NavItem("Contact Us", () {
//           debugPrint("Contact Us clicked");
//         }),
//       ];

//   @override
//   Widget build(BuildContext context) {
//     final items = _navItems(context);
//     return Scaffold(
//       appBar: IndexHeader(items: items),
//       endDrawer: Drawer(
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Image.asset(
//                   "assets/images/logo.png",
//                   height: 40,
//                 ),
//               ),
//               const Divider(height: 1),
//               Expanded(
//                 child: ListView(
//                   children: [
//                     for (final it in items)
//                       ListTile(
//                         title: Text(it.label),
//                         onTap: () {
//                           Navigator.pop(context);
//                           it.onTap();
//                         },
//                       ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(child: HeroSection())
//     );
//   }
// }

// class IndexHeader extends StatelessWidget implements PreferredSizeWidget {
//   final List<_NavItem> items;

//   const IndexHeader({super.key, required this.items});

//   @override
//   Size get preferredSize => const Size.fromHeight(80);

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isDesktop = constraints.maxWidth >= 900;
//         return Container(          
//           margin: EdgeInsets.only(left: isDesktop ? 70 : 50, right: isDesktop ? 70 : 50),
//           child: SizedBox(
//             height: preferredSize.height,
//             child: Row(
//               // mainAxisAlignment: MainAxisAlignment.spaceAround,
//               // crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                // const SizedBox(width: 16),
//                 InkWell(
//                   onTap: () {
//                     debugPrint("Logo clicked");
//                   },
//                   child: Image.asset(
//                     "assets/images/logo.png",
//                     height: 40,
//                   ),
//                 ),
//                 const Spacer(),
//                 if (isDesktop) ...[
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       for (final it in items) ...[
//                         _NavButton(
//                           label: it.label,
//                           onTap: it.onTap,
//                         ),
//                         // const SizedBox(width: 15),
//                       ],
//                     ],
//                   ),
//                 //  const SizedBox(width: 16),
//                 ] else ...[
//                   Builder(
//                     builder: (ctx) => _MobileMenuButton(
//                       onPressed: () => Scaffold.of(ctx).openEndDrawer(),
//                     ),
//                   ),
//                   //const SizedBox(width: 8),
//                 ],
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class _NavItem {
//   final String label;
//   final VoidCallback onTap;
//   _NavItem(this.label, this.onTap);
// }

// class _NavButton extends StatelessWidget {
//   final String label;
//   final bool highlighted;
//   final VoidCallback onTap;

//   const _NavButton({
//     required this.label,
//     required this.onTap,
//     this.highlighted = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final baseStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//           color: highlighted ? Colors.white : Colors.black87,
//         );

//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(20),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//         decoration: highlighted
//             ? BoxDecoration(
//                 color: Colors.pinkAccent,
//                 borderRadius: BorderRadius.circular(20),
//               )
//             : null,
//         child: Text(label, style: baseStyle),
//       ),
//     );
//   }
// }

// class _MobileMenuButton extends StatelessWidget {
//   final VoidCallback onPressed;

//   const _MobileMenuButton({required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: onPressed,
//       icon: const Icon(Icons.menu, color: Colors.black87),
//     );
//   }
// }

// class HeroSection extends StatelessWidget {
//   const HeroSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, c) {
//         final isDesktop = c.maxWidth >= 992;
//        // final maxWidth = isDesktop ? 1200.0 : double.infinity;
//         return Container(
//           padding: EdgeInsets.symmetric(
//             vertical: isDesktop ? 40 : 30,
//             horizontal: 40,
//           ),
//           margin: EdgeInsets.only(left: isDesktop ? 70 : 50, top: isDesktop ? 20 : 20, right: isDesktop ? 70 : 50, bottom: isDesktop ? 40 : 20),
//           decoration: BoxDecoration(
//             color: ColorConstant.secondary.withOpacity(0.99),
//             borderRadius: BorderRadius.circular(20)
//           ),
//           child: Center(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(maxWidth: Get.width),
//               child: isDesktop
//                   ? Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: const [
//                         Expanded(flex: 7, child: _HeroLeft()),
//                         SizedBox(width: 30),
//                         Expanded(flex: 7, child: _HeroRight()),
//                       ],
//                     )
//                   : const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _HeroLeft(),
//                         SizedBox(height: 28),
//                         _HeroRight(),
//                       ],
//                     ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class _HeroLeft extends StatelessWidget {
//   const _HeroLeft();

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, c) {
//         final isDesktop = c.maxWidth >= 600;
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Comprehensive care\nfor your skin's health\nand beauty",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: isDesktop ? 40 : 20,
//                 height: 1.08,
//                 fontWeight: FontWeight.w800,
//                 //letterSpacing: 1,
//               ),
//             ),
//             const SizedBox(height: 14),
//             Text(
//               "At Logoipsum we believe in creating digital solution that drive real-world impact. From creative strategies to cutting-edge.",
//               style: TextStyle(
//                 color: Colors.white.withValues(alpha: 0.80),
//                 fontSize: 16,
//                 height: 1.6,
//               ),
//             ),
//             const SizedBox(height: 22),

//             // CTA button
//             SizedBox(
//               height: 46,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // TODO: navigate to services
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFFFF4D8D), // highlighted
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(horizontal: 18),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 0,
//                 ),
//                 child: const Text(
//                   "View Our Services",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 28),
//             Divider(
//               thickness: 0.1
//             ),
//             // Review box
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "reviews",
//                   style: TextStyle(
//                     color: Colors.white.withValues(alpha: 0.75),
//                     fontWeight: FontWeight.w700,
//                     fontSize: 14,
//                     letterSpacing: 1.2,
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.asset(
//                         "assets/images/logo.png",
//                         width: 64,
//                         height: 64,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Row(
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "I am beyond thrilled with the results \nof my facelift.",
//                                 style: TextStyle(
//                                   color: Colors.white.withValues(alpha: 0.88),
//                                   fontSize: 20,
//                                   height: 1.4,
//                                 ),
//                               ),
//                              // const SizedBox(height: 6),
//                             ],
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(left: 20,right: 15),
//                             padding: EdgeInsets.only(left: 15,top: 6,right: 15,bottom: 6),
//                             decoration: BoxDecoration(
//                               color: Colors.white.withValues(alpha: 0.88),
//                               borderRadius: BorderRadius.circular(20)
//                             ),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   "5.0",
//                                   style: TextStyle(
//                                     color: ColorConstant.secondary,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 6),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color:  ColorConstant.secondary,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class _HeroRight extends StatelessWidget {
//   const _HeroRight();

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, c) {
//         final isDesktop = c.maxWidth >= 600;

//         return AspectRatio(
//           aspectRatio: isDesktop ? 1.25 : 1.05,
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               // Main hero image
//               Positioned.fill(
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: Image.asset(
//                     "assets/images/logo.png",
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),

//               // Contact circle overlay (bottom-left-ish)
//               Positioned(
//                 left: isDesktop ? 20 : 8,
//                 bottom: isDesktop ? 10 : 6,
//                 child: InkWell(
//                   onTap: () {
//                     // TODO: navigate to contact
//                   },
//                   child: Image.asset(
//                     "assets/images/logo.png",
//                     width: isDesktop ? 110 : 90,
//                     height: isDesktop ? 110 : 90,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
