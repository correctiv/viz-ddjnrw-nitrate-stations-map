import * as d3 from '../lib/d3.js'
import {stations, getColor} from './data.js'

export default map => {
  const featGroup = L.featureGroup(stations.map(d => {
    const color = d.recent ? getColor(d.value) : 'gray'
    return L.circleMarker([+d.lat, +d.lon], {
      className: 'l-marker__circle',
      fillColor: color,
      color: d3.rgb(color).darker(.2).toString(),
      radius: d.recent ? 7 : 5,
      data: d
    })
  }))

  return featGroup
}
