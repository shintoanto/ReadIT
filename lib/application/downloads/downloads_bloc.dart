
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecomy/domain/downlads/core/failure/main_failure.dart';
import 'package:ecomy/domain/downlads/i_downloads_repo.dart';
import 'package:ecomy/domain/downlads/models/downloads.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadRepo;
  DownloadsBloc(this._downloadRepo) : super(DownloadsState.inital()) {
    on<_GetDownloadsImage>(
      (event, emit) async {
       
        emit(
          state.copyWith(
            isLoading: true,
            downloadsFailureOrSucces: none(),
          ),
        );
        final Either<MainFailure, List<Downloads>> downloadsOptins =
            await _downloadRepo.getDownloadsImages();
        print("7 7$downloadsOptins");

        emit(
          downloadsOptins.fold(
            (failure) => state.copyWith(
              isLoading: false,
              downloadsFailureOrSucces: Some(
                Left(failure),
              ),
            ),
            (sucess) => state.copyWith(
              isLoading: false,
              downloads: sucess,
              downloadsFailureOrSucces: Some(
                Right(sucess),
              ),
            ),
          ),
        );
      },
    );
  }
}
