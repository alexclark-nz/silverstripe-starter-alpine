const mix = require('laravel-mix');

mix.js('themes/site/src/js/app.js', 'themes/site/dist/js');

mix.copyDirectory('themes/site/src/images', 'public/images');

mix.copyDirectory('themes/site/src/fonts', 'public/fonts');

mix.postCss('themes/site/src/css/style.css', 'themes/site/dist/css', [
    require('postcss-import'),
    require('tailwindcss'),
    require('postcss-nested'),
]).options({
    processCssUrls: false,
});
