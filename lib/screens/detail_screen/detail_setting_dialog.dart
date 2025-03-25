import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voa_clone/app/bloc/app_cubit.dart';
import 'package:voa_clone/app/bloc/app_state.dart';
import 'package:voa_clone/model/settings_app/detail_setting.dart';

class DetailSettingDialog extends StatelessWidget {
  const DetailSettingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Cài đặt chi tiết'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Background Color Selection
              const Text('Màu nền:'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: BackgroundColorDetail.values.map((color) {
                  final isSelected = state.detailSetting.bgColor == color;
                  return GestureDetector(
                    onTap: () {
                      context.read<AppCubit>().updateDetailSetting(
                            state.detailSetting.copyWith(bgColor: color),
                          );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        color.name,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              // Font Size Slider
              const Text('Kích thước chữ:'),
              Slider(
                value: state.detailSetting.textSize.toDouble(),
                min: 50,
                max: 200,
                divisions: 30,
                label: '${state.detailSetting.textSize}%',
                onChanged: (value) {
                  context.read<AppCubit>().updateDetailSetting(
                        state.detailSetting.copyWith(
                          textSize: value.round(),
                        ),
                      );
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }
}
