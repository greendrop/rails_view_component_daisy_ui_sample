import eslint from '@eslint/js';
import tseslint from "typescript-eslint";
import globals from "globals";
import eslintConfigPrettier from "eslint-config-prettier";

export default tseslint.config([
  {
    files: [
      "**/*.{js,mjs,cjs,ts,mts,cts}"
    ],
    languageOptions: {
      globals: globals.browser
    }
  },
  eslint.configs.recommended,
  tseslint.configs.recommended,
  eslintConfigPrettier
]);
