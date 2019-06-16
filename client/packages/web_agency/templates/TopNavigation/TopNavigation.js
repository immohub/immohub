import React from 'react'
import styled from 'styled-components'

const Navigation = styled.nav`
  display: flex;
  justify-content: space-between;
`;

function TopNavigation() {
  return (
    <Navigation>
      <a href="#">Link a</a>
      <a href="#">Link b</a>
      <a href="#">Link c</a>
    </Navigation>
  )
}

export default TopNavigation
