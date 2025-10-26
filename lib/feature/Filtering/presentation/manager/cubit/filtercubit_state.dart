part of 'filtercubit_cubit.dart';

@immutable
sealed class FiltercubitState {}

final class FiltercubitInitial extends FiltercubitState {}
final class FilteringLoading extends FiltercubitState {}

class FilteringSuccess extends FiltercubitState {
 final List<Filteringmodel> filterings;

  FilteringSuccess({required this.filterings});
}


class FilteringFailure extends FiltercubitState {
  final String message;

  FilteringFailure(this.message);
}
