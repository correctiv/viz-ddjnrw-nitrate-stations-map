# viz-ddjnrw-nitrate-stations-map

Show & explore data about nitrate measurement stations in german state North-Rhine Westphalia.

[See published story at correctiv.org (in german)](https://correctiv.org/nitrat-nrw)

[See preview of this viz via gh-pages](https://correctiv.github.io/viz-ddjnrw-nitrate-stations-map/dist/)

Based on [wbkd/yet-another-webpack-es6-starterkit](https://github.com/wbkd/yet-another-webpack-es6-starterkit)

Uses [leaflet](https://leafletjs.com) and [riotjs](https://riotjs.com)


## base visualization setup for correctiv cms

### javascript

```
dist/bundle.js
```

### styles

```
dist/styles/bundle.css
```

## for use in correctiv cms plugins:

**Hint:** For use in other circumstances all you need to have is a html-tag with `data-riot-mount="ddjnrw-mst-map"` -attribute that lives somewhere. You can control the overall width with a parent container. Inside this viz the container dimensions are (mostly) relative.

### html

```html
<figure class="figure -full-width">
  <h2>Some nice title</h2>
  <div class="figure__container">
    <div data-riot-mount="ddjnrw-mst-map"></div>
  </div>
</figure>
<div class="figure__credits">
  <p><strong>Daten:</strong> <a href="">Data Source</a>, eigene Berechnungen, gerundet.</p>
</div>
```

## Development

### Installation

```
npm install
```

### Start Dev Server

```
npm run dev
```

### Build Prod Version

```
npm run build
```

### Features:

* ES6 Support via [babel-loader](https://github.com/babel/babel-loader)
* SASS Support via [sass-loader](https://github.com/jtangelder/sass-loader)
* Linting via [eslint-loader](https://github.com/MoOx/eslint-loader)
* Hot Module Replacement

When you run `npm run build` we use the [extract-text-webpack-plugin](https://github.com/webpack/extract-text-webpack-plugin) to move the css to a separate file and included in the head of your `index.html`, so that the styles are applied before any javascript gets loaded. We disabled this function for the dev version, because the loader doesn't support hot module replacement.
