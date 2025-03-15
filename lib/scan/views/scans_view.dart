import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:irida_qr/scan/scan.dart';

// View: ScansView
/// This is the view that will be displayed when the app read al the QR history
/// and it will be ready to scan a new QR code.
class ScansView extends StatelessWidget {
  const ScansView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Irida QR'),
        actions: const [ThemeToggleButton()],
      ),
      body: CustomScrollView(
        slivers: [
          const SectionTitle('Categorías'),
          const HorizontalSliver(
            icon: Icons.qr_code_rounded,
            label: 'Wi-Fi',
          ),
          const SectionTitle('Enlaces Recientes'),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const ScanCard(
                  title: 'Wi-Fi',
                  subtitle: 'Red de la casa',
                  icon: Icons.wifi_rounded,
                  color: Color(0xFFCBB9FD),
                );
              },
              childCount: 1,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () => context.read<ScanBloc>().add(ScanStarted()),
        tooltip: 'Increment',
        child: const Icon(Icons.qr_code_rounded),
      ),
    );
  }
}

class ScanCard extends StatelessWidget {
  const ScanCard({
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
    super.key,
  });

  // Attribute: color
  /// Color of the card.
  final Color color;

  // Attribute: icon
  /// Icon of the card.
  final IconData icon;

  // Attribute: title
  /// Title of the card.
  final String title;

  // Attribute: subtitle
  /// Subtitle of the card.
  final String subtitle;

  Color darken(Color color, [int amount = 34]) {
    assert(
      amount >= 0 && amount <= 255,
      'La cantidad debe estar entre 0 y 255.',
    );
    final r = (color.r - amount).clamp(0, 255);
    final g = (color.g - amount).clamp(0, 255);
    final b = (color.b - amount).clamp(0, 255);
    return Color.fromARGB(color.a.toInt(), r.toInt(), g.toInt(), b.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFCBB9FD),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                maxRadius: 30,
                minRadius: 20,
                backgroundColor: darken(color, 100),
                child: Icon(
                  icon,
                  color: darken(color, 0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: darken(color, 100),
                      ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: darken(color, 100),
                        fontSize: 15,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
              icon: const Icon(Icons.mode_edit_outline_rounded),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

// Widget -> SectionTitle
/// Title of the section.
///
/// This widget is used to display the title of the section in the view. Uses a
/// [SliverToBoxAdapter] to display the title inside a [CustomScrollView].
class SectionTitle extends StatelessWidget {
  const SectionTitle(
    this.title, {
    super.key,
  });

  // Attribute: title
  /// Title of the section.
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          bottom: 10,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}

class HorizontalSliver extends StatelessWidget {
  // Constructor
  const HorizontalSliver({
    required this.icon,
    required this.label,
    super.key,
  });

  // Attributes
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return CategoryCard(
              label: categories[index],
              icon: icons[index],
              categoryLength: index + 1,
              color: colors[index],
            );
          },
        ),
      ),
    );
  }
}

final List<String> categories = [
  'Wi-Fi',
  'Sitios Web',
  'Restaurantes',
  "PDF's",
];

final List<Color> colors = [
  const Color(0xFFCBB9FD),
  const Color(0xFFFDE2B9),
  const Color(0xFFFDB9EA),
  const Color(0xFFB9F5FD),
];

final List<IconData> icons = [
  IconsaxPlusLinear.wifi,
  IconsaxPlusLinear.global,
  IconsaxPlusLinear.coffee,
  IconsaxPlusLinear.note_2,
];

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.label,
    required this.icon,
    required this.categoryLength,
    this.color = const Color(0xFF021212),
    super.key,
  });

  final String label;
  final IconData icon;
  final int categoryLength;
  final Color color;

  Color darken(Color color, [int amount = 34]) {
    assert(
      amount >= 0 && amount <= 255,
      'La cantidad debe estar entre 0 y 255.',
    );
    final r = (color.r.toInt() - amount).clamp(0, 255);
    final g = (color.g.toInt() - amount).clamp(0, 255);
    final b = (color.b.toInt() - amount).clamp(0, 255);
    return Color.fromARGB(color.a.toInt(), r, g, b);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: FittedBox(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: darken(color, 100),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryLength.toString(),
                  style: TextStyle(
                    color: darken(color, 100),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 3),
                  child: Icon(
                    icon,
                    size: 13,
                    color: darken(color, 100),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
