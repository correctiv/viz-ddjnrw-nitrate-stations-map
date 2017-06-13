import {search} from '../scripts/data.js'

<searchbox class="ddjnrw-mst-map__searchbox">

  <input type="text"
    autofocus={ true }
    oninput={ doSearch } class="ddjnrw-mst-map__search-input"
    placeholder="Suche nach Deiner Stadt..."
  />
  <ul if={ results.length } class="ddjnrw-mst-map__result-list">
    <li each={ results }
      class="ddjnrw-mst-map__result-item"
      onclick={ handleClick }>
      { name }<br><span>{ stadt }</span>
    </li>
  </ul>

  this.results = []

  this.doSearch = e => {
    const str = e.target.value.toLowerCase()
    if (str.length > 2) {
      const results = search(str)
      if (results.length == 1) {
        this.clearResults()
        riot.control.trigger(riot.EVT.mapJumpTo, results[0])
      } else {
        riot.control.trigger(riot.EVT.clearInfobox)
        this.update({results})
      }
    } else {
      this.clearResults()
    }
  }

  this.handleClick = e => {
    this.clearResults()
    riot.control.trigger(riot.EVT.mapJumpTo, e.item)
  }

  this.clearResults = () => {
    this.update({results: []})
  }

  riot.control.on(riot.EVT.clearResults, () => {
    this.clearResults()
  })

</searchbox>
