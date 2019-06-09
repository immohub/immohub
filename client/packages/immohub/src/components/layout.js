import React from "react"
import PropTypes from "prop-types"

import Header from "./header"

const Layout = ({ children }) => (
  <>
    <Header siteTitle={'immohub'} />
    <div>
      <main>{children}</main>
      <footer>
        © {new Date().getFullYear()}, Built with
        {` `}
        <a href="https://www.gatsbyjs.org">Gatsby</a>
      </footer>
    </div>
  </>
)

Layout.propTypes = {
  children: PropTypes.node.isRequired,
}

export default Layout
