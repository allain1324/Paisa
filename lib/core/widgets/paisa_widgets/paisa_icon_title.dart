// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/features/home/presentation/pages/home/home_cubit.dart';

class PaisaIconTitle extends StatelessWidget {
  const PaisaIconTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.wallet,
              color: context.primary,
              size: 32,
            ),
          ),
          Text(
            context.loc.appTitle,
            style: context.titleLarge?.copyWith(
              color: context.onBackground,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

class PaisaTitle extends StatelessWidget {
  const PaisaTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is CurrentIndexState,
      builder: (context, state) {
        return Text(
          context.read<HomeCubit>().getPageFromIndex().name(context),
          style: context.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: context.onBackground,
          ),
        );
      },
    );
  }
}

class PaisaIcon extends StatelessWidget {
  const PaisaIcon({
    super.key,
    this.size = 32,
  });
  final double size;
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.wallet,
      color: context.primary,
      size: size,
    );
  }
}
