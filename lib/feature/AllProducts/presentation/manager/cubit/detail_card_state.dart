part of 'detail_card_cubit.dart';

@immutable
sealed class DetailCardState {}

final class DetailCardInitial extends DetailCardState {}

final class DetailCardSuccess extends DetailCardState {
  final List<Detailcardmodel> detailCards;

  DetailCardSuccess({required this.detailCards});
}

final class DetailCardLoading extends DetailCardState {}

final class DetailCardFailure extends DetailCardState {
  final String errormessage;

  DetailCardFailure({required this.errormessage});
}
