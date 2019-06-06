import React from "react"
import { Button } from '@immohub/shared'

import Layout from "../components/layout"

console.log(Button)

const IndexPage = () => (
  <Layout>
    <h1>Hi people</h1>
    <Button>click me</Button>
    <p>Welcome to your new Gatsby site.</p>
    <p>Now go build something great.</p>
  </Layout>
)

export default IndexPage
