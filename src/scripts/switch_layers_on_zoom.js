export default ({
  map,
  featGroup,
  hexBin
}) => {

  const setLayer = zoom => {
    if (zoom < 10) {
      map.hasLayer(hexBin) || map.addLayer(hexBin)
      map.hasLayer(featGroup) && map.removeLayer(featGroup)
    } else {
      map.hasLayer(hexBin) && map.removeLayer(hexBin)
      map.hasLayer(featGroup) || map.addLayer(featGroup)
    }
  }

  // show either hexbin or markers
  map.on('moveend', () => {
    const zoom = map.getZoom()
    setLayer(zoom)
  })

  // initial layer
  setLayer(map.getZoom())

}
