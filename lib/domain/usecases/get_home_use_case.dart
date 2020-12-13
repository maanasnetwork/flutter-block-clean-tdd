import './base_use_case.dart';
import '../../locator.dart';

abstract class GetHomePageUseCase
    implements BaseUseCase<HomeProductsResult, HomeProductParams> {}

class GetHomePageUseCaseImpl implements GetHomePageUseCase {
  @override
  Future<HomeProductsResult> execute(HomeProductParams params) async {}
}

class HomeProductParams {}

class HomeProductsResult extends UseCaseResult {}

class HomeProductsException implements Exception {}
