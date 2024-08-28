import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/widget/api.dart';
import 'package:my_app/core/widget/bloc.dart';

 

class DataBloc extends Bloc<DataEvent, DataState> {
  final ApiService apiService;

  DataBloc({required this.apiService}) : super(DataInitial()) {
    on<FetchData>(_onFetchData);
  }

  void _onFetchData(FetchData event, Emitter<DataState> emit) async {
    emit(DataLoading());
    try {
      final data = await apiService.fetchData();
      emit(DataLoaded(data));
    } catch (e) {
      emit(DataError('Failed to fetch data: ${e.toString()}'));
    }
  }
}
