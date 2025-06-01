import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:term_summary/components.dart';

void main() => runApp(const MyApp());

// Disable the default scroll glow
class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      scrollBehavior: NoGlowScrollBehavior(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});
  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scroll = ScrollController();
  final _aboutKey = GlobalKey();
  final _expKey = GlobalKey();
  final _eduKey = GlobalKey();
  final _projKey = GlobalKey();
  

  void _scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    // glow for images
    final imageShadow = BoxShadow(
      color: Colors.white24,
      blurRadius: 40,
      spreadRadius: 8,
    );
    // detect portrait vs. landscape
    final isPortrait =
        MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(children: [
      Center(
        // Center the content, try also with Align
        child: ConstrainedBox(
          // Constrain the width of the content
          constraints: const BoxConstraints(maxWidth: 1100),
          child: SingleChildScrollView(
            controller: _scroll,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ─── NAV BAR ───────────────────────────────────────
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NavButton('About', () => _scrollTo(_aboutKey)),
                        NavButton('Experience', () => _scrollTo(_expKey)),
                        NavButton('Education', () => _scrollTo(_eduKey)),
                        NavButton('Projects', () => _scrollTo(_projKey)),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.wb_sunny_outlined),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                // ─── HERO / PROFILE ────────────────────────────────
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: Row(
                    children: [
                      // Intro + buttons + socials
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Hi, my name is',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 20)),
                            const SizedBox(height: 8),
                            const Text('Ryan Lee',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 12),
                            const Text(
                              'Welcome to my website. Scroll down to find out more about me.',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 16),
                            ),
                            const SizedBox(height: 24),
                            Row(children: [
                              ElevatedButton(
                                onPressed: () => _scrollTo(_aboutKey),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.cyanAccent,
                                  foregroundColor: Colors.black,
                                ),
                                child: const Text('Check me out'),
                              ),
                              const SizedBox(width: 16),
                              EmailButton(toAddress: 'rleeshanyi@gmail.com', label: 'Reach me')
                            ]),
                            const SizedBox(height: 32),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                          SocialItem(
                            icon: FontAwesomeIcons.instagram,
                            label: 'Instagram',
                            url: 'https://www.instagram.com/human._.ryan/',
                          ),
                          SizedBox(width: 16),
                          SocialItem(
                            icon: FontAwesomeIcons.github,
                            label: 'GitHub',
                            url: 'https://github.com/RyanLeeShanYi',
                          ),
                          SizedBox(width: 16),
                          SocialItem(
                            icon: FontAwesomeIcons.linkedin,
                            label: 'LinkedIn',
                            url: 'https://www.linkedin.com/in/ryan-lee-a84555206?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app/',
                          ),
                        ],
                      ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 32),

                      // Profile image
                      Expanded(
                          flex: 1,
                          child: GlowImage(
                              assetPath: 'lib/assets/profile.png',
                              width: 300,
                              height: 300,
                              shadow: imageShadow))
                    ],
                  ),
                ),
                // ─── ABOUT ME ─────────────────────────────────────
                Container(key: _aboutKey),
               const StaggeredHeader('About Me', lineBefore: false),
               Padding(
                 padding:
                     const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                 child: Row(
                   children: [
                     Expanded(
                       flex: 2,
                       child: GlowImage(
                         assetPath: 'lib/assets/about.png',
                         width: 240,
                         height: 320,
                         fit: BoxFit.fitWidth,
                         shadow: imageShadow,
                       ),
                     ),
                     const SizedBox(width: 24),
                     Expanded(
                       flex: 2,
                       child: const Text(
                         "Hello I'm Ryan. I like to play sports and I am currently in multiple sports clubs. I love travelling to cold countries and exploring new places.\n\n"
                         'I am passionate about mathematics and problem solving as an aspiring engineer. I’m currently pursuing my degree in SUTD',
                         style: TextStyle(
                             color: Colors.white70, fontSize: 16, height: 1.5),
                       ),
                     ),
                   ],
                 ),
               ),

                
                // ─── EXPERIENCE ──────────────────────────────────────
                Container(key: _expKey),
                              const StaggeredHeader('Experience', lineBefore: true),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: GlowImage(
                                        assetPath: 'lib/assets/experience.png',
                                        width: 300,
                                        height: 225,
                                        fit: BoxFit.cover,
                                        shadow: imageShadow,
                                      ),
                                    ),
                                    const SizedBox(width: 30),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          ExperienceSection(
                                          title: 'Attractions Operator @ Universal Studios Singapore',
                                          subtitle: 'Part-time | Feb 2024 – Present',
                                          tasks: [
                                            'Managing ride operation, safety checks, and guest boarding with efficiency and attention to detail',
                                            'Ensuring safe and enjoyable guest experiences through ride operation and crowd control',
                                                          
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          ExperienceSection(
                                            title: 'Parcel Sorter @ The HR Ecology Pte Ltd',
                                            subtitle: 'Part-Time | Jan 2020 – Feb 2020',
                                            tasks: [
                                              'Worked fast to complete tasks and meet deadlines',
                                              'Organising inventory systematically for easy access',
                                              'Attaching identification materials to packages for delivery tracking and sorting'
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                
                // ─── Education ────────────────────────────────────────
                Container(key: _eduKey),
                const StaggeredHeader('Education', lineBefore: false),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GlowImage(
                          assetPath: 'lib/assets/experience.png',
                          width: 300,
                          height: 225,
                          fit: BoxFit.cover,
                          shadow: imageShadow,
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            EducationSection(
                              title: 'Singapore University of Technology and Design',
                              subtitle: 'Sept 2024 – Present',
                              bodyparagraph: [
                                'Bachelor of Engineering in Information Systems Technology and Design',
                                // Add more tasks/achievements as needed
                              ],
                            ),
                            SizedBox(height: 24),
                            EducationSection(
                              title: 'Temasek Junior College',
                              subtitle: 'Feb 2020 – Dec 2021',
                              bodyparagraph: [
                                'Completed GCE A-Levels',
                                'Subject combination: H2 Further Math, Math, Physics, H1 Economics, GP, PW',
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // ─── PROJECTS ────────────────────────────────────────
                Container(key: _projKey),
               const SectionHeader('Projects'),

              Center(
                child: Text(
                  'Coming Soon',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey, // You can change the color
                  ),
                ),
              ),

                // ─── THE END ─────────────────────────────────────────
                const SectionHeader('The End'),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Text(
                    'That’s all I have done so far… but more is coming soon.',
                    style: TextStyle(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ),

                // ─── FOOTER ───────────────────────────────────────────
                const Divider(color: Colors.white54, thickness: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SocialItem(
                            icon: FontAwesomeIcons.instagram,
                            label: 'Instagram',
                            url: 'https://www.instagram.com/human._.ryan/',
                          ),
                          SizedBox(width: 16),
                          SocialItem(
                            icon: FontAwesomeIcons.github,
                            label: 'GitHub',
                            url: 'https://github.com/RyanLeeShanYi',
                          ),
                          SizedBox(width: 16),
                          SocialItem(
                            icon: FontAwesomeIcons.linkedin,
                            label: 'LinkedIn',
                            url: 'https://www.linkedin.com/in/ryan-lee-a84555206?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app/',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Have something you want to reach out to me for? Contact me @ these socials or send me an email',
                          style: TextStyle(color: Colors.white54),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    if (isPortrait)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.9),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.screen_rotation, size: 64, color: Colors.white24),
                    const SizedBox(height: 24),
                    const Text(
                      'Please rotate your device\ninto landscape mode',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        height: 1.3,),
                    ),
                  ],
                ),
              ),
            ),
          ),
    ]),
    );   
  }
}

