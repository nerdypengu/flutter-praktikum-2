import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint1 = Paint()
      ..color = const Color(0xFF001F6C) // Darkest Blue
      ..style = PaintingStyle.fill;

    Path path1 = Path();
    path1.moveTo(0, size.height * 0.15);
    for (double i = 0; i <= size.width; i++) {
      double y =
          size.height * 0.15 + 50 * (i / size.width) * (i / size.width - 1);
      path1.lineTo(i, y);
    }
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();
    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 190, 237, 255),
          ),
          CustomPaint(
            size: const Size(double.infinity, double.infinity),
            painter: WavePainter(),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: AnimatedOpacity(
                    opacity: _isVisible ? 1.0 : 0.0,
                    duration: const Duration(seconds: 2),
                    child: Neumorphic(
                      style: const NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        intensity: 0.8,
                        boxShape: NeumorphicBoxShape.circle(),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: const CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage('assets/DSC05709.jpg'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      AnimatedOpacity(
                        opacity: _isVisible ? 1.0 : 0.0,
                        duration: const Duration(seconds: 2),
                        child: const Text(
                          'Eugenia Indrawan',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: _isVisible ? 1.0 : 0.0,
                        duration: const Duration(seconds: 2),
                        child: const Text(
                          '5026221020',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildInfoSection(
                  title: 'Unique Facts',
                  content: const [
                    '🎮 Budak Game Gacha RPG',
                    '💻 Dibully ngoding sejak kelas 4 SD',
                    '📜 Pingin jadi Game Dev tapi malah masuk Sisfor',
                  ],
                ),
                const SizedBox(height: 20),
                _buildStatsSection(),
                const SizedBox(height: 20),
                _buildSocialLinksSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(
      {required String title, required List<String> content}) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(seconds: 2),
      child: Center(
        child: _buildContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              ...content.map(
                (item) => Text(
                  item,
                  style: const TextStyle(
                    color: Color.fromARGB(230, 255, 255, 255),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(seconds: 2),
      child: Center(
        child: _buildContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Stats',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              StatRow(label: "Organization", value: "10 XP"),
              StatRow(label: "Achievements", value: "0"),
              StatRow(label: "Repos Created", value: "22"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLinksSection() {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(seconds: 2),
      child: Center(
        child: _buildContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Social Links',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '🔗 GitHub: github.com/nerdypengu',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              Text(
                '📸 Instagram: @Fox_eugenia03',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContainer({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
  }
}

class StatRow extends StatelessWidget {
  final String label;
  final String value;

  const StatRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white70),
          ),
          Text(
            value,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
