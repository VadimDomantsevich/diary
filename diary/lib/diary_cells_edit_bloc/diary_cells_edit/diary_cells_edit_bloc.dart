import 'package:bloc/bloc.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/services/diary_cell_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_cells_edit_state.dart';
part 'diary_cells_edit_event.dart';
part 'diary_cells_edit_bloc.freezed.dart';

class DiaryCellsEditBloc
    extends Bloc<DiaryCellsEditEvent, DiaryCellsEditState> {
  final DiaryCellService _diaryCellService;
  DiaryCellsEditBloc(
    this._diaryCellService,
  ) : super(const DiaryCellsEditState.textEditing()) {
    on<SelectAlignmentEvent>((event, emit) => _onSelectAlignmentEvent);
  }
}

Future<void> _onSelectAlignmentEvent(
  SelectAlignmentEvent event,
  Emitter<DiaryCellsEditState> emit,
) async {
  
}
//DELETE
