import '../../../base/base_repository.dart';
import 'home_provider.dart';

abstract class IHomeRepository {}

class HomeRepository extends BaseRepository implements IHomeRepository {
  HomeRepository({required this.provider});
  final IHomeProvider provider;
}
