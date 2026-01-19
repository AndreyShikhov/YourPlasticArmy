


import 'package:flutter/material.dart';

class SlideToConfirmUnitButton extends StatefulWidget {
  final VoidCallback onConfirmed;
  final String unitName;
  final String maxRepeat;
  final int currentRepeat;
  final Color baseColor;
  final Color confirmColor;

  const SlideToConfirmUnitButton({
    super.key,
    required this.onConfirmed,
    this.unitName = '',
    this.maxRepeat = '',
    this.currentRepeat = 0,
    this.baseColor = Colors.grey,
    this.confirmColor = Colors.green,
  });

  @override
  State<SlideToConfirmUnitButton> createState() => _SlideToConfirmUnitButtonState();
}

class _SlideToConfirmUnitButtonState extends State<SlideToConfirmUnitButton> {
  double _dragValue = 0.0; // Значение от 0.0 до 1.0
  bool _isConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        return GestureDetector(
          // Логика перетаскивания
          onHorizontalDragUpdate: (details) {
            if (_isConfirmed) return;

            setState(() {
              // Обновляем прогресс заполнения в зависимости от движения пальца
              _dragValue += details.delta.dx / maxWidth;
              _dragValue = _dragValue.clamp(0.0, 1.0);
            });
          },
          // Когда пользователь отпустил палец
          onHorizontalDragEnd: (details) {
            if (_isConfirmed) return;

            if (_dragValue > 0.9) {
              // Если дотянули почти до конца — подтверждаем
              setState(() {
                _dragValue = 1.0;
                //_isConfirmed = true;
              });
              widget.onConfirmed();
            } else {
              // Если не дотянули — сбрасываем в начало
              setState(() {
                _dragValue = 0.0;
              });
            }
          },
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: widget.baseColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: widget.baseColor),
            ),
            child: Stack(
              children: [
                // 1. Заполняющийся фон (Слева направо)
                FractionallySizedBox(
                  widthFactor: _dragValue,
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.confirmColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),

                // 2. Текст (всегда по центру)
                Center(
                  child: Text(
                    _isConfirmed ? "Подтверждено" : '${widget.unitName}: ${widget.currentRepeat} / ${widget.maxRepeat}',
                    style: TextStyle(
                      color: _dragValue > 0.5 ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // 3. "Ручка" или индикатор края (опционально)
                Positioned(
                  left: (_dragValue * maxWidth) - 55, // Смещение ручки
                  child: _dragValue > 0
                      ? Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: widget.confirmColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(Icons.chevron_right, color: Colors.white),
                  )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}