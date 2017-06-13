const symbols = {
  goTop: require('raw!./align-top.svg'),
  goBottom: require('raw!./align-bottom.svg'),
  goBack: require('raw!./arrow-long-up.svg'),
  goForth: require('raw!./arrow-long-down.svg'),
  reverse: require('raw!./cycle.svg'),
  close: require('raw!./squared-cross.svg'),
  info: require('raw!./info-with-circle.svg')
}

<entypo-svg class="entypo-svg">

  this.updateContent = () => {
    this.root.innerHTML = symbols[this.opts.symbol]
  }

  this.on('update', () => {
    this.updateContent()
  })

  this.updateContent()
</entypo-svg>
