<reset-control>

  <button
    onclick={ resetMap }
    class="ddjnrw-mst-map__reset-control-button btn">
    Ansicht zurücksetzen
  </button>

  this.resetMap = () => {
    riot.control.trigger(riot.EVT.resetMap)
  }

</reset-control>
