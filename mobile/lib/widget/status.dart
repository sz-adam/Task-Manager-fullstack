import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  const Status(
      {Key? key,
      required this.status,
      required this.selectedStatus,
      required this.onSelected})
      : super(key: key);

  final String status;
  final String? selectedStatus;
  final ValueChanged<String?> onSelected;

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width *
              0.75, // 75%-a a képernyő szélességének
          child: RadioMenuButton<String>(
            value: widget.status,
            groupValue: widget.selectedStatus,
            onChanged: widget.onSelected,
            style: ButtonStyle(
              // Border Radius
              shape: WidgetStateProperty.resolveWith(
                (state) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              // Háttérszín beállítása
              backgroundColor: WidgetStateProperty.resolveWith(
                (states) => const Color.fromARGB(255, 255, 255, 255),
              ),
              // Szövegszín (foreground color)
              foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                  (states) => Colors.black),
              // Rádió ikon szín (aktív szín)
              overlayColor:
                  WidgetStateProperty.resolveWith((states) => Colors.blue),
            ),
            child: Text(
              widget.status,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
