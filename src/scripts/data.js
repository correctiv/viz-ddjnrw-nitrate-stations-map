import * as d3 from '../lib/d3.js'

const formatDate = d3.timeFormat('%d.%m.%Y')
const parseDate = d3.timeParse('%Y-%m-%d')
const fromDate = date => formatDate(date)
const toDate = str => parseDate(str)

// read in data
const stations = d3.csvParse(require('raw!../data/stations_2015.csv')).map(s => {
  s.Date = toDate(s.date)
  s.date = fromDate(s.Date)
  s.value = +s.value
  return s
})

// compute searchdata for cities
const searchData = d3.csvParse(require('raw!../data/nrw_munis_search.csv')).map(s => {
  s.search = s.name.toLowerCase()
  return s
})

// compute colors

//// below 50
const cScale = d3.scaleLinear().range([1, 0]).domain([0, 50])

//// above 50
const colorDomain50 = [50, d3.max(stations.map(s => s.value))]
const cScale50 = d3.scaleLinear().range([0, 1]).domain(colorDomain50)

module.exports = {
  stations,
  search: str => searchData.filter(d => d.search.indexOf(str) > -1),
  getColor: val => val > 50 ? d3.interpolateYlOrRd(cScale50(val)) : d3.interpolateYlGn(cScale(val))
}
