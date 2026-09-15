FROM node:22-bookworm-slim

ENV HOST=0.0.0.0 \
    PNPM_HOME=/pnpm \
    PORT=4321

ENV PATH=$PNPM_HOME:$PATH

WORKDIR /workspace

RUN corepack enable

COPY . .

RUN pnpm install --frozen-lockfile \
    && pnpm build:packages \
    && pnpm --filter blog-cms build

ENV NODE_ENV=production

EXPOSE 4321

CMD ["node", "apps/blog/dist/server/entry.mjs"]
