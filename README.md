高橋 晶の個人サイト。

ここでは、サイトの内容となるMarkdown形式のテキストと、それをHTMLに変換するコンバーターを置いてある。学習の記録として、コンバーターの内容を簡単に書いておく。


##1. Pandocを使用して、MarkdownをHTMLに変換
[Pandoc](http://pandoc.org/)は、いろいろな形式に対応した、テキスト形式のコンバーター。これを使用して、MarkdownをHTMLに変換している。

実際には、Rubyスクリプト`convert_html.rb`から、`system()`関数を使って`pandoc`コマンドを実行している。

```ruby
system("pandoc -o #{dst_filename} #{src_filename} -f markdown+hard_line_breaks --template=template.html")
```

`-f markdown+hard_line_breaks`は、改行ひとつで`<br/>`を強制的に入れる、Markdownの拡張機能を有効にするオプション。Markdownは改行を2回入れるか、行末にスペースを2つ入れるかしないと改行しないのでめんどくさかった。

`template=template.html`は、雛形となるHTMLファイルを指定するオプション。ここで指定された雛形HTMLの`$body$`と記述された部分が、pandocでMarkdownから変換されたHTMLに置き換わる。


##2. CSSにはBootstrapを採用
ページの見た目をよくするためには、[Bootstrap](http://getbootstrap.com/)を使用している。

```html
<!-- template.html -->
<link rel="stylesheet" href="META_ROOT_PATH/bootstrap-3.3.5/css/bootstrap.min.css">
```

Bootstrapの機能としては、ナビゲーションバー(ページの最上部にあるバー)、およびサイドバーを使用している。これは、Getting Startedドキュメントから辿れる、「[Starter template](http://getbootstrap.com/examples/starter-template/)」にあったものをそのまま採用した。

ページタイトル以外のナビゲーションは、右側に配置した。

```html
<ul class="nav navbar-nav navbar-right">
  <li>META_PROJECT</li>
</ul>
```

サイドバーは、ページを12列に分割するという考え方で実装する。ここでは、左3列をサイドバーの領域とし、残りを各ページのコンテンツ(body)の領域とした。

```html
<div class="col-xs-3">
```


##3. スクリプトから雛形の一部を置き換え
雛形のHTMLファイル`template.html`には、スクリプトから自動的に置き換える要素を定義している。たとえば、以下のようなもの：

| 置き換える要素   | 説明 |
|------------------|------|
| `META_SITE_NAME` | サイト名 |
| `META_TITLE`     | ページタイトル |
| `META_PROJECT`   | GitHubのプロジェクトページ |
| `META_ROOT_PATH` | サイトのルートディレクトリ |

命名規則として、置き換える要素は「全て大文字」「`META_`接頭辞」というルールを設けている。

基本的には、ページによって変動するものを置き換え要素としている。たとえばページタイトルは、「各Markdownテキストの見出し1 + ハイフン区切り + サイト名」という形式にしている。

このような要素の置き換えを、スクリプト側で、ページ内容に応じた文字列の置換処理として行っている。


##4. 変換後HTMLに自動コミット・プッシュ
まじめに作るのであれば、以下のような作りにすることになる：

- 自分がコミット・プッシュするのは変換前の要素とコンバーターのみ
- サーバー側が、cronで定期的にプッシュを監視するとか、GitHubのフックを使うとかして、自動的にMarkdownからHTMLにコンバートしてHTML用のリポジトリにコミット・プッシュする

しかし、このリポジトリで管理するのは、個人が管理し、自分しかコミットしないものであるため、そこまでやる必要はない。

そこでここでは、`commit.rb`というRubyスクリプトを用意した。

このスクリプトにコマンドライン引数としてコミットメッセージを渡すと、このリポジトリにそのコミットメッセージでコミット・プッシュを行い、HTML用リポジトリも自動的にコミット・プッシュする、ということする。

```
> ruby commit.rb ほげほげを変更した
> (この中では、siteに対するgit commit, git push、
>  およびfaithandbrave.github.ioにgit commit, git pushが行われる)
```

