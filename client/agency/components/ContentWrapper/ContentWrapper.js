import styled from 'styled-components'
import { Box } from 'grommet'

function ContentWrapper({ children }) {
  const propsBox = {
    width: 'xlarge',
    margin: {
      horizontal: 'auto',
    },
  }

  return (
    <Box {...propsBox}>
      {children}
    </Box>
  )
}

export default ContentWrapper
