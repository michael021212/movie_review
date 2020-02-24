# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:'hiroto',email:'hiroto@example.com',password:'000000',birthday:'1940-01-01',sex:'男',intro:'hirotoです。よろしくお願いします。')
User.create!(name:'souta',email:'souta@example.com',password:'000000',birthday:'1960-01-01',sex:'男',intro:'soutaです。よろしくお願いします。')
User.create!(name:'misaki',email:'misaki@example.com',password:'000000',birthday:'1950-01-01',sex:'女',intro:'misakiといいます。どうぞよろしくお願いいたします。')
User.create!(name:'itsuki',email:'itsuki@example.com',password:'000000',birthday:'1950-01-01',sex:'男',intro:'itsukiです。よろしくお願いします。')
User.create!(name:'sho',email:'sho@example.com',password:'000000',birthday:'1970-01-01',sex:'男',intro:'shoです。よろしくお願いします。')
User.create!(name:'hana',email:'hana@example.com',password:'000000',birthday:'1940-01-01',sex:'女',intro:'hanaといいます。どうぞよろしくお願いいたします。')
User.create!(name:'sakura',email:'sakura@example.com',password:'000000',birthday:'1960-01-01',sex:'女',intro:'sakuraといいます。どうぞよろしくお願いいたします。')
User.create!(name:'hina',email:'hina@example.com',password:'000000',birthday:'1970-01-01',sex:'女',intro:'hinaといいます。どうぞよろしくお願いいたします。')
User.create!(name:'yuto',email:'yuto@example.com',password:'000000',birthday:'1940-01-01',sex:'男',intro:'yutoです。よろしくお願いします。')
User.create!(name:'kana',email:'kana@example.com',password:'000000',birthday:'1980-01-01',sex:'女',intro:'kanaといいます。どうぞよろしくお願いいたします。')
User.create!(name:'aoi',email:'aoi@example.com',password:'000000',birthday:'1990-01-01',sex:'女',intro:'aoiといいます。どうぞよろしくお願いいたします。')
User.create!(name:'rin',email:'rin@example.com',password:'000000',birthday:'1940-01-01',sex:'女',intro:'rinといいます。どうぞよろしくお願いいたします。')
User.create!(name:'shin',email:'shin@example.com',password:'000000',birthday:'1950-01-01',sex:'男',intro:'shinです。よろしくお願いします。')
User.create!(name:'yuma',email:'yuma@example.com',password:'000000',birthday:'1960-01-01',sex:'男',intro:'yumaです。よろしくお願いします。')
User.create!(name:'mirai',email:'mirai@example.com',password:'000000',birthday:'1950-01-01',sex:'女',intro:'miraiといいます。どうぞよろしくお願いいたします。')
User.create!(name:'ren',email:'ren@example.com',password:'000000',birthday:'1990-01-01',sex:'男',intro:'renです。よろしくお願いします。')
User.create!(name:'mao',email:'mao@example.com',password:'000000',birthday:'1960-01-01',sex:'女',intro:'maoといいます。どうぞよろしくお願いいたします。')
User.create!(name:'minato',email:'minato@example.com',password:'000000',birthday:'1980-01-01',sex:'男',intro:'minatoです。よろしくお願いします。')
User.create!(name:'miyu',email:'miyu@example.com',password:'000000',birthday:'1970-01-01',sex:'女',intro:'miyuといいます。どうぞよろしくお願いいたします。')
User.create!(name:'ikko',email:'ikko@example.com',password:'000000',birthday:'1950-01-01',sex:'その他',intro:'ikkoといいます。どうぞよろしくお願いいたします。')

Review.create!(movie_id:'454626', title:'Sonic the Hedgehog', poster_path:'/vTUEyrtZHRBhyR7o75ni15oM1Gg.jpg', user_id:'1', total_score:'5.0', story_score:'4.0', direction_score:'5.0',
  acting_score:'4.0', visual_score:'5.0', music_score:'4.0', body:'お馴染みセガの人気キャラクターを主人公にした作品。見えないくらい早く走る。 大人から子供までみんなで安心して楽しめる映画です。 ジムキャリーファンもあの変顔を存分に楽しめます(ちょっと老けたけど）。 日本も製作に関わってますがテイストは完全にハリウッドです。', tag_list:["かわいい", "笑える"])
