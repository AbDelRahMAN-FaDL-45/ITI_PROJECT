// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:my_app/core/widget/api.dart';


// // BLoC Events
// @immutable
// abstract class DataEvent {}

// class FetchData extends DataEvent {}

// // BLoC States
// @immutable
// abstract class DataState {}

// class DataInitial extends DataState {}

// class DataLoading extends DataState {}

// class DataLoaded extends DataState {
//   final List<dynamic> data;
//   DataLoaded(this.data);
// }

// class DataError extends DataState {
//   final String message;
//   DataError(this.message);
// }

// // BLoC Class
// class DataBloc extends Bloc<DataEvent, DataState> {
//   final ApiService apiService;

//   DataBloc(this.apiService) : super(DataInitial()) {
//     on<FetchData>((event, emit) async {
//       emit(DataLoading());
//       try {
//         final data = await apiService.fetchData();
//         emit(DataLoaded(data));
//       } catch (e) {
//         emit(DataError('Failed to fetch data'));
//       }
//     });
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

// BLoC Events
@immutable
abstract class DataEvent {}

class FetchData extends DataEvent {}

// BLoC States
@immutable
abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final List<dynamic> data;

  DataLoaded(this.data);
}

class DataError extends DataState {
  final String message;

  DataError(this.message);
}
