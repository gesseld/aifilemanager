import { defineConfig } from 'vitest/config'
import react from '@vitejs/plugin-react'
import { configDefaults } from 'vitest/config'

export default defineConfig({
  plugins: [react()],
  test: {
    environment: 'jsdom',
    globals: true,
    setupFiles: './test/setup.js',
    include: ['test/unit/**/*.test.{js,jsx,ts,tsx}'],
    exclude: [...configDefaults.exclude, '**/node_modules/**'],
    coverage: {
      reporter: ['text', 'json', 'html'],
      include: ['frontend/src/**/*.{js,jsx,ts,tsx}']
    }
  }
})