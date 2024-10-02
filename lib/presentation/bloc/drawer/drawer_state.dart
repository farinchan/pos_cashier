part of 'drawer_bloc.dart';

sealed class DrawerState extends Equatable {
  const DrawerState();
  
  @override
  List<Object> get props => [];
}

final class DrawerInitial extends DrawerState {}

final class DrawerChanged extends DrawerState {
  final int index;

  const DrawerChanged(this.index);

  @override
  List<Object> get props => [index];
}

