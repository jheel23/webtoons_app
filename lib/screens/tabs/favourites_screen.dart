import 'package:anime_app/providers/webtoons_provider.dart';
import 'package:anime_app/widgets/custom_app_bar.dart';
import 'package:anime_app/widgets/custom_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesScreen extends ConsumerWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(webtoonsNotifierProvider);
    final webtoons = ref.read(webtoonsNotifierProvider.notifier).getfavorites;
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
            title: 'Favorites',
          ),
          webtoons.isEmpty
              ? SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        height: deviceHeight * 0.25,
                      ),
                      Image.asset(
                        'assets/animations/liked.gif',
                        height: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'No favorites!, try adding some!',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineSmall,
                      )
                    ],
                  ),
                )
              : SliverList.builder(
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
