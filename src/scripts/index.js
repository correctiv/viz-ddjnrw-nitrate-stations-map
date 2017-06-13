'use strict'

if (module.hot) {
  module.hot.accept()
}

// import 'babel-polyfill'
// import './polyfills/array-find.js'

import '../styles/index.scss'

// events
import './riot_events.js'

// components
import '../components/ddjnrw-mst-map.tag'

const CONFIG = require('json!../config.json')

// mount components
riot.mount('[data-riot-mount="ddjnrw-mst-map"]', 'ddjnrw-mst-map', {CONFIG})
