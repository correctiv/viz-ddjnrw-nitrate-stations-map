import * as d3 from '../lib/d3.js'
import {stations, getColor} from './data.js'

export default map => {
  const featGroup = L.featureGroup(stations.reverse().map(d => {
    const color = getColor(d.value)
    return L.circleMarker([+d.lat, +d.lon], {
      className: d.value > 50 ? 'l-marker__circle l-marker__circle--exceed' : 'l-marker__circle',
      fillColor: color,
      color: d3.rgb(color).darker(.2).toString(),
      radius: 7,
      data: d
    })
  }))

  return featGroup
}
