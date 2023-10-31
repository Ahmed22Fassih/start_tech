import '../../../base/base_repository.dart';
import 'welcome_api_provider.dart';

abstract class IWelcomeRepository {}

class WelcomeRepository extends BaseRepository implements IWelcomeRepository {
  WelcomeRepository({required this.provider});
  final IWelcomeProvider provider;
}
