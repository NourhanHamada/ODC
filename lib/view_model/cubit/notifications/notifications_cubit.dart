import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_offline/view/constant/assets.dart';
import 'package:odc_offline/view_model/cubit/notifications/notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());

  static NotificationsCubit get(context) => BlocProvider.of(context);

  String menuButtonValue = 'All';
  final List<String> menuItems = [
    'All',
    'Read',
    'Unread',
  ];

  String menuButtonIcon = arrowDownIcon;

  changeMenuButtonValue(String val) {
    menuButtonValue = val;
    emit(ChangeNotificationsState());
  }

  changeMenuButtonIconUp() {
      menuButtonIcon = arrowUpIcon;
    emit(ChangeNotificationsIconState());
  }

   changeMenuButtonIconDown() {
    menuButtonIcon = arrowDownIcon;
    emit(ChangeNotificationsIconState());
  }

}