Review.create!(movie_id:'454626', title:'Sonic the Hedgehog', poster_path:'/vTUEyrtZHRBhyR7o75ni15oM1Gg.jpg', user_id:'2', total_score:'4.0', story_score:'3.0', direction_score:'4.0',
  acting_score:'4.0', visual_score:'3.0', music_score:'4.0', body:'実写化は、とても嬉しいけど、ソニックの声優が金丸淳一さんじゃないのは、ちょっとショックかな、、、', tag_list:["かわいい", "笑える"])
Review.create!(movie_id:'454626', title:'Sonic the Hedgehog', poster_path:'/vTUEyrtZHRBhyR7o75ni15oM1Gg.jpg', user_id:'3', total_score:'4.5', story_score:'4.0', direction_score:'4.5',
  acting_score:'4.5', visual_score:'4.0', music_score:'4.5', body:'あのゲームやアニメで有名なソニックが実写で映画化！どんな内容かとても楽しみにしていましたが、大満足の出来でした。', tag_list:["かわいい", "笑える", "爽快"])

Review.create!(movie_id:'419704', title:'アド・アストラ', poster_path:'/xJUILftRf6TJxloOgrilOTJfeOn.jpg', user_id:'1', total_score:'2.0', story_score:'3.0', direction_score:'2.0',
  acting_score:'2.0', visual_score:'5.0', music_score:'2.0', body:'宇宙の彼方で消息を絶った父親を探すため、遙か彼方の海王星まで飛んでいく。それは、父の失踪以来、人間らしい感情が麻痺してしまった主人公の宇宙飛行士にとって、"自分探しの旅"と言えるもの。何と広大で、同時に、ちっぽけな話であることか!?だが、本作は描き尽くされ、開発し尽くされた宇宙映像に新たなアップデートを試みている。それは、映画の冒頭に訪れる。また、地球から月を経由し、さらに火星から海王星へと向かう宇宙旅行の楽しさは格別だ。まるで、旅客機での旅と見紛う笑える演出が途中に用意されているし、何よりも、俳優ブラッド・ピットが披露する、彼としては珍しい熱量のグラデーションが明確な演技が新鮮だ。', tag_list:["映像すごい", "ブラピ", "退屈"])
Review.create!(movie_id:'419704', title:'アド・アストラ', poster_path:'/xJUILftRf6TJxloOgrilOTJfeOn.jpg', user_id:'2', total_score:'2.5', story_score:'3.0', direction_score:'3.5',
  acting_score:'2.5', visual_score:'5.0', music_score:'3.0', body:'宇宙の彼方で消息を絶った父親を探すため、遙か彼方の海王星まで飛んでいく。それは、父の失踪以来、人間らしい感情が麻痺してしまった主人公の宇宙飛行士にとって、"自分探しの旅"と言えるもの。何と広大で、同時に、ちっぽけな話であることか!?ブラピが行方不明の父を探しに冥王星まで行く話。要は宇宙を舞台にした自分探しというか、父殺しというか、ブラピの心の変化を描くだけの物語なので、スケールが大きいようで小さい。それ、宇宙じゃなきゃだめ？って感じ。クライマックスもさほど盛り上がらず、全体的にブラピのモノローグで進行していくので、正直観ていて退屈だった。好きな人は好きなのかもしれないけど、個人的には合わない作品だったかな。', tag_list:["映像すごい", "ブラピ", "退屈", "壮大"])
Review.create!(movie_id:'419704', title:'アド・アストラ', poster_path:'/xJUILftRf6TJxloOgrilOTJfeOn.jpg', user_id:'3', total_score:'1.5', story_score:'1.0', direction_score:'2.0',
  acting_score:'2.0', visual_score:'4.0', music_score:'2.5', body:'物凄い潤沢な予算と、暑苦しいほどの情熱と、シンプルな脚本が集まるとこうなりますの典型。', tag_list:["映像すごい", "ブラピ", "退屈", "壮大"])
