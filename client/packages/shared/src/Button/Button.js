import React, { Component } from 'react'
import PropTypes from 'prop-types'

export default function Button({ onClick, children }) {
  return (
    <button onClick={onClick}>
      {children}
    </button>
  )
}
