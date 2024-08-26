import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import purgecss from 'astro-purgecss';
import compress from 'astro-compress';

// https://astro.build/config
export default defineConfig({
  site: 'https://mayurifag.ru',
  integrations: [
    compress(),
    purgecss(),
    sitemap(),
  ],
})
