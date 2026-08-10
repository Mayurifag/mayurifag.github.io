import { defineConfig } from 'astro/config';
import compress from 'astro-compress';
import * as sass from 'sass';

// https://astro.build/config
export default defineConfig({
  integrations: [
    compress(),
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
