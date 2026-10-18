import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// One picture in the gallery: a title shown in the header and the asset
/// path of the image. Used for certificates and project screenshots.
class GalleryImage {
  const GalleryImage({required this.title, required this.image});

  final String title;

  /// Asset path of the picture.
  final String image;
}

/// Opens the image gallery on [startIndex] with a fade + zoom transition.
/// The viewer can swipe (or use the arrows / arrow keys) between all
/// [images] without closing the dialog.
Future<void> showImageGallery(
  BuildContext context, {
  required List<GalleryImage> images,
  required int startIndex,
}) {
  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Close image viewer',
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (context, animation, secondaryAnimation) =>
        _ImageGallery(images: images, startIndex: startIndex),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      );
      return FadeTransition(
        opacity: curved,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.92, end: 1).animate(curved),
          child: child,
        ),
      );
    },
  );
}

class _ImageGallery extends StatefulWidget {
  const _ImageGallery({required this.images, required this.startIndex});

  final List<GalleryImage> images;
  final int startIndex;

  @override
  State<_ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<_ImageGallery> {
  late final PageController _controller = PageController(
    initialPage: widget.startIndex,
  );
  late int _index = widget.startIndex;

  /// While an image is zoomed in, dragging pans the image instead of
  /// changing the page.
  bool _zoomed = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goTo(int page) {
    if (page < 0 || page >= widget.images.length) return;
    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.images.length;
    final current = widget.images[_index];
    final textTheme = Theme.of(context).textTheme;

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () =>
            _goTo(_index - 1),
        const SingleActivator(LogicalKeyboardKey.arrowRight): () =>
            _goTo(_index + 1),
      },
      child: Focus(
        autofocus: true,
        child: Dialog(
          insetPadding: const EdgeInsets.all(12),
          clipBehavior: Clip.antiAlias,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900, maxHeight: 700),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(current.title),
                  subtitle: Text('${_index + 1} of $total'),
                  trailing: IconButton(
                    tooltip: 'Close',
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Flexible(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PageView.builder(
                        controller: _controller,
                        itemCount: total,
                        physics: _zoomed
                            ? const NeverScrollableScrollPhysics()
                            : const PageScrollPhysics(),
                        onPageChanged: (page) => setState(() {
                          _index = page;
                          _zoomed = false;
                        }),
                        itemBuilder: (context, i) => _ZoomableImage(
                          imagePath: widget.images[i].image,
                          onZoomChanged: (zoomed) {
                            if (zoomed != _zoomed) {
                              setState(() => _zoomed = zoomed);
                            }
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: _ArrowButton(
                          icon: Icons.chevron_left,
                          tooltip: 'Previous image',
                          onPressed: _index > 0 ? () => _goTo(_index - 1) : null,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: _ArrowButton(
                          icon: Icons.chevron_right,
                          tooltip: 'Next image',
                          onPressed: _index < total - 1
                              ? () => _goTo(_index + 1)
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Swipe or use the arrows to browse. Pinch to zoom.',
                    style: textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Round arrow button drawn over the image.
class _ArrowButton extends StatelessWidget {
  const _ArrowButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: IconButton.filledTonal(
        tooltip: tooltip,
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}

/// Picture that can be pinched / scrolled to zoom.
class _ZoomableImage extends StatefulWidget {
  const _ZoomableImage({required this.imagePath, required this.onZoomChanged});

  final String imagePath;
  final ValueChanged<bool> onZoomChanged;

  @override
  State<_ZoomableImage> createState() => _ZoomableImageState();
}

class _ZoomableImageState extends State<_ZoomableImage> {
  final TransformationController _transform = TransformationController();

  @override
  void initState() {
    super.initState();
    _transform.addListener(_reportZoom);
  }

  void _reportZoom() {
    widget.onZoomChanged(_transform.value.getMaxScaleOnAxis() > 1.01);
  }

  @override
  void dispose() {
    _transform.removeListener(_reportZoom);
    _transform.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      transformationController: _transform,
      minScale: 1,
      maxScale: 4,
      child: Image.asset(
        widget.imagePath,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => const Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text('Image not found.'),
          ),
        ),
      ),
    );
  }
}
