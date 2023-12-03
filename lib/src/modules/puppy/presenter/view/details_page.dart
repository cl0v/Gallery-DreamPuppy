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

class DetailsPage extends StatefulWidget {
  final int petId;

  const DetailsPage({
    super.key,
    required this.petId,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Future<PuppyDetailsEntity> _future;

  @override
  void initState() {
    _future = puppyIoC.get<PuppyDetailsDatasource>().getEntity(widget.petId);

    super.initState();
  }

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
          future: _future,
              
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImgsCarouselComponent(
            height: 400,
            pictures: puppy.images,
          ),
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
