# 5回目 複雑な問い合わせ

## View

- 仮想的なテーブル

```sql
create view 商品合計 (商品分類, 商品数) as select 商品分類, count(*) from 商品 group by 商品分類;
```

- 商品合計という仮想的なテーブルを作成している

```sql
select * from 商品合計;
```

- Viewの削除

```sql
drop view 商品合計;
```

## サブクエリ

- slect文中に入れ子として指定されたselect文

### 使える場所

- select文の結果が複数行、複数列になるもの → from句で指定可能
- select文の結果が複数行、単一列の集合になるもの → where句で指定可能
- select文の結果が1行1列の単一の値になるもの → from句以外の任意の句で指定可能

## 関数、述語、CASE式

### 関数

#### 算術演算

- abs
- ceil
- floor
- mod
- round
- sin
- cos
- sqrt
- ...

#### 文字列関数

- length
- lower
- upper
- substring
- trim
- ...

#### 日付・時刻関数

- current_date
- current_time
- extract
- ...

#### 集約関数

- count
- max
- min
- avg
- sum

### 特殊な関数

#### 文字列連結

```sql
'abc' || 'def' -- abcdef
```

#### 型変換

```sql
cast('123' as integer) -- 123
```

#### null除去

```sql
coalesce(null, '123', null) -- '123'
```
