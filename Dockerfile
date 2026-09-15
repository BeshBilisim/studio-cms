FROM node:22-bookworm-slim

ENV HOST=0.0.0.0 \
    NODE_ENV=production \
    PNPM_HOME=/pnpm \
    PORT=4321

ENV PATH=$PNPM_HOME:$PATH

WORKDIR /workspace

RUN corepack enable

COPY . .

RUN pnpm install --frozen-lockfile \
    && pnpm build:packages \
    && pnpm --filter blog-cms build

EXPOSE 4321

CMD ["node", "apps/blog/dist/server/entry.mjs"]
