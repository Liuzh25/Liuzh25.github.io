const ap = new APlayer({
    container: document.getElementById('aplayer'),
    listFolded: false,
    listMaxHeight: 90,
    lrcType: 3,
	fixed: true,
    audio: [
      {
        name: "暗涌",
        artist: '王菲',
        url: 'http://www.ytmp3.cn/down/52980.mp3',
        cover: 'http://p1.music.126.net/w8RFsMH8VJfPsBmVudYGsA==/109951163020569833.jpg?param=130y130',
		lrc: 'lrc.lrc'
      },
      {
        name: 'Wonderful U',
        artist: 'AGA',
        url: 'http://www.ytmp3.cn/down/51181.mp3',
        cover: 'http://p1.music.126.net/Blb_Gi0AJTWIEBLr189F4A==/18791753232142320.jpg?param=130y130',
      },
      {
        name: '浮夸',
        artist: '陈奕迅',
        url: 'http://www.ytmp3.cn/down/49639.mp3',
        cover: 'http://p1.music.126.net/Bl1hEdJbMSj5YJsTqUjr-w==/109951163520311175.jpg?param=130y130',
      }
    ]
});
