import 'package:anime_app/models/webtoon.dart';
import 'package:anime_app/providers/webtoons_provider.dart';
import 'package:anime_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CustomInfoCard extends ConsumerWidget {
  const CustomInfoCard({
    super.key,
    required this.deviceHeight,
    required this.webtoons,
    required this.deviceWidth,
    required this.theme,
  });

  final double deviceHeight;
  final Webtoon webtoons;
  final double deviceWidth;
  final ThemeData theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: deviceHeight * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Image.network(
            webtoons.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        GestureDetector(
          onTap: () {
            ref.read(webtoonsNotifierProvider.notifier).currentId = webtoons.id;
            context.push(AppRoutes.detailsRouteName);
          },
          child: Container(
            height: deviceHeight * 0.4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: deviceWidth * 0.5,
                    child: Text(webtoons.title,
                        style: theme.textTheme.titleLarge!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  Text(webtoons.author,
                      style: theme.textTheme.labelLarge!
                          .copyWith(color: Colors.white)),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(webtoons.rating.toString(),
                        style: theme.textTheme.titleMedium!
                            .copyWith(color: Colors.white)),
                    const SizedBox(width: 5),
                    const Icon(
                      Iconsax.star,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 10,
            right: 5,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                  onPressed: () {
                    ref
                        .read(webtoonsNotifierProvider.notifier)
                        .toggleFavorite(webtoons);
                  },
                  icon: Icon(
                    webtoons.favorite ? Iconsax.heart5 : Iconsax.heart,
                    color: Colors.pink,
                    size: 30,
                  )),
            )),
      ],
    );
  }
}
