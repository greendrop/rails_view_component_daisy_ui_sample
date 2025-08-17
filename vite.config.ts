import { defineConfig } from 'vite'
import ViteRails from 'vite-plugin-rails'

export default defineConfig({
  plugins: [
    ViteRails({
      envVars: { RAILS_ENV: 'development' },
      fullReload: {
        additionalPaths: [
          "app/frontend/**/*",
          "app/views/**/*",
          "config/routes.rb",
        ],
        delay: 300,
      },
      stimulus: {},
    }),
  ],
})