Review.create!(movie_id:'419704', title:'アド・アストラ', poster_path:'/xJUILftRf6TJxloOgrilOTJfeOn.jpg', user_id:'4', total_score:'1.5', story_score:'1.0', direction_score:'2.0',
  acting_score:'2.0', visual_score:'4.0', music_score:'2.5', body:'ブラピが好きな人なら観て損はしないと思う。それだけ', tag_list:["ブラピ", "退屈", "壮大"])

Review.create!(movie_id:'496243', title:'パラサイト 半地下の家族', poster_path:'/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg', user_id:'1', total_score:'5.0', story_score:'5.0', direction_score:'5.0',
  acting_score:'5.0', visual_score:'5.0', music_score:'5.0', body:'経済格差を縦の構図を巧みに用いて描いた演出センスに脱帽する。何から何までセンスが良い作品だ。本作は豪邸に住む富裕層と半地下の家に住む貧困層の格差について描いているが、さらにその下にも貧困層がいるという、二段構えで描いているのが素晴らしい。', tag_list:["考えさせられる", "怖い", "ハラハラ", "面白い"])
Review.create!(movie_id:'496243', title:'パラサイト 半地下の家族', poster_path:'/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg', user_id:'2', total_score:'4.5', story_score:'5.0', direction_score:'4.5',
  acting_score:'4.5', visual_score:'4.5', music_score:'4.5', body:'格差社会を象徴する映画。韓国映画の強みが存分に発揮されてます。見応え十分です。', tag_list:["考えさせられる", "怖い", "ハラハラ", "面白い"])
Review.create!(movie_id:'496243', title:'パラサイト 半地下の家族', poster_path:'/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg', user_id:'3', total_score:'4.0', story_score:'5.0', direction_score:'4.0',
  acting_score:'5.0', visual_score:'4.5', music_score:'4.0', body:'ジョーカーもそうですが、両作品とも貧困というか下級の人物が描かれています。そして終わり方も決して明るいものではありません。それでもスッキリ度という意味で、私の中ではパラサイトに軍配。作品賞にも納得できました。', tag_list:["考えさせられる", "スッキリ", "ハラハラ", "面白い"])
Review.create!(movie_id:'496243', title:'パラサイト 半地下の家族', poster_path:'/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg', user_id:'4', total_score:'4.5', story_score:'4.5', direction_score:'4.0',
  acting_score:'4.5', visual_score:'3.0', music_score:'3.0', body:'凄惨な場面が有ったものの、観賞後にこみ上げてきた切ない感情は、監督の巧みな手腕によるものかも知れません。', tag_list:["切ない", "怖い", "アカデミー賞", "面白い"])
Review.create!(movie_id:'496243', title:'パラサイト 半地下の家族', poster_path:'/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg', user_id:'5', total_score:'4.0', story_score:'4.0', direction_score:'4.0',
  acting_score:'4.0', visual_score:'3.5', music_score:'4.0', body:'なんていうかサスペンス風なんだけど、コメディ要素も多く、全然ポップに楽しめた', tag_list:["怖い", "アカデミー賞", "笑える", "どんでん返し"])
Review.create!(movie_id:'496243', title:'パラサイト 半地下の家族', poster_path:'/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg', user_id:'6', total_score:'5.0', story_score:'5.0', direction_score:'4.0',
  acting_score:'4.0', visual_score:'3.0', music_score:'3.0', body:'アカデミー賞に相応しいかどうか、自分には分からないが、面白い作品なのは間違いない', tag_list:["怖い", "アカデミー賞", "面白い", "どんでん返し"])
Review.create!(movie_id:'496243', title:'パラサイト 半地下の家族', poster_path:'/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg', user_id:'7', total_score:'4.5', story_score:'4.5', direction_score:'4.5',
  acting_score:'4.5', visual_score:'4.0', music_score:'3.0', body:'きっとどこかで破綻するだろう展開。なんとか綱渡りで破綻を避けたが・・・。上手くまとめた。一方、スッキリしないのも面白さのうち。観に行って良かった。', tag_list:["スッキリしない", "考えさせられる"])

Review.create!(movie_id:'449924', title:'イップ・マン 完結', poster_path:'/mAWBfTDAmfpvQGMVFuzuVl49N1P.jpg', user_id:'1', total_score:'1.0', story_score:'1.0', direction_score:'1.0',
  acting_score:'1.0', visual_score:'1.0', music_score:'1.0', body:'なぜこんな映画を観にいってしまったのか。。まじでつまらなすぎた。', tag_list:["退屈", "つまらない", "眠くなる"])
