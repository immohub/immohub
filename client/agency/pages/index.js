import { Box } from 'grommet'

import TopNavigation from '../templates/TopNavigation'
import HouseListing from '../templates/HouseListing'

function Home() {
  return (
    <Box fill>
      <TopNavigation />
      <HouseListing />
    </Box>
  )
}

export default Home
