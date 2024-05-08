import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/features/home/presentation/widgets/calendar_lib/utils.dart';

class TableCalendarWidget extends StatefulWidget {
  const TableCalendarWidget({super.key});

  @override
  State<TableCalendarWidget> createState() => _TableCalendarWidgetState();
}

class _TableCalendarWidgetState extends State<TableCalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: kFirstDay,
      lastDay: kLastDay,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: StyleManager.getMediumStyle(
            fontSize: FontSize.s15, color: ColorManager.mediumGray),
        weekdayStyle: StyleManager.getMediumStyle(
            fontSize: FontSize.s15, color: ColorManager.mediumGray),
      ),
      calendarStyle: CalendarStyle(
        selectedDecoration: const BoxDecoration(
          color: ColorManager.primary,
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(50.r)
        ),
        weekendTextStyle: StyleManager.getMediumStyle(
            fontSize: FontSize.s15, color: ColorManager.mediumGray),
        defaultTextStyle: StyleManager.getMediumStyle(
            fontSize: FontSize.s15, color: ColorManager.mediumGray),
      ),
      // headerStyle: HeaderStyle(
      //   titleTextStyle: StyleManager.getMediumStyle(),
      //   rightChevronVisible: false,
      //   leftChevronVisible: false,
      //   titleCentered: true,
      //   formatButtonVisible: false,
      // ),
      
      headerVisible: false,
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) {
        // Use `selectedDayPredicate` to determine which day is currently selected.
        // If this returns true, then `day` will be marked as selected.

        // Using `isSameDay` is recommended to disregard
        // the time-part of compared DateTime objects.
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          // Call `setState()` when updating the selected day
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          // Call `setState()` when updating calendar format
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        // No need to call `setState()` here
        _focusedDay = focusedDay;
      },
    );
  }
}