Review.create!(movie_id:'449924', title:'イップ・マン 完結', poster_path:'/mAWBfTDAmfpvQGMVFuzuVl49N1P.jpg', user_id:'8', total_score:'1.5', story_score:'1.0', direction_score:'2.5',
  acting_score:'1.0', visual_score:'1.5', music_score:'2.0', body:'途中眠くなったけど、クライマックスは盛り上がれた。', tag_list:["どんでん返し", "眠くなる"])

Review.create!(movie_id:'512200', title:'ジュマンジ／ネクスト・レベル', poster_path:'/jyw8VKYEiM1UDzPB7NsisUgBeJ8.jpg', user_id:'1', total_score:'4.0', story_score:'4.0', direction_score:'4.0',
  acting_score:'4.0', visual_score:'4.0', music_score:'4.0', body:'中盤まではおじいちゃん２人とスペンサーにイライラしてしまい、「外したか？」と思いましたが、後半で本領発揮とばかりに面白くなります。', tag_list:["後半が面白い", "笑える"])
Review.create!(movie_id:'512200', title:'ジュマンジ／ネクスト・レベル', poster_path:'/jyw8VKYEiM1UDzPB7NsisUgBeJ8.jpg', user_id:'2', total_score:'4.0', story_score:'4.0', direction_score:'3.0',
  acting_score:'3.0', visual_score:'3.5', music_score:'3.0', body:'続編だし多少は落ちるかなと思っていたが、テコ入れ(ダブルダニー&オークワフィナ)も悪くなく、とても楽しめた。', tag_list:["面白い", "笑える"])
Review.create!(movie_id:'512200', title:'ジュマンジ／ネクスト・レベル', poster_path:'/jyw8VKYEiM1UDzPB7NsisUgBeJ8.jpg', user_id:'3', total_score:'3.0', story_score:'4.0', direction_score:'3.5',
  acting_score:'3.5', visual_score:'3.5', music_score:'2.0', body:'思うようにいかない現実とどう向き合うか、そしてやっぱり減っていくライフのタトゥーにハラハラドキドキしながら進んでいきます。', tag_list:["笑える", "ハラハラ"])

Review.create!(movie_id:'330457', title:'アナと雪の女王2', poster_path:'/eiai3yefICyTt50y9HD1PvrF3RU.jpg', user_id:'1', total_score:'4.0', story_score:'4.0', direction_score:'4.0',
  acting_score:'4.0', visual_score:'5.0', music_score:'4.5', body:'前作の主役がアナだとすれば、「2」はエルサが主役でしょうか。松たか子さんの力強い高音が素晴らしかったです！', tag_list:["ディズニー", "音楽がいい", "映像がすごい"])
Review.create!(movie_id:'330457', title:'アナと雪の女王2', poster_path:'/eiai3yefICyTt50y9HD1PvrF3RU.jpg', user_id:'2', total_score:'4.0', story_score:'3.0', direction_score:'3.0',
  acting_score:'3.0', visual_score:'4.0', music_score:'4.5', body:'映像が前作より格段に進化していた。また音楽も相変わらず素晴らしいが、それ以外は前作を下回ったイメージ', tag_list:["ディズニー", "音楽がいい", "映像がすごい"])
Review.create!(movie_id:'330457', title:'アナと雪の女王2', poster_path:'/eiai3yefICyTt50y9HD1PvrF3RU.jpg', user_id:'3', total_score:'3.0', story_score:'3.0', direction_score:'3.0',
  acting_score:'4.0', visual_score:'4.0', music_score:'4.5', body:'映像と音楽は圧倒的。紅葉の名所に出かけなくてもこの映画で充分堪能できる。中身は何やら民族共存のような中途半端なイデオロギーが入っていて胡散臭さが否めない。', tag_list:["ディズニー", "子供が喜ぶ", "映像がすごい"])
