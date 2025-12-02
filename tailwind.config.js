// tailwind.config.js
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
    "./app/components/**/*.{rb,erb}"  // ← importante
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
