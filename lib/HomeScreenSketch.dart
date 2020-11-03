import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenSketch extends StatelessWidget {
  HomeScreenSketch({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe6e6e6),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(40.0, 300.0),
            child: SizedBox(
              width: 334.0,
              height: 334.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 157.0, 157.0),
                    size: Size(334.0, 334.0),
                    pinLeft: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 157.0, 157.0),
                          size: Size(157.0, 157.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(13.0, 122.0, 57.0, 19.0),
                          size: Size(157.0, 157.0),
                          pinLeft: true,
                          pinBottom: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            'Windows',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 14,
                              color: const Color(0xffffffff),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(177.0, 0.0, 157.0, 157.0),
                    size: Size(334.0, 334.0),
                    pinRight: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 157.0, 157.0),
                          size: Size(157.0, 157.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(13.0, 122.0, 85.0, 19.0),
                          size: Size(157.0, 157.0),
                          pinLeft: true,
                          pinBottom: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            'Microsoft 365',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 14,
                              color: const Color(0xffffffff),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(177.0, 177.0, 157.0, 157.0),
                    size: Size(334.0, 334.0),
                    pinRight: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 157.0, 157.0),
                          size: Size(157.0, 157.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(13.0, 122.0, 46.0, 19.0),
                          size: Size(157.0, 157.0),
                          pinLeft: true,
                          pinBottom: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            'Surface',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 14,
                              color: const Color(0xffffffff),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 177.0, 157.0, 157.0),
                    size: Size(334.0, 334.0),
                    pinLeft: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 157.0, 157.0),
                          size: Size(157.0, 157.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(13.0, 122.0, 31.0, 19.0),
                          size: Size(157.0, 157.0),
                          pinLeft: true,
                          pinBottom: true,
                          fixedWidth: true,
                          fixedHeight: true,
                          child: Text(
                            'Xbox',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 14,
                              color: const Color(0xffffffff),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(40.0, 772.0),
            child: Text(
              'Cargo Tracking',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(304.0, 741.0),
            child: Text(
              'Education',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(182.0, 772.0),
            child: Text(
              'Help Center',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(183.0, 741.0),
            child: Text(
              'Enterprise',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(306.0, 772.0),
            child: Text(
              'Careers',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(40.0, 741.0),
            child: Text(
              'Developer',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(40.0, 689.0),
            child: Text(
              'Especially',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 25,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(338.0, 104.0),
            child: SizedBox(
              width: 26.0,
              height: 20.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 12.0, 1.0),
                    size: Size(26.0, 20.0),
                    pinLeft: true,
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_qgxld8,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 10.5, 25.2, 1.0),
                    size: Size(26.0, 20.0),
                    pinLeft: true,
                    pinRight: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_du5dth,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(13.0, 20.0, 13.0, 1.0),
                    size: Size(26.0, 20.0),
                    pinRight: true,
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: SvgPicture.string(
                      _svg_u0j80r,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(40.0, 100.0),
            child: SvgPicture.string(
              _svg_pv5czb,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(40.0, 163.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 31,
                  color: const Color(0xff000000),
                ),
                children: [
                  TextSpan(
                    text: 'Hello,\n',
                  ),
                  TextSpan(
                    text: 'William',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(286.2, 100.0),
            child: SvgPicture.string(
              _svg_ooh0q6,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_qgxld8 =
    '<svg viewBox="0.4 -0.2 12.0 1.0" ><path transform="translate(0.42, -0.16)" d="M 0 0 L 12 0" fill="none" stroke="#000000" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_du5dth =
    '<svg viewBox="0.4 10.4 25.2 1.0" ><path transform="translate(0.42, 10.37)" d="M 0 0 L 25.19699668884277 0" fill="none" stroke="#000000" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u0j80r =
    '<svg viewBox="13.4 19.8 13.0 1.0" ><path transform="translate(13.42, 19.84)" d="M 0 0 L 13 0" fill="none" stroke="#000000" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pv5czb =
    '<svg viewBox="40.0 100.0 34.9 34.9" ><path transform="translate(40.0, 100.0)" d="M 16.57187080383301 34.88814926147461 L 0 34.88814926147461 L 0 18.3162784576416 L 16.57187080383301 18.3162784576416 L 16.57187080383301 34.88814926147461 Z M 34.88814926147461 34.88814926147461 L 18.3162784576416 34.88814926147461 L 18.3162784576416 18.3162784576416 L 34.88814926147461 18.3162784576416 L 34.88814926147461 34.88814926147461 Z M 16.57187080383301 16.57187080383301 L 0 16.57187080383301 L 0 0 L 16.57187080383301 0 L 16.57187080383301 16.57187080383301 Z M 34.88814926147461 16.57187080383301 L 18.3162784576416 16.57187080383301 L 18.3162784576416 0 L 34.88814926147461 0 L 34.88814926147461 16.57187080383301 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ooh0q6 =
    '<svg viewBox="286.2 100.0 29.5 29.5" ><path transform="translate(282.8, 96.65)" d="M 32.81120300292969 31.27418518066406 L 24.57953643798828 22.99890899658203 C 28.6673526763916 18.06680297851563 28.15735626220703 10.79283046722412 23.42131233215332 6.479390621185303 C 18.68526649475098 2.165950536727905 11.39542198181152 2.336072444915771 6.865747451782227 6.865745544433594 C 2.336073398590088 11.39541816711426 2.165949583053589 18.68526268005371 6.47938871383667 23.42130851745605 C 10.79282855987549 28.15735244750977 18.06679725646973 28.6673526763916 22.99890518188477 24.57954025268555 L 31.27418518066406 32.81120300292969 L 32.81120300292969 31.27418518066406 Z M 5.55483341217041 15.36712551116943 C 5.55483341217041 9.94794750213623 9.94794750213623 5.55483341217041 15.36712551116943 5.55483341217041 C 20.78630638122559 5.55483341217041 25.17941665649414 9.94794750213623 25.17941665649414 15.36712551116943 C 25.17941665649414 20.78630638122559 20.78630638122559 25.17941665649414 15.36712551116943 25.17941665649414 C 9.94794750213623 25.17941665649414 5.55483341217041 20.78630638122559 5.55483341217041 15.36712551116943 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
