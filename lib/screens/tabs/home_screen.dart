import 'package:anime_app/providers/webtoons_provider.dart';
import 'package:anime_app/widgets/custom_app_bar.dart';
import 'package:anime_app/widgets/custom_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webtoons = ref.watch(webtoonsNotifierProvider);
    final theme = Theme.of(context);
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomAppBar(
            theme: theme,
            title: 'Discover',
          ),
          SliverList.builder(
              itemCount: webtoons.length,
              itemBuilder: (context, index) {
                return CustomInfoCard(
                    deviceHeight: deviceHeight,
                    webtoons: webtoons[index],
                    deviceWidth: deviceWidth,
                    theme: theme);
              }),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: kBottomNavigationBarHeight + 50,
            ),
          )
        ],
      ),
    );
  }
}
