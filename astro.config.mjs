import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import purgecss from 'astro-purgecss';
import compress from 'astro-compress';
import * as sass from 'sass';

// https://astro.build/config
export default defineConfig({
  site: 'https://mayurifag.ru',
  integrations: [
    compress(),
    purgecss(),
    sitemap(),
  ],
  vite: {
    css: {
      preprocessorOptions: {
        scss: {
          implementation: sass
        }
      }
    }
  }
})
