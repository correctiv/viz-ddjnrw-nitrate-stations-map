import * as d3 from '../lib/d3.js'
import '../lib/leaflet-d3.js'
import {stations, getColor} from './data.js'

export default map => {

  const hexbinLayer = new L.HexbinLayer({
    radius: 12,
    opacity: .6
  })

  hexbinLayer.data(stations)
    .lng(d => d.lon)
    .lat(d => d.lat)
    .fill(d => getColor(d3.max(d, e => +e.o.mean)))

  return hexbinLayer

}
