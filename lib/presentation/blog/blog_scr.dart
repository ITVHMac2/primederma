import 'package:flutter/material.dart';


class BlogScr extends StatelessWidget {
  const BlogScr({super.key});

  TextStyle get _paragraphStyle => const TextStyle(
        fontSize: 15,
        height: 1.6,
        color: Color(0xFF333333),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050816),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPostSection(context),
          ],
        ),
      ),
    );
  }

  // - - - POST SECTION - - -
  Widget _buildPostSection(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/blog1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              _buildPostBody(context),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First paragraph
        Text(
          'Skincare is more than just a routine - it is a commitment to self care and confidence. '
          'In this blog, we explore expert approved tips and insights to help you achieve radiant, healthy skin. '
          'From understanding your skin type to choosing the right products, our comprehensive guide will empower '
          'you with the knowledge to take control of your skincare journey.',
          style: _paragraphStyle,
        ),
        const SizedBox(height: 16),

        // Second paragraph
        Text(
          'Discover the latest innovations in dermatology and learn how to tackle common skin concerns effectively. '
          'Whether you are looking for solutions to acne, dullness, or aging, our curated advice is designed to cater '
          'to your unique needs. Let us guide you toward a skincare routine that enhances your natural beauty and leaves '
          'you glowing with confidence.',
          style: _paragraphStyle,
        ),
        const SizedBox(height: 24),

        // Blockquote
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8FC),
            borderRadius: BorderRadius.circular(8),
            border: Border(
              left: BorderSide(
                color: Colors.blue.shade400,
                width: 4,
              ),
            ),
          ),
          child: Text(
            'Our blog combines motivating fitness stories and practical advice to help you stay on track. '
            'With insights from real people, expert tips, and proven strategies, you will find everything you need '
            'to stay inspired, overcome obstacles, and achieve your fitness goals.',
            style: _paragraphStyle.copyWith(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Third paragraph
        Text(
          'Skincare is more than just a routine - it is a commitment to self care and confidence. '
          'In this blog, we explore expert approved tips and insights to help you achieve radiant, healthy skin. '
          'From understanding your skin type to choosing the right products, our comprehensive guide will empower '
          'you with the knowledge to take control of your skincare journey. Whether you are looking for solutions '
          'to acne, dullness, or aging, our curated advice is designed to cater to your unique needs. Let us guide '
          'you toward a skincare routine that enhances your natural beauty and leaves you glowing with confidence.',
          style: _paragraphStyle,
        ),
        const SizedBox(height: 24),

        // Heading
        Text(
          'Key Takeaways for Your Skincare Journey',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF111827),
              ),
        ),
        const SizedBox(height: 16),

        // Paragraph before list
        Text(
          'Delve into a world of expert tips and carefully curated recommendations that have the power to transform '
          'your skincare routine into a truly effective and rewarding experience. These key takeaways are thoughtfully '
          'designed to guide you in making smarter, more informed decisions about your skincare needs. From choosing the '
          'right products to adopting healthy habits, discover the insights that will help you achieve radiant, healthy '
          'skin that reflects your inner confidence.',
          style: _paragraphStyle,
        ),
        const SizedBox(height: 16),

        // Bullet list
        _buildBulletList([
          'Knowing whether your skin is oily, dry, combination, or sensitive is the first step in creating a routine.',
          'Opt for dermatologist recommended skincare products that are formulated with high quality ingredients.',
          'Consistency is key to achieving healthy skin. Follow a daily skincare regimen that cleanses and nourishes.',
          'Sunscreen is a non negotiable step, shielding your skin from harmful UV rays and premature aging.',
          'Proper hydration supports a healthy skin barrier. Use moisturizers and drink plenty of water.',
        ]),
        const SizedBox(height: 16),

        // Last paragraph
        Text(
          'These key takeaways are thoughtfully designed to guide you in making smarter, more informed decisions '
          'about your skincare needs. From choosing the right products to adopting healthy habits.',
          style: _paragraphStyle,
        ),
      ],
    );
  }

  Widget _buildBulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '•  ',
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.4,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: _paragraphStyle,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

}





