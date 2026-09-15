# Coolify deployment

Deploy the repository with the following settings:

- Branch: `deploy/astro7-postgres`
- Build pack: Dockerfile
- Dockerfile: `/Dockerfile`
- Port: `4321`
- Health check path: `/api/health`

Configure these variables in Coolify. Do not commit real credentials:

```env
PUBLIC_SITE_URL=https://cms.example.com

CMS_PG_DATABASE=studiocms
CMS_PG_USER=studiocms
CMS_PG_PASSWORD=replace-with-a-secret
CMS_PG_HOST=postgres-service-name
CMS_PG_PORT=5432

CMS_ENCRYPTION_KEY=replace-with-a-random-base64-key
STUDIOCMS_DB_START_PAGE=true
```

`CMS_PG_HOST` must be the PostgreSQL service hostname on the Coolify network, not
`localhost`.

## First installation

1. Deploy with `STUDIOCMS_DB_START_PAGE=true`.
2. Open `/start` and complete the StudioCMS database and administrator setup.
3. Change `STUDIOCMS_DB_START_PAGE` to `false` in Coolify.
4. Redeploy the application.

The application source is under `apps/blog/src`. StudioCMS and its plugins are
built from the same Astro 7-compatible workspace revision during deployment.
