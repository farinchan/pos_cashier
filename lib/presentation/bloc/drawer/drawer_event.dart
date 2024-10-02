part of 'drawer_bloc.dart';

sealed class DrawerEvent extends Equatable {
  const DrawerEvent();

  @override
  List<Object> get props => [];
}

class ChangeDrawer extends DrawerEvent {
  final int index;

  const ChangeDrawer(this.index);

  @override
  List<Object> get props => [index];
}
