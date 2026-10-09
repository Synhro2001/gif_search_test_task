import 'package:flutter/material.dart';
import 'package:gif_search_test_task/constants/app_color.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Не задаём фиксированную height: 190,
      // потому что содержимое само определяет необходимую высоту.
      // Это лучше работает на разных размерах экранов.
      decoration: BoxDecoration(
        color: AppColors.primary,

        // Закругляем только нижние углы Navbar.
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),

        // Небольшая тень под Navbar.
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      // SafeArea защищает содержимое от системных элементов телефона:
      // например, камеры/notch и верхней статусной панели.
      child: SafeArea(
        bottom: false,

        child: Padding(
          padding: const EdgeInsets.fromLTRB(16,16,16,24,),
          child: _NavbarHeader(title: title),
          
        ),
      ),
    );
  }
}


// ---------------------------------------------------------
// HEADER
// ---------------------------------------------------------
//
// Отдельный Widget для верхней части Navbar.
// Здесь находится GIF icon + title.
//
// "_" перед названием означает, что класс приватный.
// Он используется только внутри этого файла.
//
class _NavbarHeader extends StatelessWidget {
  const _NavbarHeader({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Контейнер вокруг GIF icon.
        Container(
          width: 40,
          height: 40,

          decoration: BoxDecoration(
            // Полупрозрачный белый фон.
            color: Colors.white.withValues(alpha: 0.15),

            borderRadius: BorderRadius.circular(12),
          ),

          child: const Icon(
            Icons.gif,
            color: Colors.white,
            size: 24,
          ),
        ),

        const SizedBox(width: 12),

        // Expanded занимает всё оставшееся место Row.
        // Это полезно, если title будет длинным.
        // Например:
        // "My Awesome GIF Search Application"
        // Тогда текст не будет вылезать за пределы экрана.
        Expanded(
          child: Text(
            title,

            // Разрешаем только одну строку.
            maxLines: 1,

            // Если текст слишком длинный,
            // Flutter покажет "..."
            overflow: TextOverflow.ellipsis,

            // Используем стиль из Theme приложения,
            // вместо того чтобы полностью задавать TextStyle вручную.
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ],
    );
  }
}


// // ---------------------------------------------------------
// // SEARCH FIELD
// // ---------------------------------------------------------
// //
// // Отдельный Widget для поиска.
// //
// // Navbar отвечает за layout,
// // SearchField отвечает непосредственно за TextField.
// //
// class SearchField extends StatelessWidget {
//   const SearchField({
//     required this.onChanged,
//     super.key,
//   });

//   // Получаем функцию от родительского Widget.
//   //
//   // TextField будет вызывать:
//   //
//   // onChanged("cat");
//   //
//   // когда пользователь вводит текст.
//   final ValueChanged<String> onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       // Высота самого поля поиска.
//       height: 52,

//       child: TextField(
//         // Каждый раз, когда пользователь меняет текст,
//         // вызываем callback из Navbar.
//         //
//         // Дальше этот callback попадёт в Controller,
//         // где у тебя находится debounce.
//         onChanged: onChanged,

//         // На мобильной клавиатуре будет кнопка Search.
//         textInputAction: TextInputAction.search,

//         decoration: InputDecoration(
//           hintText: 'Search GIFs',

//           hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                 color: AppColors.textSecondary,
//               ),

//           // Иконка поиска слева.
//           prefixIcon: const Icon(
//             Icons.search,
//             color: AppColors.textSecondary,
//           ),

//           // Делаем белый фон.
//           filled: true,
//           fillColor: AppColors.surface,

//           // Обычное состояние TextField.
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(14),
//             borderSide: BorderSide.none,
//           ),

//           // Когда TextField НЕ находится в focus.
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(14),
//             borderSide: BorderSide.none,
//           ),

//           // Когда пользователь нажал на TextField.
//           //
//           // Добавляем небольшую рамку AppColors.primary,
//           // чтобы было понятно, что поле активно.
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(14),
//             borderSide: const BorderSide(
//               color: AppColors.primary,
//               width: 2,
//             ),
//           ),

//           // Отступ текста внутри TextField.
//           contentPadding: const EdgeInsets.symmetric(
//             horizontal: 16,
//           ),
//         ),
//       ),
//     );
//   }
// }