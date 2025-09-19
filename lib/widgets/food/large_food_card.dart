import 'package:flutter/material.dart';

class LargeFoodCardWidget extends StatefulWidget {
  final String title;
  final String calories;
  final String imageUrl;
  final Color? color;
  final VoidCallback onTap;

  const LargeFoodCardWidget({
    Key? key,
    required this.title,
    required this.calories,
    required this.imageUrl,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  _LargeFoodCardWidgetState createState() => _LargeFoodCardWidgetState();
}

class _LargeFoodCardWidgetState extends State<LargeFoodCardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          width: _isHovered ? 220 : 200,
          height: _isHovered ? 260 : 240,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.18 : 0.1),
                blurRadius: _isHovered ? 18 : 10,
                offset: Offset(0, _isHovered ? 6 : 4),
              ),
            ],
            border: _isHovered
                ? Border.all(color: const Color(0xFF4CAF50), width: 1.5)
                : null,
          ),
          child: Column(
            children: [
              // Image Section — Perfect Circle
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Center(
                            child: Icon(Icons.error_outline, 
                                color: Colors.red, size: 40),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              // Info Section
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 17, 
                            fontWeight: FontWeight.w600, 
                            color: Colors.black87),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.calories,
                        style: TextStyle(
                            fontSize: 15, 
                            color: Colors.green[600], 
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}