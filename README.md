Terraform 練習用

```
brew install terraform
cp env.local .env

# 実行
terraform init
terraform apply -var 'service=hoge' -var 'env=staging

# 削除
terraform destroy -var 'service=hoge' -var 'env=staging
```
