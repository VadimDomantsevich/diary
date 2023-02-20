import 'package:diary/core/constants/enums.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/borders_style_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBordersStyleColumnWidget extends StatelessWidget {
  const BlocBordersStyleColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
      builder: (context, state) => state.maybeWhen(
        bordersEditing: (bordersEditingEnum, bordersStyleEnum, bordersColor) {
          return Column(
            children: [
              BordersStyleRowWidget.thin(
                selectedStyle: bordersStyleEnum,
                onTap: () {
                  context.read<DiaryCellEditBloc>().add(
                        const DiaryCellEditEvent.changeBorders(
                          bordersStyleEnum: BordersStyleEnum.thin,
                        ),
                      );
                },
              ),
              BordersStyleRowWidget.medium(
                selectedStyle: bordersStyleEnum,
                onTap: () {
                  context.read<DiaryCellEditBloc>().add(
                        const DiaryCellEditEvent.changeBorders(
                          bordersStyleEnum: BordersStyleEnum.medium,
                        ),
                      );
                },
              ),
              BordersStyleRowWidget.thick(
                selectedStyle: bordersStyleEnum,
                onTap: () {
                  context.read<DiaryCellEditBloc>().add(
                        const DiaryCellEditEvent.changeBorders(
                          bordersStyleEnum: BordersStyleEnum.thick,
                        ),
                      );
                },
              ),
            ],
          );
        },
        orElse: () => Container(),
      ),
    );
  }
}
