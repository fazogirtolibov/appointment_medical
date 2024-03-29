import 'package:doctor_app/data/models/appointment/appointment_model.dart';
import 'package:doctor_app/ui/tab_box/history/widgets/history_list_message.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryMessagingItem extends StatelessWidget {
  final List<AppointmentModel> appointments;
  const HistoryMessagingItem({super.key, required this.appointments});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
              appointments.length,
              (index) => MessagesHistoryList(
                appointmentModel: appointments[index],
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.pushNamed(context, historyMessageDetailRoute);
                },
              ),
            ),
            SizedBox(height: 80.h),
          ],
        ),
      ],
    );
  }
}
