import 'package:anime_app/providers/webtoons_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(webtoonsNotifierProvider);
    final webtoonItems = ref.read(webtoonsNotifierProvider.notifier).findById();
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(7),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              ref
                  .read(webtoonsNotifierProvider.notifier)
                  .toggleFavorite(webtoonItems);
              if (webtoonItems.favorite) {
                Future.delayed(const Duration(milliseconds: 1500), () {
                  if (!context.mounted) return;
                  Navigator.of(context).pop();
                });
                showDialog(
                    context: context,
                    barrierColor: Colors.transparent,
                    barrierDismissible: false,
                    builder: (context) => Center(
                          child: Image.asset(
                            'assets/animations/liked.gif',
                          ),
                        ));
              }
            },
            icon: Icon(
              webtoonItems.favorite ? Iconsax.heart5 : Iconsax.heart,
              color: Colors.pink,
              size: 30,
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: deviceSize.height,
            width: deviceSize.width,
            child: Image.network(
              webtoonItems.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: deviceSize.height,
            width: deviceSize.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.black54],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: deviceSize.width * 0.8,
                  child: Text(
                    webtoonItems.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  webtoonItems.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    webtoonItems.author,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('Rating: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        )),
                    Text(
                      webtoonItems.rating.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
