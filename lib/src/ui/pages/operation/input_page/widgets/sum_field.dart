import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../utils/sum.dart';
import '../../../../../domain/view_models.dart';
import '../../../../widgets/currency_menu.dart';

class SumField extends StatefulWidget {
  final void Function(Sum) onChange;
  final Sum? initialSum;

  const SumField({super.key, required this.onChange, this.initialSum});

  @override
  State<SumField> createState() => _SumFieldState();
}

class _SumFieldState extends State<SumField> {
  final TextEditingController _controller = TextEditingController();
  Currency _currency = Currency.RUB;
  final FocusNode _focusNode = FocusNode();

  @override
  void didUpdateWidget(covariant SumField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Если новая сумма пришла извне (отличается от текущего значения в контроллере)
    // и это не тот же самый объект Sum, обновляем текст.
    if (widget.initialSum != null &&
        widget.initialSum!.sum.toString() != _controller.text) {
      _controller.text = widget.initialSum!.sum.toString();
      _currency = widget.initialSum!.currency;
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialSum != null) {
      _controller.text = widget.initialSum!.sum.toString();
      _currency = widget.initialSum!.currency;
    } else {
      _currency = Currency.RUB;
    }

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _notifyChange();
      }
    });

    _controller.addListener(() {
      if (_controller.selection.baseOffset != _controller.text.length) {
        _controller.selection = TextSelection.collapsed(
          offset: _controller.text.length,
        );
      }

      if (_controller.text.startsWith('0') && _controller.text != '0') {
        _controller.text = _controller.text.substring(1);
      }

      if (_controller.text.isEmpty) {
        _controller.text = '0';
      }
    });
  }

  void _notifyChange() {
    widget.onChange(Sum(int.tryParse(_controller.text) ?? 0, _currency));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              autofocus: false,
              textAlign: .center,
              decoration: InputDecoration(border: InputBorder.none),
              onSubmitted: (text) => _notifyChange(),
            ),
          ),
          SizedBox(width: 16),
          CurrencyMenu(
            currency: _currency,
            onChange: (cur) {
              setState(() {
                _currency = cur;
              });
              _notifyChange();
            },
          ),
        ],
      ),
    );
  }
}
