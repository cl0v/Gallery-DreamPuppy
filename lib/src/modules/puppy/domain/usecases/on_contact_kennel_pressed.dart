import 'package:gallery/src/modules/puppy/data/datasource.dart';

import '../../puppy_module.dart';

part '_first_time_id.dart';
part '_show_review_popup.dart';

const String detailsPageTitle = 'Detalhes';

class OnGetContactPressedUsecase {
  // ShowReviewerPopUpUsecase showReview = ShowReviewerPopUpUsecase();

  final PuppyDetailsDatasource datasource =
      puppyIoC.get<PuppyDetailsDatasource>();

  Future<
      ({
        String name,
        Map<String, String> params,
        Map<String, dynamic> query
      })> call(
    int puppyId,
  ) async {
    // TODO: Rename to kennel
    var name = 'canil';
    var queryParams = <String, dynamic>{};
    var pathParams = <String, String>{};

    var (kennelId, err) = await datasource.getKennelId(puppyId);
    if (err != null) {
      throw UnimplementedError('What should i do??');
    }
    pathParams['id'] = kennelId ?? '0';


    // queryParams.addEntries(const [z
    //   MapEntry('fromTitle', detailsPageTitle),
    // ]);

    // if (IsAuthRequiredUsecase().call()) {
    //   name = AuthRouter.instance.names.first;
    //   pathParams.addEntries(const [
    //     MapEntry('redirect', 'true'),
    //   ]);
    // } else {
    // entries.add(MapEntry('review', showReview.call().value));

    return (name: name, params: pathParams, query: queryParams);
  }
}
