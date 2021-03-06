import {getColor} from '../scripts/data.js'

<legend>

  <span class="ddjnrw-mst-map__legend-title">mg Nitrat pro Liter Grundwasser</span>
  <span each={ value in opts.config.ticks }
    class="ddjnrw-mst-map__legend-tick { ddjnrw-mst-map__legend-tick--dark: value < 100}"
    style="background-color:{ parent.getColor(value) };">
    { value }
  </span>

  this.getColor = getColor

</legend>
