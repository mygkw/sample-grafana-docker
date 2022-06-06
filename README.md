# Grafana Sample

## 目的

Grafanaによって多様なデータソースが表示されることを試すことを目的として作成。

## Grafanaリンク

- 公式
  - https://grafana.com/
- ダッシュボード テンプレート
  - https://grafana.com/grafana/dashboards/
- デモ
  - https://play.grafana.org/d/000000012/grafana-play-home

## アクセス方法

- URL
  - http://localhost:3000
- ID/PW
  - `admin`/`admin` (初期値)

<!-- ## 導入されるプラグイン

- alexanderzobnin-zabbix-app -->

## MySQLのサンプルデータ

厚生労働省の新型コロナウィルス感染症のオープンデータ (CSV)　を元にSQLを作成
https://www.mhlw.go.jp/stf/covid-19/open-data.html

参考: 厚生労働省のグラフ表示サイト
https://covid19.mhlw.go.jp/extensions/public/index.html

### 同封しているデータ

- 陽性者数
- PCR検査実施人数
- 死亡者数

(データは2021-06-08時点のもの)

### 使用方法

```
// DockerCompose起動
docker-compose up

// DockerCompose終了
docker-compose down

// データ初期化
docker-compose exec mysql bash /tmp/sql/create.sh
```

## 操作手順

画面から操作

### DataSources追加
- URL
    - http://localhost:3000/datasources
- MySQLを選択
- 設定値
    - Host: `mysql`
    - Database: `covid19` (上記サンプルを使用する場合)
    - User: `root`
    - Password: `password`

### Explorer
- URL
    - http://localhost:3000/explore
- 設定値
    - From: 任意のテーブル
    - その他はデフォルト
- TIPS
    - 右上のtime rangeから期間指定し、データの存在を確認する
    - 保存する場合は Add Dashboardを押下する

### Dashboard
- URL
    - http://localhost:3000/dashboard/new
- Explorerと同じ手順でデータを追加する
