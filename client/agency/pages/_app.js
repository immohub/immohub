import React from 'react'
import App, { Container } from 'next/app'
import { Grommet } from 'grommet'
import { Reset } from 'styled-reset'

import theme from '../lib/theme'

function MyApp({ Component, pageProps }) {
  return (
    <Container>
      <Reset />
      <Grommet theme={theme}>
        <Component {...pageProps} />
      </Grommet>
    </Container>
  )
}

export default MyApp
