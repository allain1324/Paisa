// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Project imports:
import 'package:paisa/core/extensions/build_context_extension.dart';
import 'package:paisa/core/extensions/color_extension.dart';
import 'package:paisa/core/extensions/text_style_extension.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';

class CategoryIconPickerPage extends StatefulWidget {
  const CategoryIconPickerPage({super.key});

  @override
  State<CategoryIconPickerPage> createState() => _CategoryIconPickerPageState();
}

class _CategoryIconPickerPageState extends State<CategoryIconPickerPage> {
  late IconData? selectedIcon = MdiIcons.abTesting;

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<String, List<IconData>>> map =
        paisaIconMap().entries.toList();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop(selectedIcon);
            },
            icon: const Icon(Icons.close)),
        title: Text(context.loc.chooseIcon),
        actions: [
          PaisaButton.mediumText(
            onPressed: () {
              paisaIconPicker(
                context: context,
                defaultIcon: selectedIcon!,
              ).then((resultIcon) => selectedIcon = resultIcon);
            },
            text: context.loc.more,
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PaisaButton.largeElevated(
            onPressed: () {
              GoRouter.of(context).pop(selectedIcon);
            },
            text: context.loc.done,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: map.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final iconData = map[index];
          return PaisaFilledCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  visualDensity: const VisualDensity(vertical: -3),
                  title: Text(
                    iconData.key,
                    style: context.titleMedium?.copyWith(
                      color: context.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: iconData.value.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 70,
                  ),
                  itemBuilder: (context, index) {
                    final bool isSelected =
                        selectedIcon == iconData.value[index];
                    return Container(
                      margin: const EdgeInsets.all(4),
                      decoration: isSelected
                          ? BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: context.primary,
                              ),
                              borderRadius: BorderRadius.circular(32),
                            )
                          : null,
                      child: IconButton(
                        iconSize: 30,
                        key: ValueKey(iconData.value[index].hashCode),
                        color: isSelected
                            ? context.primary
                            : Theme.of(context).iconTheme.color,
                        onPressed: () {
                          setState(() {
                            selectedIcon = iconData.value[index];
                          });
                        },
                        icon: Icon(iconData.value[index]),
                      ),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

Map<String, List<IconData>> paisaIconMap() {
  return {
    'Bills & Utilities': [
      MdiIcons.water,
      MdiIcons.electricSwitch,
      MdiIcons.gasCylinder,
      MdiIcons.lightbulb,
      MdiIcons.phoneClassic,
    ],
    'Health & Fitness': [
      MdiIcons.heart,
      MdiIcons.hospital,
      MdiIcons.pill,
      MdiIcons.stethoscope,
      MdiIcons.pillMultiple,
      MdiIcons.needle,
      MdiIcons.truckPlus,
      MdiIcons.medication,
      MdiIcons.hospitalBuilding,
    ],
    'Food & Shopping': [
      MdiIcons.food,
      MdiIcons.shopping,
      MdiIcons.basket,
      MdiIcons.cart,
      MdiIcons.cash,
      MdiIcons.creditCard,
      MdiIcons.sale,
      MdiIcons.store,
    ],
    'Transportation': [
      MdiIcons.airplane,
      MdiIcons.car,
      MdiIcons.ferry,
      MdiIcons.taxi,
      MdiIcons.tram,
      MdiIcons.train,
      MdiIcons.bus,
    ],
    'Gift and Donations': [
      MdiIcons.ring,
      MdiIcons.gift,
      MdiIcons.handHeart,
    ],
    'Shoppings': [
      MdiIcons.shoeSneaker,
      MdiIcons.tableFurniture,
      MdiIcons.tshirtCrew,
      MdiIcons.watch,
      MdiIcons.wallet,
    ],
  };
}
