// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:paisa/config/routes.dart';
import 'package:paisa/core/common.dart';

class PaisaSearchButton extends StatelessWidget {
  const PaisaSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.search,
        color: context.onBackground,
      ),
      onPressed: () {
        const SearchPageData().push(context);
      },
    );
  }
}
