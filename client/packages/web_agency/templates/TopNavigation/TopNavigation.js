import React from 'react'
import styled from 'styled-components'

import { Box, Grommet } from 'grommet';


function TopNavigation() {
  return (
    <Box
      tag='header'
      direction='row'
      align='center'
      justify='between'
      background='light-2'
      pad={{ vertical: 'small', horizontal: 'medium' }}
    >
      <a href="#">Link a</a>
      <a href="#">Link b</a>
      <a href="#">Link c</a>
    </Box>
  )
}

export default TopNavigation