Review.create!(movie_id:'330457', title:'アナと雪の女王2', poster_path:'/eiai3yefICyTt50y9HD1PvrF3RU.jpg', user_id:'9', total_score:'4.0', story_score:'3.0', direction_score:'3.5',
  acting_score:'4.0', visual_score:'4.0', music_score:'4.5', body:'1も2も、特に前半部分に展開を持っていきすぎて、観客を置いてけぼりにしてしまう感は否めなかったが、2は後半部分の追い上げが良かった。映像や音楽が素晴らしくて何度か鳥肌が立つシーンも。', tag_list:["ディズニー", "子供が喜ぶ", "ハッピーエンド"])
Review.create!(movie_id:'330457', title:'アナと雪の女王2', poster_path:'/eiai3yefICyTt50y9HD1PvrF3RU.jpg', user_id:'10', total_score:'3.5', story_score:'3.5', direction_score:'3.0',
  acting_score:'3.0', visual_score:'3.0', music_score:'4.0', body:'ギャグに関しても高クオリティーで、観客の方から結構笑いが起こっていた。特にオラフ。', tag_list:["ディズニー", "かわいい", "笑える"])

Review.create!(movie_id:'475557', title:'ジョーカー', poster_path:'/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', user_id:'1', total_score:'4.5', story_score:'4.5', direction_score:'4.5',
  acting_score:'5.0', visual_score:'4.5', music_score:'4.5', body:'ジョーカーという男はこんなにもわかりやすかったのか、と驚いた。バットマンシリーズはそれぞれ独立した世界なので、今回のジョーカーはこういう解釈なのだと言われてしまえばそれまでだが、本作はノーランの『ダークナイト』に近いリアル路線の世界観だったので、ノーラン版の印象をそのまま引きずって観ていたので驚いたのだ。', tag_list:["大人向け", "後味悪い", "怖い", "衝撃の展開"])
Review.create!(movie_id:'475557', title:'ジョーカー', poster_path:'/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', user_id:'2', total_score:'4.0', story_score:'4.0', direction_score:'3.5',
  acting_score:'5.0', visual_score:'3.0', music_score:'3.5', body:'本作は、絶望の果てにある妙にあっけらかんとした心の荒野を大都会のど真ん中に設定して、人の世の悲喜劇を新たな形で提示する。今年一番の強烈な映画体験。そろそろ始まるアワードシーズンを間違いなく牽引する1作だ。', tag_list:["大人向け", "後味悪い", "怖い", "衝撃の展開", "演技やばい"])
Review.create!(movie_id:'475557', title:'ジョーカー', poster_path:'/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', user_id:'3', total_score:'4.0', story_score:'4.0', direction_score:'3.5',
  acting_score:'5.0', visual_score:'4.0', music_score:'3.5', body:'映画を見ながらこんなに身震いしたのは初めてだ。これはDCコミックの超有名ヴィランの誕生秘話の域を超えて、現代社会の喉元にナイフを食い込ませるかのような狂気と絶望に満ちた作品だ。', tag_list:["大人向け", "怖い", "衝撃の展開", "演技やばい"])
Review.create!(movie_id:'475557', title:'ジョーカー', poster_path:'/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', user_id:'4', total_score:'4.0', story_score:'4.0', direction_score:'4.5',
  acting_score:'4.5', visual_score:'2.5', music_score:'3.0', body:'観客が無意識に、その根の最も暗い部分で共感してしまう恐ろしい映画。そして、すべてが終わった後観客は、これがフィクションであることを思い出して、はっとするのだ。', tag_list:["大人向け", "怖い", "衝撃の展開", "演技やばい"])
Review.create!(movie_id:'475557', title:'ジョーカー', poster_path:'/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', user_id:'11', total_score:'4.0', story_score:'4.0', direction_score:'4.0',
  acting_score:'5.0', visual_score:'4.0', music_score:'4.0', body:'これでもか！って位に切ないエピソードが満載で、何故か…もぉ、ええわ。ってならんのです。結局、全部観たけど……感情移入出来ない。', tag_list:["大人向け", "共感できない", "感情移入できない", "演技やばい"])

Review.create!(movie_id:'420817', title:'アラジン', poster_path:'/gjRMllVEvdLGmj48DXyl54qJtta.jpg', user_id:'1', total_score:'4.5', story_score:'4.5', direction_score:'4.5',
  acting_score:'4.5', visual_score:'4.5', music_score:'4.5', body:'フレンドライクミーのアラジンとジニーのダンスとか、めっちゃかっこよかった♡', tag_list:["ディズニー", "ダンス", "イケメン"])
