import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';
import glsl from 'vite-plugin-glsl';
import vue from "@astrojs/vue";

// https://astro.build/config
export default defineConfig({
  site: 'https://example.com',
  integrations: [mdx(), sitemap(), vue()],
  vite: {
    plugins: [glsl()]
  }
});