## コマンドラインで新しいリポジトリを作成する場合

```
echo "# jam-uber-eats-like" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/JAMChannel/jam-uber-eats-like.git
git push -u origin main
```

## コマンドラインから既存のリポジトリをプッシュする場合

```
git remote add origin https://github.com/JAMChannel/jam-uber-eats-like.git
git branch -M main
git push -u origin main
```