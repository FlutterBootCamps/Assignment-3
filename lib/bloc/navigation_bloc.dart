import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:tasky_task_manager/data_layer/home_data_layer.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final locator = GetIt.I.get<HomeData>();
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationEvent>((event, emit) {
    });
    on<ChangePageEvent>(changePage);
  }

  FutureOr<void> changePage(ChangePageEvent event, Emitter<NavigationState> emit) {
    locator.currentPageIndex = event.pageIndex;
    emit(ChangedPageState());
  }
}
