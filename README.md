Terraform 練習用

```
brew install terraform
cp env.local .env

#.envにIAMユーザのキーを入れる
terraform init
terraform apply -var 'service=hoge' -var 'env=staging

# 作成したVPCを削除する
terraform destroy -var 'service=hoge' -var 'env=staging
```
