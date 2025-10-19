import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  final List<Experience> _experiences = const <Experience>[
    Experience(
      role: 'Líder Android & Mobile Craft',
      period: '2020 — Presente',
      organization: 'Startups LATAM & Consultoría independiente',
      highlights: <String>[
        'Dirijo el diseño de experiencias móviles con un enfoque especial en Android nativo y Jetpack Compose.',
        'Mentorizo a equipos en arquitectura limpia, pruebas automatizadas y accesibilidad.',
        'Integro Flutter para soluciones multiplataforma cuando potencia el roadmap del cliente.'
      ],
    ),
    Experience(
      role: 'Senior Android Engineer',
      period: '2016 — 2020',
      organization: 'Banca digital y e-commerce',
      highlights: <String>[
        'Lideré migraciones a Kotlin y modernicé pipelines CI/CD.',
        'Co-creé librerías internas de UI reutilizable y guías de diseño responsivo.',
        'Impulsé métricas de calidad basadas en crash-free sessions y NPS móvil.'
      ],
    ),
    Experience(
      role: 'Ingeniero de software móvil',
      period: '2013 — 2016',
      organization: 'Agencia creativa enfocada en productos móviles',
      highlights: <String>[
        'Diseñé experiencias inmersivas con enfoque en animaciones fluidas y microinteracciones.',
        'Coordiné la entrega de campañas interactivas para marcas globales.',
      ],
    ),
  ];

  final List<Project> _projects = const <Project>[
    Project(
      name: 'Experiencia bancaria omnicanal',
      summary:
          'Redefiní la app Android para banca digital con journeys seguros y accesibles, incrementando el onboarding en 35%.',
      techStack: <String>['Kotlin', 'Jetpack Compose', 'Hilt', 'Firebase'],
    ),
    Project(
      name: 'Suite de diseño de marca',
      summary:
          'Construí un sistema modular para campañas interactivas y soporte a creativos, integrando Flutter Web para demos rápidos.',
      techStack: <String>['Flutter', 'Animations', 'Figma Tokens', 'Node.js'],
    ),
    Project(
      name: 'SDK de pagos in-app',
      summary:
          'Desarrollé un SDK Android listo para múltiples comercios, con analítica en tiempo real y monitoreo de estabilidad.',
      techStack: <String>['Kotlin Multiplatform', 'Coroutines', 'Ktor', 'Grafana'],
    ),
  ];

  final List<String> _focusAreas = const <String>[
    'Arquitectura limpia',
    'Diseño centrado en las personas',
    'Mentoría de equipos',
    'Accesibilidad digital',
    'Jetpack Compose',
    'Flutter multiplataforma',
    'Sistemas de diseño',
    'DevOps móvil',
  ];

  final List<String> _designHighlights = const <String>[
    'Branding para fintech con esquema cromático accesible.',
    'Interfaz motion-first para una startup de movilidad.',
    'Exploraciones de tipografía modular para campañas globales.',
    'Componentes UI escalables para identidad minimalista.',
  ];

  final List<String> _values = const <String>[
    'Transparencia y comunicación honesta en cada entrega.',
    'Curiosidad constante por nuevas experiencias inmersivas.',
    'Colaboración multidisciplinaria con producto y diseño.',
    'Pasión por Android y el futuro del ecosistema móvil.',
  ];

  ThemeData _buildTheme(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    final Color primary = isDark ? const Color(0xFF57D2A3) : const Color(0xFF276749);
    final Color surface = isDark ? const Color(0xFF121417) : const Color(0xFFF6F8FA);
    final Color scaffold = isDark ? const Color(0xFF0B0C0F) : const Color(0xFFFFFFFF);

    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: brightness,
      primary: primary,
      surface: surface,
      background: scaffold,
    );

    return ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
      scaffoldBackgroundColor: scaffold,
      textTheme: Typography.englishLike2018.apply(
        fontFamily: 'Roboto',
        bodyColor: isDark ? const Color(0xFFE7ECF4) : const Color(0xFF1F2933),
        displayColor: isDark ? const Color(0xFFE7ECF4) : const Color(0xFF1F2933),
      ),
      cardTheme: CardTheme(
        color: surface,
        elevation: isDark ? 1 : 2,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      dividerColor: isDark ? const Color(0xFF2C3239) : const Color(0xFFE0E6EE),
      chipTheme: ChipThemeData(
        backgroundColor: isDark ? const Color(0xFF1E242C) : const Color(0xFFE7F5EF),
        labelStyle: TextStyle(
          color: isDark ? const Color(0xFFE7ECF4) : const Color(0xFF1F2933),
          fontWeight: FontWeight.w600,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      ),
    );
  }

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portafolio | Emilio Rivera',
      themeMode: _themeMode,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      home: PortfolioPage(
        themeMode: _themeMode,
        onToggleTheme: _toggleTheme,
        experiences: _experiences,
        projects: _projects,
        focusAreas: _focusAreas,
        designHighlights: _designHighlights,
        values: _values,
      ),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({
    super.key,
    required this.themeMode,
    required this.onToggleTheme,
    required this.experiences,
    required this.projects,
    required this.focusAreas,
    required this.designHighlights,
    required this.values,
  });

  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;
  final List<Experience> experiences;
  final List<Project> projects;
  final List<String> focusAreas;
  final List<String> designHighlights;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Emilio Rivera',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colorScheme.surface,
                border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: Text(
                      themeMode == ThemeMode.dark ? 'Tema oscuro' : 'Tema claro',
                      style: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Cambiar tema',
                    onPressed: onToggleTheme,
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (Widget child, Animation<double> animation) => RotationTransition(
                        turns: Tween<double>(begin: 0.75, end: 1).animate(animation),
                        child: ScaleTransition(scale: animation, child: child),
                      ),
                      child: Icon(
                        themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
                        key: ValueKey<ThemeMode>(themeMode),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isLarge = constraints.maxWidth >= 1000;
          final EdgeInsets padding = EdgeInsets.symmetric(
            horizontal: isLarge ? constraints.maxWidth * 0.12 : 24,
            vertical: isLarge ? 48 : 32,
          );

          return SingleChildScrollView(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _HeroSection(textTheme: textTheme, colorScheme: colorScheme),
                const SizedBox(height: 48),
                _SectionCard(
                  title: 'Trayectoria',
                  subtitle: 'Más de una década diseñando experiencias móviles memorables.',
                  child: _Timeline(experiences: experiences),
                ),
                const SizedBox(height: 32),
                _SectionCard(
                  title: 'Áreas de enfoque',
                  subtitle: 'Capas estratégicas y técnicas donde aporto mayor valor.',
                  child: _FocusGrid(focusAreas: focusAreas),
                ),
                const SizedBox(height: 32),
                _SectionCard(
                  title: 'Proyectos destacados',
                  subtitle: 'Soluciones donde combiné estrategia, diseño y código.',
                  child: _ProjectsShowcase(projects: projects),
                ),
                const SizedBox(height: 32),
                _SectionCard(
                  title: 'Galería de diseño',
                  subtitle: 'Espacio listo para tus logos, piezas visuales y composiciones.',
                  child: _Gallery(highlights: designHighlights),
                ),
                const SizedBox(height: 32),
                _SectionCard(
                  title: 'Manifiesto personal',
                  subtitle: 'Los principios que guían cada colaboración.',
                  child: _ValuesList(values: values),
                ),
                const SizedBox(height: 32),
                _SectionCard(
                  title: 'Contacto',
                  subtitle: 'Abramos conversación sobre el próximo reto.',
                  child: _ContactSection(colorScheme: colorScheme, textTheme: textTheme),
                ),
                const SizedBox(height: 48),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '© ${DateTime.now().year} Emilio Rivera. Construido con Flutter.',
                    style: textTheme.labelMedium?.copyWith(color: colorScheme.onSurface.withOpacity(0.6)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({required this.textTheme, required this.colorScheme});

  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool isWide = constraints.maxWidth > 720;
        final Widget portrait = CircleAvatar(
          radius: isWide ? 68 : 54,
          backgroundColor: colorScheme.primary.withOpacity(0.15),
          child: Icon(
            Icons.android_outlined,
            color: colorScheme.primary,
            size: isWide ? 68 : 52,
          ),
        );

        final Widget intro = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hola, soy Emilio Rivera',
              style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700, height: 1.05),
            ),
            const SizedBox(height: 16),
            Text(
              'Apasionado por Android, el diseño de experiencias y la ingeniería móvil que conecta personas con productos memorables.',
              style: textTheme.titleMedium?.copyWith(height: 1.5),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: const <Widget>[
                _HeroBadge(label: 'Android Lead'),
                _HeroBadge(label: 'Craft Lover'),
                _HeroBadge(label: 'Diseñador de experiencias'),
              ],
            ),
          ],
        );

        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: intro),
              const SizedBox(width: 48),
              portrait,
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            portrait,
            const SizedBox(height: 24),
            intro,
          ],
        );
      },
    );
  }
}

