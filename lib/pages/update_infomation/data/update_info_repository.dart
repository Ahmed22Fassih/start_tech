import '../../../base/base_repository.dart';
import 'update_info_provider.dart';

abstract class IUpdateInfoRepository {}

class UpdateInfoRepository extends BaseRepository
    implements IUpdateInfoRepository {
  UpdateInfoRepository({required this.provider});
  final IUpdateInfoProvider provider;
}