// class BlogScr extends StatelessWidget {
//   const BlogScr({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade300,
//       appBar: null,     
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(16),
//                 margin: const EdgeInsets.only(bottom: 8, top: 8),
//                 decoration: BoxDecoration(
//                   color: Color(0xFFFFFFFF),
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(
//                     color: ColorConstant.secondary.withOpacity(0.10),
//                     width: 1.5,
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: ColorConstant.homeContainerShadow.withOpacity(
//                         0.06,
//                       ),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       "assets/images/blog1.jpg",
//                       height: 700,
//                       width: Get.width - 60,
//                       fit: BoxFit.fitWidth,
//                     ),
//                     SizedBox(height: 10),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 30.0,right: 30),
//                       child: Text(
//                         "Skincare is more than just a routine—it's a commitment to self-care and confidence. In this blog, we explore expert-approved tips and insights to help you achieve radiant, healthy skin. From understanding your skin type to choosing the right products, our comprehensive guide will empower you with the knowledge to take control of your skincare journey.\n\nDiscover the latest innovations in dermatology and learn how to tackle common skin concerns effectively. Whether you're looking for solutions to acne, dullness, or aging, our curated advice is designed to cater to your unique needs. Let us guide you toward a skincare routine that enhances your natural beauty and leaves you glowing with confidence",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: ColorConstant.secondary.withOpacity(0.8),
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// class BlogPostPage extends StatelessWidget {
//   const BlogPostPage({super.key});

//   TextStyle get _paragraphStyle => const TextStyle(
//         fontSize: 15,
//         height: 1.6,
//         color: Color(0xFF333333),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF050816),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             _buildPageHeader(context),
//             _buildPostSection(context),
//             _buildScrollingTicker(),
//           ],
//         ),
//       ),
//     );
//   }

//   // - - - HEADER - - -
//   Widget _buildPageHeader(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
//       decoration: const BoxDecoration(
//         color: Color(0xFF0B1020),
//       ),
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 900),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 'How to Care for Your Skin After...',
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     children: const [
//                       Icon(Icons.person, size: 16, color: Colors.white70),
//                       SizedBox(width: 6),
//                       Text(
//                         'Admin',
//                         style: TextStyle(
//                           color: Colors.white70,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(width: 24),
//                   Row(
//                     children: const [
//                       Icon(Icons.access_time,
//                           size: 16, color: Colors.white70),
//                       SizedBox(width: 6),
//                       Text(
//                         '23 Feb 2025',
//                         style: TextStyle(
//                           color: Colors.white70,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // - - - POST SECTION - - -
//   Widget _buildPostSection(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.symmetric(vertical: 40),
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 900),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Featured image
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.asset(
//                   'assets/images/post-1.jpg', // map from images/post-1.jpg
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(height: 24),

//               // Post body
//               _buildPostBody(context),

//               const SizedBox(height: 32),

//               // Tags + social
//               _buildTagAndSocialRow(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPostBody(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // First paragraph
//         Text(
//           'Skincare is more than just a routine - it is a commitment to self care and confidence. '
//           'In this blog, we explore expert approved tips and insights to help you achieve radiant, healthy skin. '
//           'From understanding your skin type to choosing the right products, our comprehensive guide will empower '
//           'you with the knowledge to take control of your skincare journey.',
//           style: _paragraphStyle,
//         ),
//         const SizedBox(height: 16),

//         // Second paragraph
//         Text(
//           'Discover the latest innovations in dermatology and learn how to tackle common skin concerns effectively. '
//           'Whether you are looking for solutions to acne, dullness, or aging, our curated advice is designed to cater '
//           'to your unique needs. Let us guide you toward a skincare routine that enhances your natural beauty and leaves '
//           'you glowing with confidence.',
//           style: _paragraphStyle,
//         ),
//         const SizedBox(height: 24),

//         // Blockquote
//         Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: const Color(0xFFF7F8FC),
//             borderRadius: BorderRadius.circular(8),
//             border: Border(
//               left: BorderSide(
//                 color: Colors.blue.shade400,
//                 width: 4,
//               ),
//             ),
//           ),
//           child: Text(
//             'Our blog combines motivating fitness stories and practical advice to help you stay on track. '
//             'With insights from real people, expert tips, and proven strategies, you will find everything you need '
//             'to stay inspired, overcome obstacles, and achieve your fitness goals.',
//             style: _paragraphStyle.copyWith(
//               fontStyle: FontStyle.italic,
//             ),
//           ),
//         ),
//         const SizedBox(height: 24),

//         // Third paragraph
//         Text(
//           'Skincare is more than just a routine - it is a commitment to self care and confidence. '
//           'In this blog, we explore expert approved tips and insights to help you achieve radiant, healthy skin. '
//           'From understanding your skin type to choosing the right products, our comprehensive guide will empower '
//           'you with the knowledge to take control of your skincare journey. Whether you are looking for solutions '
//           'to acne, dullness, or aging, our curated advice is designed to cater to your unique needs. Let us guide '
//           'you toward a skincare routine that enhances your natural beauty and leaves you glowing with confidence.',
//           style: _paragraphStyle,
//         ),
//         const SizedBox(height: 24),

//         // Heading
//         Text(
//           'Key Takeaways for Your Skincare Journey',
//           style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xFF111827),
//               ),
//         ),
//         const SizedBox(height: 16),

//         // Paragraph before list
//         Text(
//           'Delve into a world of expert tips and carefully curated recommendations that have the power to transform '
//           'your skincare routine into a truly effective and rewarding experience. These key takeaways are thoughtfully '
//           'designed to guide you in making smarter, more informed decisions about your skincare needs. From choosing the '
//           'right products to adopting healthy habits, discover the insights that will help you achieve radiant, healthy '
//           'skin that reflects your inner confidence.',
//           style: _paragraphStyle,
//         ),
//         const SizedBox(height: 16),

//         // Bullet list
//         _buildBulletList([
//           'Knowing whether your skin is oily, dry, combination, or sensitive is the first step in creating a routine.',
//           'Opt for dermatologist recommended skincare products that are formulated with high quality ingredients.',
//           'Consistency is key to achieving healthy skin. Follow a daily skincare regimen that cleanses and nourishes.',
//           'Sunscreen is a non negotiable step, shielding your skin from harmful UV rays and premature aging.',
//           'Proper hydration supports a healthy skin barrier. Use moisturizers and drink plenty of water.',
//         ]),
//         const SizedBox(height: 16),

//         // Last paragraph
//         Text(
//           'These key takeaways are thoughtfully designed to guide you in making smarter, more informed decisions '
//           'about your skincare needs. From choosing the right products to adopting healthy habits.',
//           style: _paragraphStyle,
//         ),
//       ],
//     );
//   }

//   Widget _buildBulletList(List<String> items) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: items
//           .map(
//             (item) => Padding(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     '•  ',
//                     style: TextStyle(
//                       fontSize: 18,
//                       height: 1.4,
//                     ),
//                   ),
//                   Expanded(
//                     child: Text(
//                       item,
//                       style: _paragraphStyle,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//           .toList(),
//     );
//   }

//   Widget _buildTagAndSocialRow() {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isNarrow = constraints.maxWidth < 600;

//         return Column(
//           crossAxisAlignment:
//               isNarrow ? CrossAxisAlignment.start : CrossAxisAlignment.stretch,
//           children: [
//             Flex(
//               direction: isNarrow ? Axis.vertical : Axis.horizontal,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Tags
//                 Padding(
//                   padding: EdgeInsets.only(
//                     right: isNarrow ? 0 : 16,
//                     bottom: isNarrow ? 16 : 0,
//                   ),
//                   child: Wrap(
//                     crossAxisAlignment: WrapCrossAlignment.center,
//                     spacing: 8,
//                     runSpacing: 8,
//                     children: [
//                       const Text(
//                         'Tags:',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xFF111827),
//                         ),
//                       ),
//                       _buildTagChip('Skincare'),
//                       _buildTagChip('Healthyskin'),
//                       _buildTagChip('antiaging'),
//                     ],
//                   ),
//                 ),

//                 // Social icons
//                 Wrap(
//                   spacing: 8,
//                   children: [
//                     _buildSocialIconButton(
//                       icon: Icons.facebook,
//                       onTap: () {},
//                     ),
//                     _buildSocialIconButton(
//                       icon: Icons.linkedin,
//                       onTap: () {},
//                     ),
//                     _buildSocialIconButton(
//                       icon: Icons.camera_alt, // Instagram placeholder
//                       onTap: () {},
//                     ),
//                     _buildSocialIconButton(
//                       icon: Icons.alternate_email, // X / Twitter placeholder
//                       onTap: () {},
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

//   Widget _buildTagChip(String label) {
//     return InkWell(
//       onTap: () {
//         // Add navigation / filter logic
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(999),
//           color: const Color(0xFFF3F4F6),
//         ),
//         child: Text(
//           label,
//           style: const TextStyle(
//             fontSize: 13,
//             color: Color(0xFF374151),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSocialIconButton({
//     required IconData icon,
//     required VoidCallback onTap,
//   }) {
//     return InkResponse(
//       onTap: onTap,
//       radius: 24,
//       child: Container(
//         width: 34,
//         height: 34,
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//           color: Color(0xFF111827),
//         ),
//         child: Icon(
//           icon,
//           size: 18,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }

//   // - - - SCROLLING TICKER - - -
//   Widget _buildScrollingTicker() {
//     const text =
//         'Medical experts Women\'s health Skin Care Cardiac care   •   Medical experts Women\'s health Skin Care Cardiac care   •   ';

//     return Container(
//       color: const Color(0xFF0B1020),
//       padding: const EdgeInsets.symmetric(vertical: 12),
//       child: SizedBox(
//         height: 32,
//         child: ListView(
//           scrollDirection: Axis.horizontal,
//           physics: const BouncingScrollPhysics(),
//           children: const [
//             SizedBox(width: 16),
//             Center(
//               child: Text(
//                 text,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//             SizedBox(width: 32),
//             Center(
//               child: Text(
//                 text,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//             SizedBox(width: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }
