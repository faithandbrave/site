# C++でのテスト技法

## 例外が投げられるかどうか
catchしたらテストOK。catchせず通る、もしくは想定した例外以外が投げられたらテスト失敗とする。

```cpp
try {
    f();
    TEST(false);
}
catch (target_exception&) {
    TEST(true);
}
catch (...) {
    TEST(false);
}
```


## 浮動小数点数の比較
[Comparing Floating Point Numbers, 2012 Edition](https://randomascii.wordpress.com/2012/02/25/comparing-floating-point-numbers-2012-edition/)


## シングルトン
[シングルトンのテスト](http://faithandbrave.hateblo.jp/entry/20101227/1293433067)


## ディレクトリの存在チェック
テスト用のディレクトリをリポジトリに登録する場合、バージョン管理システムの管理ディレクトリが問題になる場合がある。
そのため、すべてのディレクトリを比較するのではなく、目的のディレクトリがすべて存在するかのチェックを行う。


## テスト用公開インタフェース
testableなインタフェースのために、本来ブラックボックス化されるべきprivateインタフェースをpublicにしなければならない場合がある。
そういう設計を嫌う場合は、テスト用のクラスをfriend登録することができる。

```cpp
class XTester;

class X {
    int id;
    std::string name;

    friend XTester;
};

class XTester {
    X& x;
public:
    XTester(X& x) : x(x) {}

    int get_id() const { return x.id; }
    std::string get_name() const { return x.name; }
};
```


## テスト用現在日時
現在日時に依存するシステムはテストしにくい。
そのため、ライブラリによって提供される現在日の時取得関数を直接使用するのではなく、カスタマイゼーションポイントを用意し、ダミーの値をいつでも返せるようにしておくことで、testableにすることができる。

```cpp
#ifdef DATE_TIME_CUSTOM_NOW_TIME
    std::time_t now_time_t();
#else
    inline std::time_t now_time_t()
    {
        std::time_t t;
        std::time(&t);
        return t;
    }
#endif
```

```cpp
#define DATE_TIME_CUSTOM_NOW_TIME

std::time_t now_time_t()
{
    std::tm t;
    t.tm_year   = 2010 - 1900;
    t.tm_mon    = 12 - 1;
    t.tm_yday   = 353;
    t.tm_mday   = 20;
    t.tm_wday   = 1;
    t.tm_hour   = 15;
    t.tm_min    = 30;
    t.tm_sec    = 45;
    t.tm_isdst  = 0;

    return std::mktime(&t);
}
```

