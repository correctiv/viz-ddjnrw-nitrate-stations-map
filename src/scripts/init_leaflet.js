export default ({
  elementId,
  tileLayer,
  minZoom,
  maxZoom
}) => {
  const map = L.map(elementId)
  L.tileLayer(tileLayer, {
    minZoom,
    maxZoom
  }).addTo(map)
  return map
}
