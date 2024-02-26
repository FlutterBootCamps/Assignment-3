part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}

final class ChangePageEvent extends NavigationEvent{
  final int pageIndex;

  ChangePageEvent({required this.pageIndex});
}