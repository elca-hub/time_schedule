# time_schedule

※ このリポジトリはruby on railsの遊び場です ※

## version

- ruby : 3.2.2
- rails : 7.0.4.3

## What's time_schedule

ユーザが時間割を登録するだけのシステム

## TODO

- [ ] keycloakで外部IdPとの連携
- [ ] ユーザのCRUD

## 使用する前に

### 準備

以下のコマンドを入力してください。

```bash
docker run -p 8080:8080 -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:21.0.2 start-dev
```

