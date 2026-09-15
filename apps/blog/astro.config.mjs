import node from '@astrojs/node';
import { defineConfig } from 'astro/config';
import studioCMS from 'studiocms';

const site = process.env.PUBLIC_SITE_URL ?? 'http://localhost:4321';

export default defineConfig({
	adapter: node({ mode: 'standalone' }),
	integrations: [studioCMS()],
	output: 'server',
	server: {
		host: true,
		port: Number(process.env.PORT ?? 4321),
	},
	site,
	vite: {
		build: {
			cssMinify: 'esbuild',
		},
	},
});
