import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:async';

// ===== OMEGA Shield Design Tokens =====
const kPink = Color(0xFFFF0055);
const kPurple = Color(0xFF8A2BE2);
const kDesktopUA =
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const OmegaShield());
}

class OmegaShield extends StatelessWidget {
  const OmegaShield({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'OMEGA Shield',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF0A0A1A),
          brightness: Brightness.dark,
          fontFamily: 'Tajawal',
        ),
        home: const SplashScreen(),
      );
}

// ===== 1. SPLASH =====
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: ShaderMask(
            shaderCallback: (r) => const LinearGradient(
                    colors: [kPink, kPurple])
                .createShader(r),
            child: const Text('\u03A9MEGA\u276F\u276F\ud83e\ude78',
                style: TextStyle(
                    fontSize: 48,
// ===== 2. MAIN (Dashboard) =====
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _readClipboard(); // Auto-paste Binance link if present
  }

  Future<void> _readClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final t = data?.text ?? '';
    if (t.contains('binance.com') && mounted) {
      setState(() => ctrl.text = t.trim());
    }
  }

  void _launch() {
    final url = ctrl.text.trim();
    if (url.isEmpty || !url.contains('binance.com')) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('الرجاء لصق رابط التحقق من Binance')));
      return;
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => WebViewScreen(url: Uri.parse(url))));
  }

  @override
  Widget build(BuildContext context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF0A0A1A), Color(0xFF140A24)])),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('\u03A9MEGA\u276F\u276F\ud83e\ude78 Proxy 3',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const SizedBox(height: 8),
                      const Text(
                          'أداة احترافية لتخطي تحميل التطبيق - Binance KYC',
                          style: TextStyle(
                              color: Colors.white70, fontSize: 14)),
                      const SizedBox(height: 32),
                      _glass(
                        child: Column(
                          children: [
                            TextField(
                              controller: ctrl,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  hintText:
                                      'ألصق رابط التحقق من Binance هنا...',
                                  hintStyle:
                                      TextStyle(color: Colors.white38),
                                  border: InputBorder.none),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: _launch,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: const LinearGradient(
                                  colors: [kPink, kPurple])),
                          child: const Text('بدء التحقق الآن',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('أداة احترافية صُممت لتفادي تحميل تطبيق بايننس',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 40),
                      _link('إذا واجهتك مشكلة تواصل مع المطور: @Mohamed77Omega',
                          'https://t.me/Mohamed77Omega'),
                      const SizedBox(height: 6),
                      _link('القناة الرسمية للمطور', 'https://t.me/O_m_e_g_a_0'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _glass({required Widget child}) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withValues(alpha: 0.12))),
        child: child,
      );

  Widget _link(String label, String url) => GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => WebViewScreen(url: Uri.parse(url)))),
        child: Text(label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: kPurple, fontSize: 13)),
      );
}

                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      );
}

// ===== 3. WebView (Core Bypass Engine) =====
class WebViewScreen extends StatefulWidget {
  final Uri url;
  const WebViewScreen({super.key, required this.url});
  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  double progress = 0.0;

  bool _isAppScheme(String u) =>
      u.startsWith('binance://') ||
      u.contains('play.google.com') ||
      u.contains('apps.apple.com') ||
      u.contains('market://');

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A0A1A),
          title: const Text('\u03A9MEGA Shield',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(3),
            child: LinearProgressIndicator(
                value: progress / 100,
                minHeight: 3,
                backgroundColor: Colors.transparent,
                valueColor: const AlwaysStoppedAnimation(kPink)),
          ),
        ),
        body: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(widget.url.toString())),
          initialSettings: InAppWebViewSettings(
            userAgent: kDesktopUA,
            mediaPlaybackRequiresUserGesture: false,
            javaScriptEnabled: true,
            clearCache: false,
          ),
          onProgressChanged: (c, p) => setState(() => progress = p.toDouble()),
          shouldOverrideUrlLoading: (c, nav) async {
            final u = nav.url.toString();
            // Block Binance trying to force the official app / store
            if (_isAppScheme(u)) return NavigationActionPolicy.CANCEL;
            return NavigationActionPolicy.ALLOW;
          },
        ),
      );
}