class _HeroBadge extends StatelessWidget {
  const _HeroBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: colorScheme.primary.withOpacity(0.1),
        border: Border.all(color: colorScheme.primary.withOpacity(0.4)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.primary,
              ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            Text(
              subtitle,
              style: textTheme.titleMedium?.copyWith(color: colorScheme.onSurface.withOpacity(0.7)),
            ),
            const SizedBox(height: 24),
            child,
          ],
        ),
      ),
    );
  }
}

class _Timeline extends StatelessWidget {
  const _Timeline({required this.experiences});

  final List<Experience> experiences;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: experiences.map((Experience experience) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.only(top: 6, right: 16),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      experience.role,
                      style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${experience.organization} • ${experience.period}',
                      style: textTheme.labelLarge?.copyWith(color: colorScheme.onSurface.withOpacity(0.6)),
                    ),
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: experience.highlights
                          .map(
                            (String highlight) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text('• '),
                                  Expanded(
                                    child: Text(
                                      highlight,
                                      style: textTheme.bodyMedium?.copyWith(height: 1.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _FocusGrid extends StatelessWidget {
  const _FocusGrid({required this.focusAreas});

  final List<String> focusAreas;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        final int columnCount;
        if (width > 900) {
          columnCount = 4;
        } else if (width > 680) {
          columnCount = 3;
        } else if (width > 420) {
          columnCount = 2;
        } else {
          columnCount = 1;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: focusAreas.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columnCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: columnCount == 1 ? 5 : 2.8,
          ),
          itemBuilder: (BuildContext context, int index) {
            final String area = focusAreas[index];
            return DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Theme.of(context).chipTheme.backgroundColor,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Text(
                    area,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _ProjectsShowcase extends StatelessWidget {
  const _ProjectsShowcase({required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool isWide = constraints.maxWidth > 900;
        final int crossAxisCount = isWide
            ? 3
            : constraints.maxWidth > 640
                ? 2
                : 1;
        final double spacing = 20;
        final double itemWidth = (constraints.maxWidth - spacing * (crossAxisCount - 1)) / crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: projects.map((Project project) {
            return SizedBox(
              width: itemWidth,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: colorScheme.surface,
                  border: Border.all(color: colorScheme.outline.withOpacity(0.08)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        project.name,
                        style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        project.summary,
                        style: textTheme.bodyMedium?.copyWith(height: 1.5),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 10,
                        runSpacing: 8,
                        children: project.techStack
                            .map(
                              (String tech) => Chip(
                                label: Text(tech),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _Gallery extends StatelessWidget {
  const _Gallery({required this.highlights});

  final List<String> highlights;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 3,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                colors: <Color>[
                  colorScheme.primary.withOpacity(0.18),
                  colorScheme.primary.withOpacity(0.06),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: colorScheme.primary.withOpacity(0.25)),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.brush_rounded, color: colorScheme.primary, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    'Espacio reservado para tus logos, UI kits y mockups.',
                    style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Simplemente agrega tus recursos en assets/logos y actualiza esta sección para mostrarlos.',
                    style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface.withOpacity(0.7), height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: highlights.map((String highlight) {
            return _GalleryHighlight(text: highlight);
          }).toList(),
        ),
      ],
    );
  }
}

class _GalleryHighlight extends StatelessWidget {
  const _GalleryHighlight({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outline.withOpacity(0.12)),
        color: colorScheme.surface,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.auto_awesome, color: colorScheme.primary.withOpacity(0.8)),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: textTheme.bodyMedium?.copyWith(height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ValuesList extends StatelessWidget {
  const _ValuesList({required this.values});

  final List<String> values;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: values.map((String value) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Icon(Icons.check_circle_outline, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  value,
                  style: textTheme.bodyMedium?.copyWith(height: 1.5),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection({required this.colorScheme, required this.textTheme});

  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Disponible para retos Android, consultoría mobile y mentoría técnica.',
          style: textTheme.titleMedium?.copyWith(height: 1.5),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: const <Widget>[
            _ContactChip(icon: Icons.mail_outline, label: 'emilio.rivera.dev@gmail.com'),
            _ContactChip(icon: Icons.public, label: 'linkedin.com/in/emiliorivera'),
            _ContactChip(icon: Icons.play_circle_outline, label: 't.me/emiliorivera'),
          ],
        ),
      ],
    );
  }
}

class _ContactChip extends StatelessWidget {
  const _ContactChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: colorScheme.primary.withOpacity(0.25)),
        color: colorScheme.primary.withOpacity(0.08),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: 20, color: colorScheme.primary),
            const SizedBox(width: 10),
            Text(
              label,
              style: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600, color: colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}

class Experience {
  const Experience({
    required this.role,
    required this.period,
    required this.organization,
    required this.highlights,
  });

  final String role;
  final String period;
  final String organization;
  final List<String> highlights;
}

class Project {
  const Project({
    required this.name,
    required this.summary,
    required this.techStack,
  });

  final String name;
  final String summary;
  final List<String> techStack;
}
