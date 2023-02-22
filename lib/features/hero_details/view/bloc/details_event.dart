part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class DataLoadingEvent extends DetailsEvent {
  final int id;

  DataLoadingEvent({required this.id});
}