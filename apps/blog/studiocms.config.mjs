import blog from '@studiocms/blog';
import html from '@studiocms/html';
import md from '@studiocms/md';
import { defineStudioCMSConfig } from 'studiocms/config';

export default defineStudioCMSConfig({
	dbStartPage: process.env.STUDIOCMS_DB_START_PAGE !== 'false',
	db: {
		dialect: 'postgres',
	},
	plugins: [md(), html(), blog()],
});
