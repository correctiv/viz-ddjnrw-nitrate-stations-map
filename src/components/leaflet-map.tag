import '../components/reset-control.tag'
import '../components/legend.tag'

import initLeaflet from '../scripts/init_leaflet.js'
import addMapData from '../scripts/add_map_data.js'
import addHexBin from '../scripts/add_hexbin_layer.js'
import addMapEvents from '../scripts/add_map_events.js'
import switchLayersOnZoom from '../scripts/switch_layers_on_zoom.js'

<leaflet-map class="ddjnrw-mst-map__map-container">

  <div class="ddjnrw-mst-map__map-leaflet" id={ opts.config.leaflet.elementId }>
    <reset-control class="ddjnrw-mst-map__leaflet-control ddjnrw-mst-map__reset-control" />
    <legend class="ddjnrw-mst-map__leaflet-control ddjnrw-mst-map__legend" config={ opts.config.legend } />
  </div>

  this.on('mount', () => {
    this.map = initLeaflet(this.opts.config.leaflet)
    this.featGroup = addMapData(this.map)
    this.hexBin = addHexBin(this.map)
    this.bounds = this.featGroup.getBounds()
    this.resetMap()
    switchLayersOnZoom(this)
    addMapEvents(this.featGroup)
  })

  riot.control.on(riot.EVT.mapJumpTo, data => {
    const coords = [data.lat, data.lon]
    this.map.setView(coords, 12)
    riot.control.trigger(riot.EVT.setMarker, coords)
  })

  riot.control.on(riot.EVT.setMarker, coords => {
    const m = riot.STATE.currentMarker
    if (m) {
      m.setLatLng(coords)
    } else {
      riot.STATE.currentMarker = L.marker(coords).addTo(this.map)
    }
  })

  riot.control.on(riot.EVT.clearMarker, () => {
    const m = riot.STATE.currentMarker
    m && this.map.removeLayer(m)
    riot.STATE.currentMarker = null
  })

  riot.control.on(riot.EVT.resetMap, () => {
    this.resetMap()
  })

  this.resetMap = () => {
    this.map.fitBounds(this.bounds)
    riot.control.trigger(riot.EVT.clearMarker)
    riot.control.trigger(riot.EVT.clearInfobox)
    riot.control.trigger(riot.EVT.clearResults)
  }

</leaflet-map>
