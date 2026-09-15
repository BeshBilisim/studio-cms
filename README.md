# EmDash blog CMS

Astro 7 SSR uygulaması; EmDash CMS, PostgreSQL ve yerel medya depolaması kullanır.

## Yerel çalışma

Docker Desktop yüklüyse PostgreSQL'i başlat:

```bash
docker compose up -d postgres
npm run dev
```

- Site: `http://localhost:4321`
- Yönetim: `http://localhost:4321/_emdash/admin/`
- İlk istekte migration ve demo seed uygulanır; ardından yönetici hesabını oluşturursun.

`.env` yerel bağlantıyı içerir ve Git'e girmez. İlk kurulumda `EMDASH_ENCRYPTION_KEY` oluşturulmuştur. Kaybedilirse şifrelenmiş CMS sırları çözülemez.

## Coolify

1. Bu dalı (`beshbilisim-blog`) seçip Dockerfile ile deploy et.
2. Coolify PostgreSQL servisinin `DATABASE_URL` değerini uygulamanın environment alanına gir.
3. `EMDASH_ENCRYPTION_KEY` için yeni, sabit bir anahtar üret: `npx emdash secrets generate`.
4. `EMDASH_SITE_URL` değerini gerçek HTTPS alan adına ayarla.
5. Kalıcı volume ekle: `/app/uploads`.
6. Port: `4321`.

`DATABASE_URL`, migration yapabilen ve EmDash tablolarının sahibi olan bir PostgreSQL kullanıcısına ait olmalıdır.

## Kontroller

```bash
npm run typecheck
npm run build
```
