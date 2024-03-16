import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/src/commons/presenter/components/loaders_indicators.dart';
import 'package:gallery/src/modules/puppy/presenter/components/price_n_button_bar.dart';
import 'package:gap/gap.dart';
import '../../domain/entities/pet_details.dart';
import '../components/info_icons.dart';

var description = "Entre em contato com o Canil para mais informações.";

class PuppyDetailsBody extends StatelessWidget {
  final PuppyDetailsEntity puppy;

  const PuppyDetailsBody(this.puppy, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 400,
            child: PageView(
              allowImplicitScrolling: true,
              children: puppy.images.map(
                (i) {
                  return CachedNetworkImage(
                    imageUrl: i,
                    fit: BoxFit.cover,
                    placeholderFadeInDuration: Duration.zero,
                    fadeOutDuration: Duration.zero,
                    fadeInDuration: Duration.zero,
                    placeholder: (c, s) => Container(
                      color: const Color.fromRGBO(205, 225, 234, 1),
                      child: const ImagePlaceholderLoadingWidget(),
                    ),
                    errorWidget: (_, __, ___) => Center(
                      child: Icon(
                        CupertinoIcons.exclamationmark_triangle_fill,
                        color: Colors.red.shade300,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          // Image.network(puppy.images.first, height: 400,),
          // ImgsCarouselComponent(
          //   height: 400,
          //   pictures: puppy.images,
          // ),
          const Gap(8),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: PriceAndButtonBarComponent(puppy: puppy)),
          const Gap(16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Divider(),
          ),
          description.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Text(
                    description,
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontSize: 16),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Divider(),
                ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Divider(),
          ),
          const Gap(16),
          InfoIconsComponent(puppyDetails: puppy),
        ],
      ),
    );
  }
}
