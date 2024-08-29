import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';
import glsl from 'vite-plugin-glsl';
import vue from "@astrojs/vue";
import UnoCSS from 'unocss/astro'
import { templateCompilerOptions } from '@tresjs/core';

// https://astro.build/config
export default defineConfig({
  site: 'https://example.com',
  integrations: [mdx(), sitemap(), vue({
    ...templateCompilerOptions,
  }), UnoCSS(),],
  vite: {
    plugins: [glsl()]
  }
});