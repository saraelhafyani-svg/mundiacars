import 'package:flutter/material.dart';

void main() {
  runApp(const MundiaCarsApp());
}

class MundiaCarsApp extends StatelessWidget {
  const MundiaCarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mundia Cars',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const MundiaCarsHomePage(),
    );
  }
}

class MundiaCarsHomePage extends StatelessWidget {
  const MundiaCarsHomePage({super.key});

  Widget _carCard({
    required String imagePath,
    double? height,
    double? width,
    double labelFontSize = 20,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 8,
              left: 12,
              child: Text(
                'Mundia Cars',
                style: TextStyle(
                  fontFamily: 'Charm',
                  fontSize: labelFontSize,
                  color: Colors.white.withValues(alpha: 0.92),
                  shadows: const [
                    Shadow(
                      blurRadius: 6,
                      color: Colors.black54,
                      offset: Offset(1, 1),
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

  @override
  Widget build(BuildContext context) {
    final carouselImages = [
      'assets/images/bmw.jpg',
      'assets/images/q3.jpg',
      'assets/images/peugot.jpg',
      'assets/images/prado.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mundia Cars Meriem Fennassi Ouaalani',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero image
            _carCard(
              imagePath: 'assets/images/bmw.jpg',
              height: 210,
              width: double.infinity,
              labelFontSize: 24,
            ),
            const SizedBox(height: 12),

            // Two side-by-side images
            Row(
              children: [
                Expanded(
                  child: _carCard(
                    imagePath: 'assets/images/q3.jpg',
                    height: 120,
                    labelFontSize: 18,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _carCard(
                    imagePath: 'assets/images/peugot.jpg',
                    height: 120,
                    labelFontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Heading using vintage.ttf
            const Text(
              'Luxe Drive',
              style: TextStyle(
                fontFamily: 'Vintage',
                fontSize: 34, 
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            // Exact French description text
            const Text(
              'Mundia Cars, votre partenaire de confiance pour la location et la vente de '
                  'véhicules haut de gamme au meilleur prix.\n'
                  'Profitez d’un large choix de voitures récentes, confortables et adaptées à tous vos '
                  'besoins.\n'
                  'Que ce soit pour vos déplacements professionnels ou vos voyages en famille, '
                  'Mundia Cars vous garantit qualité, sécurité et service premium.\n'
                  'Avec Mundia Cars, la route devient un plaisir !',
              style: TextStyle(
                fontSize: 13.5,
                height: 1.45,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),

            // Bottom horizontal gallery
            SizedBox(
              height: 105,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: carouselImages.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  return _carCard(
                    imagePath: carouselImages[index],
                    width: 135,
                    height: 105,
                    labelFontSize: 17,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}