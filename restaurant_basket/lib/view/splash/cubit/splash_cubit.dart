import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../core/init/navigation/navigation_service.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(String path) : super(SplashInitial()) {
    _init(path);
  }

  Future<void> _init(String path) async {
    //SplashService.instance.serviceInit();
    await Future.delayed(const Duration(milliseconds: 2000));
    await NavigationService.instance.navigateToPageClear(path: path);
    emit(SplashLoadSuccess());
  }
}