Review.create!(movie_id:'420817', title:'アラジン', poster_path:'/gjRMllVEvdLGmj48DXyl54qJtta.jpg', user_id:'2', total_score:'3.5', story_score:'3.5', direction_score:'4.0',
  acting_score:'4.0', visual_score:'3.5', music_score:'5.0', body:'ミュージカル映画ではないのですが素晴らしい音楽が自然と身体にのってくる映像技術もピカイチ', tag_list:["ディズニー", "音楽がいい", "イケメン"])
Review.create!(movie_id:'420817', title:'アラジン', poster_path:'/gjRMllVEvdLGmj48DXyl54qJtta.jpg', user_id:'3', total_score:'4.0', story_score:'3.5', direction_score:'3.0',
  acting_score:'3.0', visual_score:'4.0', music_score:'4.5', body:'ジーニーは吹き替えでもウィル・スミスの演技がそのまま伝わってくてさすがだな〜と。いつか字幕でもう一度見たい。', tag_list:["ディズニー", "音楽がいい", "ジーニー"])

Relationship.create!([
  {following_id: 1, follower_id: 2},
  {following_id: 1, follower_id: 3},
  {following_id: 1, follower_id: 4},
  {following_id: 1, follower_id: 5},
  {following_id: 1, follower_id: 6},
  {following_id: 1, follower_id: 7},
  {following_id: 1, follower_id: 9},
  {following_id: 1, follower_id: 11},
  {following_id: 1, follower_id: 12},
  {following_id: 1, follower_id: 19},
  {following_id: 2, follower_id: 1},
  {following_id: 2, follower_id: 3},
  {following_id: 2, follower_id: 4},
  {following_id: 2, follower_id: 5},
  {following_id: 2, follower_id: 6},
  {following_id: 2, follower_id: 7},
  {following_id: 2, follower_id: 9},
  {following_id: 2, follower_id: 12},
  {following_id: 2, follower_id: 14},
  {following_id: 2, follower_id: 17},
  {following_id: 2, follower_id: 13},
  {following_id: 2, follower_id: 11},
  {following_id: 3, follower_id: 1},
  {following_id: 3, follower_id: 2},
  {following_id: 3, follower_id: 4},
  {following_id: 3, follower_id: 6},
  {following_id: 3, follower_id: 8},
  {following_id: 3, follower_id: 10},
  {following_id: 3, follower_id: 12},
  {following_id: 3, follower_id: 14},
  {following_id: 3, follower_id: 16},
  {following_id: 3, follower_id: 18},
  {following_id: 4, follower_id: 1},
  {following_id: 4, follower_id: 3},
  {following_id: 4, follower_id: 5},
  {following_id: 4, follower_id: 7},
  {following_id: 4, follower_id: 9},
  {following_id: 4, follower_id: 11},
  {following_id: 4, follower_id: 13},
  {following_id: 4, follower_id: 15},
  {following_id: 4, follower_id: 17},
  {following_id: 4, follower_id: 19},
  {following_id: 5, follower_id: 1},
  {following_id: 5, follower_id: 4},
  {following_id: 5, follower_id: 8},
  {following_id: 5, follower_id: 12},
  {following_id: 5, follower_id: 16},
  {following_id: 5, follower_id: 6},
  {following_id: 5, follower_id: 9},
  {following_id: 5, follower_id: 10},
  {following_id: 6, follower_id: 1},
  {following_id: 6, follower_id: 3},
  {following_id: 6, follower_id: 5},
  {following_id: 6, follower_id: 8},
  {following_id: 6, follower_id: 12},
  {following_id: 6, follower_id: 15},
  {following_id: 6, follower_id: 17},
  {following_id: 6, follower_id: 4},
  {following_id: 7, follower_id: 1},
  {following_id: 7, follower_id: 4},
  {following_id: 8, follower_id: 1},
  {following_id: 8, follower_id: 3},
  {following_id: 9, follower_id: 1},
  {following_id: 9, follower_id: 10},
  {following_id: 10, follower_id: 1},
  {following_id: 10, follower_id: 14},
  {following_id: 11, follower_id: 2},
  {following_id: 11, follower_id: 4},
  {following_id: 12, follower_id: 1},
  {following_id: 12, follower_id: 2},
  {following_id: 13, follower_id: 1},
  {following_id: 13, follower_id: 2},
  {following_id: 14, follower_id: 1},
  {following_id: 14, follower_id: 2},
  {following_id: 15, follower_id: 1},
  {following_id: 15, follower_id: 2},
  {following_id: 16, follower_id: 1},
  {following_id: 16, follower_id: 2},
  {following_id: 17, follower_id: 1},
  {following_id: 17, follower_id: 2}
])

