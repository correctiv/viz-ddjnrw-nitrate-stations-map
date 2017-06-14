import {getColor} from '../scripts/data.js'
import './close-button.tag'

<infobox class="ddjnrw-mst-map__infobox { -visible: visible }">

  <close-button if={ data } onclick={ close } />

  <div if={ data } class="ddjnrw-mst-map__infobox-data">
    <span
      style="background-color:{ getColor(data.value) };"
      class="ddjnrw-mst-map__value-badge ddjnrw-mst-map__value-badge--{ getModifier(data.value) }">{ data.value } mg/l</span>
    <p class="{ -hidden: data.value <= 50 }">Der EU-Grenzwert von 50 mg/l ist überschritten.</p>
    <dl>
      <dt>{ data.city }</dt>
      <dt>{ data.date }</dt>
      <dd>Datum der Messung</dd>
      <dt>{ data.area }</dt>
      <dd>Flächen-Nutzung</dd>
      <dt>{ data.kind }</dt>
      <dd>Art der Messstelle</dd>
      <dt>{ data.name }</dt>
      <dd>Bezeichnung der Messstelle</dd>
    </dl>
  </div>

  this.getColor = getColor
  this.getModifier = val => val > 30 && val < 100 ? 'dark' : 'bright'

  riot.control.on(riot.EVT.updateInfobox, data => {
    this.update({data, visible: true})
  })

  riot.control.on(riot.EVT.clearInfobox, () => {
    this.close()
  })

  this.close = () => this.update({data: null, visible: false})

</infobox>
