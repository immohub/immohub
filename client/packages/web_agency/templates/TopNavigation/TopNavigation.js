import React from 'react'
import styled from 'styled-components'

import { Box, Grommet, Heading } from 'grommet';
import ContentWrapper from '../../components/ContentWrapper'

function TopNavigation() {
  return (
    <Box
      tag='header'
      background='brand'
    >
      <ContentWrapper>
        <Box
          direction='row'
          align='center'
          justify='between'
          pad={{ vertical: 'small' }}
        >
          <Heading level='3' margin='none'>My agency</Heading>
          <a href="#">Link a</a>
          <a href="#">Link b</a>
          <a href="#">Link c</a>
        </Box>
      </ContentWrapper>
    </Box>
  )
}

export default TopNavigation