Interest.create!([
  {user_id: 1, movie_id: 420817, title: "アラジン", poster_path: "/gjRMllVEvdLGmj48DXyl54qJtta.jpg"},
  {user_id: 1, movie_id: 475557, title: "ジョーカー", poster_path: "/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg"},
  {user_id: 1, movie_id: 330457, title: "アナと雪の女王2", poster_path: "/eiai3yefICyTt50y9HD1PvrF3RU.jpg"},
  {user_id: 1, movie_id: 496243, title: "パラサイト 半地下の家族", poster_path: "/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg"},

  {user_id: 2, movie_id: 475557, title: "ジョーカー", poster_path: "/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg"},
  {user_id: 2, movie_id: 330457, title: "アナと雪の女王2", poster_path: "/eiai3yefICyTt50y9HD1PvrF3RU.jpg"},
  {user_id: 2, movie_id: 496243, title: "パラサイト 半地下の家族", poster_path: "/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg"},

  {user_id: 3, movie_id: 420817, title: "アラジン", poster_path: "/gjRMllVEvdLGmj48DXyl54qJtta.jpg"},
  {user_id: 3, movie_id: 330457, title: "アナと雪の女王2", poster_path: "/eiai3yefICyTt50y9HD1PvrF3RU.jpg"},
  {user_id: 3, movie_id: 496243, title: "パラサイト 半地下の家族", poster_path: "/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg"},

  {user_id: 4, movie_id: 420817, title: "アラジン", poster_path: "/gjRMllVEvdLGmj48DXyl54qJtta.jpg"},
  {user_id: 4, movie_id: 475557, title: "ジョーカー", poster_path: "/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg"},
  {user_id: 4, movie_id: 496243, title: "パラサイト 半地下の家族", poster_path: "/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg"},

  {user_id: 5, movie_id: 420817, title: "アラジン", poster_path: "/gjRMllVEvdLGmj48DXyl54qJtta.jpg"},
  {user_id: 5, movie_id: 475557, title: "ジョーカー", poster_path: "/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg"},
  {user_id: 5, movie_id: 330457, title: "アナと雪の女王2", poster_path: "/eiai3yefICyTt50y9HD1PvrF3RU.jpg"},

  {user_id: 6, movie_id: 475557, title: "ジョーカー", poster_path: "/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg"},
  {user_id: 6, movie_id: 330457, title: "アナと雪の女王2", poster_path: "/eiai3yefICyTt50y9HD1PvrF3RU.jpg"},
  {user_id: 6, movie_id: 496243, title: "パラサイト 半地下の家族", poster_path: "/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg"},

  {user_id: 7, movie_id: 420817, title: "アラジン", poster_path: "/gjRMllVEvdLGmj48DXyl54qJtta.jpg"},
  {user_id: 7, movie_id: 330457, title: "アナと雪の女王2", poster_path: "/eiai3yefICyTt50y9HD1PvrF3RU.jpg"},

  {user_id: 8, movie_id: 496243, title: "パラサイト 半地下の家族", poster_path: "/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg"},
  {user_id: 8, movie_id: 330457, title: "アナと雪の女王2", poster_path: "/eiai3yefICyTt50y9HD1PvrF3RU.jpg"},

  {user_id: 9, movie_id: 496243, title: "パラサイト 半地下の家族", poster_path: "/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg"},
  {user_id: 9, movie_id: 330457, title: "アナと雪の女王2", poster_path: "/eiai3yefICyTt50y9HD1PvrF3RU.jpg"},

  {user_id: 10, movie_id: 496243, title: "パラサイト 半地下の家族", poster_path: "/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg"},
  {user_id: 10, movie_id: 330457, title: "アナと雪の女王2", poster_path: "/eiai3yefICyTt50y9HD1PvrF3RU.jpg"},

  {user_id: 11, movie_id: 496243, title: "パラサイト 半地下の家族", poster_path: "/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg"},
  {user_id: 11, movie_id: 330457, title: "アナと雪の女王2", poster_path: "/eiai3yefICyTt50y9HD1PvrF3RU.jpg"},

  {user_id: 12, movie_id: 496243, title: "パラサイト 半地下の家族", poster_path: "/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg"},
  {user_id: 13, movie_id: 496243, title: "パラサイト 半地下の家族", poster_path: "/kNDkdMSdbP7rlGwpjUhQklmWijT.jpg"}
])

