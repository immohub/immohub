import styled from 'styled-components'
import { Box, Heading } from 'grommet'

const houseImg = "https://i.kinja-img.com/gawker-media/image/upload/s--bIV3xkEm--/c_scale,f_auto,fl_progressive,q_80,w_800/jsprifdd1gmfy7e7nola.jpg"

const Img = styled.img`
  width: 100%;
`

function HouseCard() {
  return (
    <Box>
      <Img src={houseImg} />
      <Heading level={4}>Ferdinant Bolstraat</Heading>
    </Box>
  )
}

export default HouseCard
