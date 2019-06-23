import React from "react"
import PropTypes from "prop-types"

import Header from "./header"

const Layout = ({ children }) => (
  <>
    <Header siteTitle={'immohub'} />
    <div>
      <main>{children}</main>
      <footer>
        © {new Date().getFullYear()}
      </footer>
    </div>
  </>
)

Layout.propTypes = {
  children: PropTypes.node.isRequired,
}

export default Layout
