import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/shared/widgets/custom_pagination/custom_pagination_button.dart';
import 'package:zb_dezign/shared/widgets/custom_pagination/custom_pagination_dot.dart';
import 'package:zb_dezign/shared/widgets/custom_pagination/custom_pagination_number.dart';

class CustomPagination extends StatelessWidget {
  final RxInt currentPage;
  final int totalPage;
  const CustomPagination({super.key, required this.currentPage, required this.totalPage});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<Widget> pageButtons = [];
      if (totalPage <= 3) {
        for (int page = 1; page <= totalPage; page++) {
          pageButtons.add(
           CustomPaginationNumber(
              page: page,
              isSelected: currentPage.value == page,
              onTap: () => currentPage.value = page,
            ),
          );
        }
      } else {
        late List<int> visiblePages;
        if (currentPage <= 2) {
          visiblePages = [1, 2, 3];
        } else if (currentPage >= totalPage - 1) {
          visiblePages = [totalPage - 2, totalPage - 1, totalPage];
        } else {
          visiblePages = [currentPage.value - 1, currentPage.value, currentPage.value + 1];
        }

        for (final page in visiblePages) {
          pageButtons.add(
           CustomPaginationNumber(
              page: page,
              isSelected: currentPage.value == page,
              onTap: () => currentPage.value = page,
            ),
          );
        }

        if (visiblePages.last < totalPage) {
          pageButtons.add(CustomPaginationDot());
          pageButtons.add(
           CustomPaginationNumber(
              page: totalPage,
              isSelected: currentPage.value == totalPage,
              onTap: () => currentPage.value = totalPage,
            ),
          );
        }
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         CustomPaginationButton(
            icon: Icons.chevron_left,
            onTap: currentPage > 1
                ? () => currentPage.value = currentPage.value - 1
                : null,
          ),
          Spacer(),
          ...pageButtons,
          Spacer(),
         CustomPaginationButton(
            icon: Icons.chevron_right,
            onTap: currentPage < totalPage
                ? () => currentPage.value = currentPage.value + 1
                : null,
          ),
        ],
      );
    });
  }
}






