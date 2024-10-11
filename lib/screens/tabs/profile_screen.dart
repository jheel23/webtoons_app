import 'dart:ui';

import 'package:anime_app/providers/webtoons_provider.dart';
import 'package:anime_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webtoons = ref.watch(webtoonsNotifierProvider);
    final theme = Theme.of(context);
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomAppBar(
            theme: theme,
            title: 'Rate Webtoons',
          ),
          SliverList.builder(
            itemCount: webtoons.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: deviceSize.height * 0.3,
              width: deviceSize.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: NetworkImage(webtoons[index].imageUrl),
                      fit: BoxFit.fill,
                      opacity: 0.8,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      filterQuality: FilterQuality.high)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 5, sigmaY: 5, tileMode: TileMode.clamp),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: deviceSize.width * 0.3,
                          height: deviceSize.height * 0.3,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              webtoons[index].imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: deviceSize.width * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: deviceSize.width * 0.5,
                              child: Text(
                                webtoons[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.headlineSmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text('Rate:',
                                style: theme.textTheme.titleSmall!
                                    .copyWith(color: Colors.white)),
                            Slider(
                              value: webtoons[index].rating,
                              onChanged: (value) {
                                ref
                                    .read(webtoonsNotifierProvider.notifier)
                                    .updateRating(webtoons[index], value);
                              },
                              min: 0,
                              max: 5,
                              divisions: 5,
                              label: webtoons[index].rating.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
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