3.times do |i|
  Good.create!(user_id: 1, review_id: i+1)
end
4.times do |i|
  Good.create!(user_id: 2, review_id: i+2)
end
3.times do |i|
  Good.create!(user_id: 3, review_id: i+3)
end
5.times do |i|
  Good.create!(user_id: 4, review_id: i+1)
end
4.times do |i|
  Good.create!(user_id: 5, review_id: i+2)
end

3.times do |i|
  Good.create!(user_id: 6, review_id: i+2)
end
5.times do |i|
  Good.create!(user_id: 7, review_id: i+2)
end
4.times do |i|
  Good.create!(user_id: 8, review_id: i+3)
end
3.times do |i|
  Good.create!(user_id: 9, review_id: i+1)
end
5.times do |i|
  Good.create!(user_id: 10, review_id: i+3)
end



2.times do |i|
  Bad.create!(user_id: 1, review_id: i+6)
end
3.times do |i|
  Bad.create!(user_id: 2, review_id: i+6)
end
2.times do |i|
  Bad.create!(user_id: 3, review_id: i+7)
end
4.times do |i|
  Bad.create!(user_id: 4, review_id: i+6)
end
3.times do |i|
  Bad.create!(user_id: 5, review_id: i+7)
end

5.times do |i|
  Bad.create!(user_id: 6, review_id: i+6)
end
4.times do |i|
  Bad.create!(user_id: 7, review_id: i+7)
end
3.times do |i|
  Bad.create!(user_id: 8, review_id: i+8)
end
5.times do |i|
  Bad.create!(user_id: 9, review_id: i+6)
end
4.times do |i|
  Bad.create!(user_id: 10, review_id: i+6)
end

3.times do |i|
  Good.create!(user_id: 11, review_id: i+1)
end
2.times do |i|
  Good.create!(user_id: 12, review_id: i+1)
end
3.times do |i|
  Good.create!(user_id: 13, review_id: i+1)
end
2.times do |i|
  Good.create!(user_id: 14, review_id: i+1)
end
3.times do |i|
  Good.create!(user_id: 15, review_id: i+1)
end

4.times do |i|
  Bad.create!(user_id: 11, review_id: i+2)
end
3.times do |i|
  Bad.create!(user_id: 12, review_id: i+2)
end
4.times do |i|
  Bad.create!(user_id: 13, review_id: i+2)
end
4.times do |i|
  Bad.create!(user_id: 14, review_id: i+2)
end
3.times do |i|
  Bad.create!(user_id: 15, review_id: i+2)
end

Good.create!([
  {user_id: 1, review_id: 32},
  {user_id: 2, review_id: 32},
  {user_id: 15, review_id: 32},
  {user_id: 16, review_id: 32},
  {user_id: 17, review_id: 32},
  {user_id: 18, review_id: 32},
  {user_id: 15, review_id: 31},
  {user_id: 16, review_id: 31},
  {user_id: 17, review_id: 27},
  {user_id: 18, review_id: 25}
  ])
  Bad.create!([
  {user_id: 1, review_id: 30},
  {user_id: 2, review_id: 30},
  {user_id: 15, review_id: 30},
  {user_id: 16, review_id: 30},
  {user_id: 17, review_id: 30},
  {user_id: 18, review_id: 30},
  {user_id: 15, review_id: 28},
  {user_id: 16, review_id: 28},
  {user_id: 17, review_id: 26},
  {user_id: 18, review_id: 24}
])

