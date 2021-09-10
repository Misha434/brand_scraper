# Brand Scraper
## 作成した目的
- 前提: ポートフォリオ(PF)としてスマホ比較アプリを開発中
- たくさんあるブランド名を登録を各々手入力で入力していくのは非効率的
- そこでPFに以前つけた "CSV インポート機能" を利用して一括で登録したい
- その前処理として(Wikipediaを利用したAPI)から、csvデータを収集するためのツールを作成

## 使い方
スクリプトを実行すると ブランド一覧をcsv形式にした "brand_name.csv" が生成・上書きされる

```
$ git clone https://github.com/Misha434/brand_scraper.git
## docker 環境
$ docker-compose build
$ docker-compose run ruby
```

## 苦労したポイント
- MediaWiki の使用方法が難しい(表形式のデータをjsonで返す方法がわからなかった)
  - 代わりに[wikitable2json.com](https://www.wikitable2json.com/) を利用させていただきました。
- 苦労というと大げさだが、array の扱いに少しだけつまずいた

## 今後の課題
- [ ] 汎用性を持たせる。表を持つページからcsv, json形式で表のデータを作成できるようにする
- [ ] エラー時の処理を追加
- [ ] テスト