@echo off
@rem chcp コマンドを使用することで、バッチファイルの文字コードを明示して後続の処理を実行させることができます
@rem コードページ番号　65001　は　UTF-8となります 
@rem バッチファイルでは@remを利用することでコメントを書くことができて便利です
chcp 65001

rem 実行したい.pyファイルがあるフォルダに移動
rem docker のイメージの作成 compose build　コンテナ作成 compose up
docker compose up -d --build
rem 現在走っているコンテナのリスト確認
docker container ls
rem コンテナへ接続（コンテナの中の環境に入る）
docker-compose run --rm app bash
rem コンテナの中の環境から動かなかった　batファイルはコンテナの中では動かない

rem コンテナの中では　bash コマンドを利用する　
rem VScode の場合　dos2unixコマンドで改行コードを変換 windowsでは改行コードが\r\nになってしまう

rem Dockerのコンテナを終了し、削除
docker compose down
rem ディレクトリを戻す 



