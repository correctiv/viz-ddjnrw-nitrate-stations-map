import {getColor} from '../scripts/data.js'
import './close-button.tag'

<infobox class="ddjnrw-mst-map__infobox { -visible: visible }">

  <close-button if={ data } onclick={ close } />

  <div if={ data } class="ddjnrw-mst-map__infobox-data">
    <span
      style="background-color:{ getColor(data) };"
      class="ddjnrw-mst-map__value-badge ddjnrw-mst-map__value-badge--{ getModifier(data) }">{ data.mean || data.value }&nbsp;mg/l</span>
    <p if={ data.mean }>Durchschnitt der letzten 10 Jahre.</p>
    <p if={ data.recent && data.mean > 50 }>Der EU-Grenzwert von 50 mg/l ist überschritten.</p>
    <p if={ !data.recent }>Die letzte Messung an dieser Station liegt über 10 Jahre zurück.</p>
    <dl>
      <dt>{ data.city }</dt>
      <dt>{ data.value }&nbsp;mg/l</dt>
      <dd>Letzte Messung: { data.date }</dd>
      <dt>{ data.area }</dt>
      <dd>Flächen-Nutzung</dd>
      <dt>{ data.kind }</dt>
      <dd>Art der Messstelle</dd>
      <dt>{ data.name }</dt>
      <dd>Bezeichnung der Messstelle</dd>
    </dl>
  </div>

  this.getColor = data => data.recent ? getColor(data.mean) : '#dadada'
  this.getModifier = data => data.recent ? data.mean > 30 && data.mean < 100 ? 'dark' : 'bright' : 'stale'

  riot.control.on(riot.EVT.updateInfobox, data => {
    this.update({data, visible: true})
  })

  riot.control.on(riot.EVT.clearInfobox, () => {
    this.close()
  })

  this.close = () => this.update({data: null, visible: false})

</infobox>
