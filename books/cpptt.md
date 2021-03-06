# C++テンプレートテクニック 初版
[本書の最新版はこちらです。](http://www.amazon.co.jp/dp/4797376686/ref=as_sl_pc_tf_lc?tag=faithandbrave-22&camp=243&creative=1615&linkCode=as1&creativeASIN=4797376686&adid=1DEH8ZMYCH8VJ1SAJRZB&&ref-refURL=http%3A%2F%2Ffaithandbrave.hateblo.jp%2F)

<img src="../image/cpptt.jpg">

- 書名 : 『C++テンプレートテクニック - 簡潔で再利用しやすいコードのためのC++活用術』
- 著者 : επιστημη、高橋 晶
- 編集 : 白川 潤一
- 出版社 : ソフトバンククリエイティブ
- ページ数 : 352
- ISBN-10 : 4797354534
- ISBN-13 : 978-4797354539
- 発売日： 2009年4月25日
- [正誤情報はこちら](http://www.sbcr.jp/support/8672.html)


## 購入先
- [Amazon.co.jp](http://www.amazon.co.jp/dp/4797354534/ref=as_sl_pc_tf_lc?tag=faithandbrave-22&camp=243&creative=1615&linkCode=as1&creativeASIN=4797354534&adid=1HZB8Y5VN0EJWVQ2J9X0&&ref-refURL=http%3A%2F%2Ffaithandbrave.hateblo.jp%2Fentry%2F20090408%2F1239205628)
- [SBクリエイティブ](http://www.sbcr.jp/products/4797354539.html)


## 書籍概要
本書は、プログラミング言語C++の特徴的な機能である「テンプレート」を使用した、さまざまな技法を紹介しています。

C++のテンプレートは、パラメタライズド・タイプ(parameterized type)という、処理に使用する型をパラメータ化する機能です。この機能を使用することにより、型が違うだけで同じことをするプログラムコードを共通化でき、コードの再利用性を高めることができます。その共通化は、簡単なコードであればテンプレートを単に使用するだけで行えますが、「特定の型、または特定の条件に一致する型の場合は、違うことをしたい」のような要求が発生した場合には、いくつかの「技法」が必要になります。

本書で紹介するテンプレートに関する技法は、C++のユーザーコミュニティが長年かけて編み出してきたものたちです。C++は、「言語機能は極力増やさない。できるかぎりライブラリで実現せよ」という設計思想を持った言語です。そのため、ライブラリを作るユーザーが「技を編み出す」という場面が多くあります。本書はそういった、ひらめきの結晶、人類の叡智といったものを集めた書籍になっています。
本書を読むことで、テンプレートを使用した既存の技法を身につけるだけでなく、新たな技法を編み出し、C++やプログラミングをさらなる高みへと押し上げてくれる方が現れることを願っております。


## コンセプト
C++入門書に記載されているテンプレートの解説と、難しいと言われているテンプレート技法の書籍[『Modern C++ Design』][modern_cpp_design]の中間になる本を出そう、というのが初期のコンセプトです。
執筆当時は、C++テンプレートの有名な書籍である[『C++ Templates: The Complete Guide』][cpp_templates]や[『C++ Template Metaprogramming』][cpp_tmp]がまだ日本語訳されていなかったので、そのあたりもカバーすることを目指しました。

第12章「C++0xにおけるテンプレート」は、本書の付加価値として書きました。当時、策定中だったC++0xを追いかけている日本人はほとんどおらず、主に私が日本語で情報発信を行っていました。C++0xが真新しい情報であり、本書に注目を集める材料となる、というのがひとつの目的です。それに加えて、執筆中の本書がC++0xの策定によって、古くて役に立たなくなる、というのを防ぐ目的もあります。


## 担当分け
第1章から第3章はεπιστημηさん、それ以降の第4章から第12章を私、というように担当を設定していました。著者の内部的には「基礎」と「発展」の二部構成にしてあります。
しかし実際には、επιστημηさんがお忙しい時期があったために、私も第2章と第3章をお手伝いしていました。


## 執筆期間
執筆期間は、私が参加したネタ出しと章立て、および執筆とレビューが完了したあとの校正も含めて、約1年間でした。
ペースとしては、1ヶ月に2章ずつ仕上げました。
私とエピさんが書き上がった時点から、レビュアーさんたちにレビューをしてもらい、そのレビューと直しに3ヶ月ほどかかりました。


## 表紙デザイン
本書の表紙には、スパナ、ドライバー、六角レンチなどが並んでいます。[『Modern C++ Design』][modern_cpp_design]の表紙が10徳ナイフなので、それにあやかったものになっています。10徳ナイフは、「テンプレートというひとつの機能が、多くのことを表現できる」とかそういったことを表現しているのでしょう。
本書の表紙デザインは編集側が考えたものですが、正直なところ、私は気に入っていません。私の印象では、本書が[『Modern C++ Design』][modern_cpp_design]の劣化版であることを表現しているように感じます。
第2版の方は、私に表紙デザインのコンセプトを決めさせてもらえたので、非常に気に入っています。そちらのデザインについては、第2版のページで解説します。


## 本書執筆の経緯
ある日、私のもとに、επιστημη(えぴすてーめー)さんから一本のメールが来ました。

エピ：「いま、テンプレートの本を書こうとしてるんだけど、なんかネタない？」
私： 「思いつく限りのネタを列挙してみました。(テンプレートメタプログラミング、SFINAE、テンプレート型変換演算子、ポリシーに基づく設計など)」
エピ： 「じゃあ、書いて♪」

こういった経緯から、書籍の執筆に関われるチャンスだと思い、執筆に参加させていただくことになりました。
エピさんとは、わんくま同盟の東京勉強会で知り合いました。このとき声を掛けていただいたのは、私がわんくま同盟の勉強会で、策定中だったC++0xの機能について、発表をしたからだったと思います。


## 書かなかったこと
当時、知っていながら書かなかったものが、いくつかあります。

まず、型リスト。[『Modern C++ Design』][modern_cpp_design]でも大きく取り上げられ、実際に有用な技法でした。しかし、C++03でBoost.MPLのような優れた型リストを実装するのは困難がともなうのと、当時C++0xに可変引数テンプレートが導入予定だということがわかっていたこともあり、本書初版では紹介しませんでした。
型リストは、第2版でC++11に対応する際、改めて紹介を書きました。

もうひとつは、「他言語でのテンプレート相当の機能紹介」です。これはたとえば、JavaやC#のジェネリクス、Haskellの多相型・型クラス、Ruby界隈で使われる用語「ダック・タイピング」などです。これらは、本書の技法が他言語でも役立つこと、またその逆に、他言語ユーザーでも本書の技法が良い学びになること、いろいろな言語の似て非なる機能を学ぶことで知見を広めてもらいたい、などを目的としたかったのです。しかしこれは断念しました。その理由としては、私の中途半端な知識で、他言語について書きたくなかったからです。しっかりしたものを書くには、それなりの調査期間が必要となりますが、その期間を確保するのが難しかったため、書かないことにしました。


## 執筆の思い出
### 文章の書き方・説明の量
当時の私は、ブログで公開文章を書いてはいましたが、それほどうまく日本語を扱えていたわけではありませんでした。雑誌のような企業が管理する媒体での記事執筆もしていませんでした。私がブログで書く文章は「ひとつの記事が、1〜2分程度で簡潔に読めるように」を心がけていたこともあって、あまり詳細な説明も書いてきませんでした。
そのため、書籍というターゲット環境向けに文章を書くのに、少し戸惑いました。編集さんにもそう説明した上で、試しにひとつの章を書いて、それを編集さんに見てもらうことにしました。それを見てもらって編集さんに言われたのが「説明は、書きすぎるということはないから、もっと書いてほしい」ということでした。これはその後に文章を書くときにも、よく思い出す言葉です。
本書初版は、私のこれまでの癖もあって、簡潔な説明が多く残っています。それに対して「説明がさらっとしていて読みやすい」という好意的な感想も多くいただきました。しかしやはり、とくに書籍という媒体では、しっかりとした説明が必要だと考えてその後文章を書いてきたので、今ではもう、あのときのような簡潔な文章は無意識には書けなくなっています。

### レビュアー集め
本書の執筆において、ひと通りの内容を書ききった段階から、何人かのC++エキスパートにレビューをしていただくことにしました。レビュアー集めは、私とエピさんが声をかけました。そのときに集まったメンバー主に、わんくま同盟コミュニティのつながりでした。それに加えて、C++標準化委員会で知り合った[uskzさん][uskz]と[近藤さん][redboltz]にも参加していただけました。編集さんにもお願いすればレビュアーを探してきてもらえるのですが、私たち著者のつながりでレビュアー集めをしました。信頼できる方々とのつながりがあったのは幸いでした。

### 動機が弱い
レビューには、プログラマにはおなじみのバグ管理システムTracを使用しました。これは、[近藤さん][redboltz]がシステムを用意してくれました。
書籍という媒体で文章を書いたことがないのは、やはり大きかったです。[めるぽん][melpon]と[近藤さん][redboltz]から、「動機が弱い」という問題が報告されるたびに、頭を抱えていたのを覚えています。そのたびに、紹介している技法を調べ直し、動機やユースケースを収集し、文章をまとめ直したりしていました。彼らが発売前に指摘してくれなかったら、本書は「何に役立つのかわからない」「こんなのはただの遊びだ、実用的じゃない」というような評価が大半になっていたことでしょう。

### 調査不足と思い込み
第11章で書いた「Extension Member Function」というのは、C#の言語機能である「拡張メソッド(Extension Method)」をC++で実現しよう、というもので、私が名前を付けたものです。これは、PStade.OvenやBoost.Rangeが採用しているパイプ演算子(`operator|()`)を、Rangeアダプタとして使用するだけでなく、メンバ関数を後付けする汎用的な技法にしよう、と思い立って書いた章になります。
この章のために、いくつかのRangeアダプタの実装を紹介用に書いて、それをもとに文章にまとめました。それに対して[uskzさん][uskz]から、「この実装では遅延評価が考慮されていない。PStade.OvenとBoost.Rangeは、イテレータによって処理を遅延させていて、Rangeアダプタがその場で処理を実行するわけではない」という指摘が行われました。私は、Rangeアダプタの技術を正しく理解しない状態で、執筆を進めていたのでした。[uskzさん][uskz]に多大な感謝をしつつ、Rangeアダプタの概念と実装を調べ直し、この章をまるまる書き直すことになりました。
あのときは自分の不甲斐なさにだいぶ落ち込んだものですが、これもまた、発売前のレビューが重要だと思えた出来事でした。

### サンプルコードはとっておくべし
文章中に載せるコードは、自分でサンプルコードを書いて、Wordの原稿データに貼り付け、元のサンプルコードを破棄していました。そのようにしていたため、レビュー段階になって、複数コンパイラでの検証が難しくなりました。あのときは、[あんどちんさん][andochin]が原稿データからサンプルコードを手作業で抽出して、検証を進めてくれました。そのことがあってからは、使用したサンプルコードは、しっかりとっておくようにしました。

### 編集さんはプログラマではない
編集さんはプログラマというわけではないので、こちらが指定しないとわからないことがあります。
たとえば、可変引数を表すコード中の「`...`」(ドットx3)を、省略形だと判断して「`…`」(三点リーダー)に置き換えてしまったりします。「ドットx3は、プログラムとして意味のあるものですので、置き換えないでください」のように、指示してあげる必要があります。
文章中のコードも、編集さんの判断で等幅フォントにしてくれたりはしませんので、等幅フォントにしたいところは、全て指示してあげる必要があります。

### 1日の執筆量
書籍1冊の分量は、目安として最低で300ページ。編集さんからは「それより少ないと値段がつけられない」と言われていました。
本の大きさはB5版だと事前にわかっていたので、それに合わせて、1日に何ページくらい書けるのかを測定しました。そのときは、休日に丸1日かけて11ページが限界でした。そして、1日に限界まで作業すると、あとが続かないこともわかりました。
書籍は情熱をもって「えいやっ」という感じで一気に書き上げることはできません。これには、私は本業が別にあり、副業としてプライベートの時間や仕事の合間に作業をしているので、書籍に全力で取り組むことができないという理由も含まれます。しかし、情熱は短期間しかもたない、というのがより大きな理由です。たとえフルタイムで書籍の執筆に携われたとしても、数日程度なら続いたとしても、数十日は情熱が維持できません。
クリエイティブな仕事をしている人はおそらく皆そうなのだと思いますが、私は飽きっぽい性格も相まって、やりたいことが毎日のように溢れてきます。そうすると、ひとつのことに情熱を注いでいるとそのうちに「ほかにもやりたいことがあるのに…」とイライラしてきてしまいます。そこでほかのことを一度はじめてしまうと、元々やっていた作業の優先度がどんどん下がっていってしまいます。そうなると最悪の場合、書籍の執筆が中断、もしくは断念ということになりかねません。
期間が長い副業を続けるには、情熱を抑えて習慣化する必要があります。1日の作業量を減らし、毎日無理なく進められるくらいにするのがいいでしょう。(関連記事：[「情熱はときに邪魔になる - 信念と勇気、その先へ」](http://faithandbrave.blogspot.jp/2012/10/blog-post_27.html))

### レビュー指摘数
Tracに投稿されたレビューの件数は、400件ちょっとでした。1ページに1つ以上は指摘があった計算になります。
書籍は一度発売してしまうと修正がきかない媒体です。これは、バグに対する要求が非常に厳しいソフトウェアを書いているようなものです。読者からはバグが0件の製品のみが求められている、と考えて取り組みました。
レビューが投稿されると、うんざりすることもありますが、それを直すたびに安心感が増します。


[uskz]: https://github.com/uskz
[redboltz]: https://github.com/redboltz
[melpon]: https://github.com/melpon
[andochin]: https://github.com/andochin


## 執筆ツール
- 原稿執筆 : (私は)Microsoft Word
- 連絡 : メール
- レビュー : バグ管理システム[Trac](http://trac.edgewall.org/)
- 校正データ(PDF)のストレージ : Microsoft SkyDrive


## 振り返り
私にとって初の書籍執筆だったこともあり、執筆のツールとして、よく考えずにMicrosoft Wordを使っていました。
あとになって振り返ると、ツールの選択は失敗でした。Wordには校正機能がついているため、些細な日本語の間違いは指摘してくれます。しかし、プログラムコードが多く出てくる書籍ではやはり、リッチテキストエディタよりも、プレーンテキストエディタの方が何かと都合がいいです。プレーンテキストの方はたとえば、バージョン管理システムとの相性がいいので、レビューの管理もしやすくなります。

レビューのツールとしてTracを使用したのは、成功でした。
レビュアーが指摘し、著者とともに修正内容を検討し、編集さんがPDFに反映させ、確認がとれたらチケットを閉じる、という一連の流れがよどみなく動いていました。

本書の執筆をはじめたのは、ちょうど私が、Boost C++ Librariesのコードを読んで自分で実装してみたり、といったことをやっていた時期だったので、半分は趣味のような本に仕上がりました。そのおかげか、私の「楽しい」という感情がうまく伝搬してくれた読者の方が、何人もおられました。やはり、書いている人の感情とかやる気は、読者に伝わるものなのだと実感しました。


## みんなのサイン
宝物です。

<img src="../image/cpptt_friends.jpg" width="60%">


## 執筆後の思い出
私が[近藤さん][redboltz]とC++Now! 2012に参加したとき、書籍[『C++ Templates: The Complete Guide』][cpp_templates]の著者である[Daveed Vandevoordeさん](http://www.vandevoorde.com/Daveed/)がキーノートの発表者として来ていました。そのとき、私たちの『C++テンプレートテクニック』をDaveedさんにプレゼントしました。[『C++ Templates』][cpp_templates]はすばらしい書籍でした。その著者の方とお会いでき、さらに自分が書いた本を受け取っていただけて、非常にうれしかったです。
私が持参した[『C++ Templates』][cpp_templates]に、サインもいただけました。

<img src="../image/david_signiture.jpg" width="60%">

また、そのときのC++Now!では、書籍[『C++ Template Metaprogramming』][cpp_tmp]の著者である[Dave Abrahamsさん](http://daveabrahams.com/)にもお会いできました。じつはそのときは、彼に用事があったからC++Now!に行ったのでした(『プログラミングの魔導書 Vol.2』で彼にインタビューをしたので、その関係です)。
Daveにも、私が持参した[『C++ Template Metaprogramming』][cpp_tmp]に、サインをいただけました。

<img src="../image/dave_signiture.jpg" width="60%">

C++テンプレートに関する偉大な名著を書かれたこのお二人に会えて、サインもいただけて、感謝感激です。


## 関連ページ
- [『C++テンプレートテクニック』もうすぐ発売です。 - Faith and Brave - C++で遊ぼう](http://faithandbrave.hateblo.jp/entry/20090408/1239205628)
- [C++Now2012体験記 - redboltzの日記](http://d.hatena.ne.jp/redboltz/20120519/1337385881)

[modern_cpp_design]: https://www.amazon.co.jp/dp/4894714353?tag=faithandbrave-22&camp=1027&creative=7407&linkCode=as4&creativeASIN=4894714353&adid=1P3B388D777W6VBNQR7Y&
[cpp_templates]: https://www.amazon.co.jp/dp/0201734842?tag=faithandbrave-22&camp=1027&creative=7407&linkCode=as4&creativeASIN=0201734842&adid=0YKDDDCSSPTSDY2MXQFN&
[cpp_tmp]: https://www.amazon.co.jp/dp/B003XNTTBW?tag=faithandbrave-22&camp=1027&creative=7407&linkCode=as4&creativeASIN=B003XNTTBW&adid=0ET2VW05FGP32TVE8HYD&


