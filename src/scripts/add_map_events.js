export default group => {
  group.on('click', m => {
    const data = m.layer.options.data
    riot.control.trigger(riot.EVT.clearResults)
    riot.control.trigger(riot.EVT.updateInfobox, data)
    riot.control.trigger(riot.EVT.setMarker, [data.lat, data.lon])
  })
}
