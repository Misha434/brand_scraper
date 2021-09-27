# Brand Scraper
## 作成した目的
- 前提: ポートフォリオ(PF)としてスマホ比較アプリを開発中
- たくさんあるブランド名を登録を各々手入力で入力していくのは非効率的
- そこでPFに以前つけた "CSV インポート機能" を利用して一括で登録したい
- その前処理として(Wikipediaを利用したAPI)から、csvデータを収集するためのツールを作成

## Quick Demo
![brand_scraper_210928](https://user-images.githubusercontent.com/61964919/134937808-4e03913f-694d-434f-928a-63b1ade38800.gif)


## 使い方
- 例: [List of mobile phone brands by country - Wikipedia](https://en.wikipedia.org/wiki/List_of_mobile_phone_brands_by_country)

- brand_scraper.rb
```
### URL の https:***/wiki/<page_title> : <page_title> を入力
page_title = "List_of_mobile_phone_brands_by_country"

### リンク先 記事内の何番目の表の情報を収集するかを指定(順番は下記参照)
table_order = 0
```

- リンク先を例とした、表の順番
  - 0番目
    - ![table_0](https://user-images.githubusercontent.com/61964919/134938952-07c279c1-6515-402a-adda-29608255c588.png) 
  - 1番目
    - ![table_1](https://user-images.githubusercontent.com/61964919/134938947-d59529b1-90a1-4890-a95f-51f85e6b2881.png)
  - 2番目
    - ![table_2](https://user-images.githubusercontent.com/61964919/134938925-232799e2-b1ad-417c-b6f5-1978dcced58f.png)

- スクリプトを実行すると ブランド一覧をcsv形式にした "brand_name.csv" が生成・上書きされる

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