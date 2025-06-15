# EasyForgeClassic

[ForgeClassic](https://github.com/Haoming02/sd-webui-forge-classic) を極力最短操作でセットアップして実行するツールです。  
Illustrious を中心にしています。

- 1 操作でセットアップが完結
- よく使うだろう機能がとりあえず入ってる
- Civitai キーを設定すると追加データもダウンロード

設定がよーわからん場合は [@white_azalea](https://x.com/white_azalea) にでも聞いたって。 

## インストール方法

1. [EasyForgeClassicInstaller.bat](https://github.com/Sunao-Yoshii/EasyForgeClassic/raw/main/EasyForgeClassic/EasyForgeClassicInstaller.bat) を右クリックから保存します。
    - NVIDIA GPU の Windows PC、20GB 以上の空きストレージ、PC の管理者権限、アバストなどの Windows Diffender でないウィルスチェック無効化、VPN の無効化が必要です。
2. `C:/EasyForgeClassic/` などの浅いパスのインストール先の 空フォルダ で、`EasyForgeClassicInstaller.bat` をダブルクリックして実行します。
    - `WindowsによってPCが保護されました` と表示されたら、`詳細表示` から `実行` します。
3. `動作に必要なモデルなどをダウンロードします。よろしいですか？ [y/n]（空欄なら y）` で `y` , `Enter` します。
4. インストール先の `EasyForgeClassic/vc_redist.x64.exe` で、 `Microsoft Visual C++ Redistributable` をインストールします。
5. インストールが問題なく終了したら [使い方](#使い方) へ。

## 使い方

### 基本操作

- `EasyForgeClassic` インストール先にある `ForgeClassic.bat` で起動します。
    - 右側の `生成` ボタンで画像を生成します。
        - 画像は `OutputForge\txt2img-images` に保存されます。
    - プロンプト欄に入力するタグは [Danbooru](https://danbooru.donmai.us/) の左上にある `Search` 欄で、日本語で検索して調べます 。
    - `生成` ボタンと、スタイル設定の下 `タグを選択` ボタンを押すと、設定タグを指定する選択ボックスが出ます。
        - `illustrious_rating` は、レーティングタグ（年齢指定のグレード指定タグ）が登録されています
        - `illustrious_setting` は、生成設定が入っていて、指定した後 ↙️ で適用できます。
    - プロンプト末尾の safe は TIPO 用のレーティング指定です。
        TIPO を利用しない場合は削除してください（金庫が生成される場合があります）。
    - プロンプト入力欄下の TIPO を開いて Enabled を有効にすると、入力済みのプロンプトから関連するプロンプトを追加して生成します（NSFW で特に強力です）。
        - 評価の高い NSFW を試すには safe を explicit に書き換えます。
    - 画像生成で問題が発生したら『画像生成のトラブルシューティング』へ。
- **起動時の設定状態は `Settings` の左下にある `Other` - `Defaults` で変更できます。**
	- `View changes` で変更内容を確認して、`Apply` で保存します。
	- 設定がよくわからなくなったら `sd-webui-forge-classic/` にある `config.json`, `ui-config.json`, `styles.csv` を退避してから `ForgeClassic.bat` を実行すると、初期状態にリセットします。
- VRAM の少ない GPU 多分落ちます… `Never OOM Integrated` なんて素敵なモンはないので、素直に [EasyReforge](https://github.com/Zuntan03/EasyReforge) 使いましょう…。

### 追加データのダウンロード

- `Settings` の左上 `Search...` 欄に `api` と入力すると `[Wiki] API key for authenticating with Civitai.` の設定が表示されます。  
	- [Wiki](https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper/wiki/Civitai-API-Key) のリンク先をブラウザで翻訳して、内容にそって API Key を取得して、この設定欄にコピペしてから上の `Apply settings` で保存します。
- Civitai キーを設定したら `Download/illustrious_standard.bat` でモデルなどを一式ダウンロードします。
- 追加データをダウンロードするとキャラやスタイルのワイルドカードが使えます。
	- `__NsfwPony/char__`: キャラワイルドカード
	- `__Booru1girl__`: 女性のみキャラワイルドカード
	- `__MixedStyle__`: 混合スタイルワイルドカード
- `Download/` 直下の `bat` では追加データを一式ダウンロードできます。
	- `Minimum`: 画像生成ができる最低限の関連ファイルをダウンロードします。`Minimum` のみ、下記の Civitai キー設定をしなくてもダウンロードできます。
	- `Standard`: `Minimum` に加えて、モデル含むの標準的な関連ファイルをダウンロードします。LoRA や ADetailer 検出モデルや Wildcard など、容量に対して効果が大きいモノが多いため、Civitai キーを登録してのダウンロードを推奨します。
	- サブフォルダの `bat` で個別のダウンロードもできます。
	- モデルや LoRA は日々新しいモノが公開されますので、[Civitai](https://civitai.com/) で気になったモノを `Civitai Helper` でダウンロードしたり、`Civitai Helper Browser` で直接ダウンロードしてください（Civitai キー設定が必要）。

### 他の環境とのリソース共有

- モデルや LoRA は `Model/` 以下に保存します。
- 各サブフォルダの `LinkInput.bat` と `LinkOutput.bat` でモデルや LoRA を共有できます。
	- EasyForgeClassic から他の環境のモデルや LoRA を参照したい場合は、`LinkInput.bat` を実行してください。
	- EasyForgeClassic のモデルや LoRA を他の環境から参照したい場合は、`LinkOutput.bat` を実行してください。

## 参照

EasyReforge の作りをまねて作成されました。

https://github.com/Zuntan03/EasyReforge
Copyright (c) 2024 Zuntan All Rights Reserved.

EasyTools にどっぷり依存しています。
真面目に自分で作るのが苦行すぎるくらいには便利なユーティリティ…

https://github.com/Zuntan03/EasyTools
Copyright (c) 2024 Zuntan All Rights Reserved.

## 更新履歴

### 2025/06/15

- 標準の CivitaiHelper の代わりに kai-rin 氏の fork 版を採用しました。
    これに伴い、追加データダウンロードの手順が変更になっています。
    既存のユーザは `git checkout -- CivitaiKey.bat` してから `git pull origin main` で対処できると思います。
    - https://github.com/kai-rin/Stable-Diffusion-Webui-Civitai-Helper
- 若干の速度アップ版起動コマンド `ForgeClassic_withXformers.bat` を追加しました。
- GPU メモリが少ないとクラッシュする高速版 `ForgeClassic_withCudaParams.bat` も追加しました。

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。