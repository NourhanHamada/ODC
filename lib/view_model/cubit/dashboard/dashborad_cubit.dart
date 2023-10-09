import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_offline/view_model/cubit/dashboard/dashboard_state.dart';




class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  static DashboardCubit get(context) => BlocProvider.of(context);

 

 List waitingListExpandedUnExpanded=[false,false,false,false,false]; 

  void expand(index) {
    waitingListExpandedUnExpanded[index] = !waitingListExpandedUnExpanded[index];
    
    emit(ChangeExpandedPanelState());
  }
}
