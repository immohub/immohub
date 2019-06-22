import { Grid, Box } from 'grommet'
import HouseCard from '../../components/HouseCard'

import ContentWrapper from '../../components/ContentWrapper'

function HouseListing() {
  const size = "medium"
  return (
    <ContentWrapper>
      <Box
        margin={{
          vertical: 'medium'
        }}
        direction="row"
        align="center"
        alignContent="center"
        gap="small"
      >
        {[0, 1, 2, 3].map(index => (
          <Box width="25%" key={index}>
            <HouseCard />
          </Box>
        ))}
      </Box>
    </ContentWrapper>
  )
}

export default HouseListing
