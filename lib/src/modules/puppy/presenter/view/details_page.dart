import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/src/commons/presenter/components/circular_loading.dart';
import 'package:gallery/src/modules/puppy/domain/entities/pet_details.dart';
import 'package:gallery/src/modules/puppy/presenter/components/price_n_button_bar.dart';
import 'package:gallery/src/modules/puppy/puppy_module.dart';
import 'package:gap/gap.dart';
import '../../data/puppy_datasource.dart';
import '../components/imgs_carousel.dart';
import '../components/info_icons.dart';

var description =
    "Um verdadeiro ladrão de chinelos, não pode dar bobeira que você sempre vai achar seu chinelo em cima do sofá.";

class DetailsPage extends StatelessWidget {
  final int petId;

  const DetailsPage({
    super.key,
    required this.petId,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        previousPageTitle: 'Galeria',
        automaticallyImplyLeading: true,
        middle: Text('Detalhes'),
      ),
      child: SafeArea(
        child: FutureBuilder<PuppyDetailsEntity>(
          future: puppyIoC.get<PuppyDetailsDatasource>().getEntity(petId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularLoadingWidget(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData && snapshot.data != null) {
              var puppy = snapshot.data as PuppyDetailsEntity;
              return _SuccessBody(puppy);
            } else {
              return const Center(child: Text('Nothing to see here'));
            }
          },
        ),
      ),
    );
  }
}

class _SuccessBody extends StatelessWidget {
  final PuppyDetailsEntity puppy;

  const _SuccessBody(this.puppy);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImgsCarouselComponent(
            height: size.height / 2.3,
            pictures: puppy.images,
          ),
          const Gap(8),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: PriceAndButtonBarComponent(puppy: puppy)),
          const Gap(16),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 12.0),
          //   child: Divider(),
          // ),
          description.isEmpty
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
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 12.0),
          //   child: Divider(),
          // ),
          const Gap(16),
          InfoIconsComponent(puppyDetails: puppy),
        ],
      ),
    );
  }
}
