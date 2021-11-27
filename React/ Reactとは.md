- Reactとは

Reactは、サイトの見た目を作ることができるJavaScriptのライブラリ

- publicディレクトリ
create-react-appでReactプロジェクトを作成するとデフォルトで
publicというディレクトリが作られます。さらにこのディレクトリには
index.htmlというファイルがあり、このプロジェクトをデプロイすると、
ユーザーに公開されるのはこのpublicディレクトリにあるindex.html

- srcディレクトリ(デフォルト)
App.js
App.jsはrootコンポーネントであるAppを定義しています。
Functional ComponentであるAppは状態を持たず、
子コンポーネントをいくつか含んでいる

index.js
HTML上のid=rootの要素に対してAppコンポーネントをレンダリング
させているのがindex.jsファイルの中身

App.css
プロジェクト中の要素に対してスタイルをあてている

- srcディレクトリ(カスタム)
components/
コンポーネントをいれていく

reducers/
React Hooksの中でもreducerをいれる

customHooks/
カスタムフックスだけをいれる

images/
コンポーネントから参照する
