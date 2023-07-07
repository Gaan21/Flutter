import 'package:chat_si_no/domain/entities/message.dart';
import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(message.imageUrl ??
            //TODO: Si es un gif https da fallo
            //"https://www.bing.com/images/search?view=detailV2&ccid=kHfDAVA7&id=F62EFC589D46518A39C935334FCC6EAE91530F1D&thid=OIP.kHfDAVA7TvUcjercCmoXoQHaEJ&mediaurl=https%3a%2f%2fmedia.giphy.com%2fmedia%2fZqe1S3qNQxsuQ%2fgiphy.gif&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.9077c301503b4ef51c8deadc0a6a17a1%3frik%3dHQ9Tka5uzE8zNQ%26pid%3dImgRaw%26r%3d0&exph=280&expw=500&q=gif&simid=608036768273481679&FORM=IRPRST&ck=80E3DA7D61A7B4D55B662D3FE6C7714C&selectedIndex=16&ajaxhist=0&ajaxserp=0"),
            "https://yesno.wtf/assets/no/19-2062f4c91189b1f88a9e809c10a5b0f0.gif"),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Image.network(
        imageUrl,
        width: size.width * 0.5,
        height: size.height * 0.20,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.5,
            height: size.height * 0.2,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: const Text("Cargando"),
          );
        },
      ),
    );
  }
}
