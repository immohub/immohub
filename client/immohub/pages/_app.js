import React from 'react'
import App, { Container } from 'next/app'
import { Reset } from 'styled-reset'

function MyApp({ Component, pageProps }) {
  return (
    <Container>
      <Reset />
      <Component {...pageProps} />
    </Container>
  )
}

export default MyApp
