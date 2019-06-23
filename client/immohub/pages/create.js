import React from "react"
import { Formik, Field } from 'formik';
import styled from 'styled-components'

import Layout from "../components/layout"

import { createAgency } from '../lib/create_agency'

function CreatePage() {
  const initialValues = {
    agency: '',
    name: '',
    email: '',
    password: '',
  }

  return (
    <Layout>
      <Formik
        initialValues={initialValues}
        onSubmit={(values, { setSubmitting }) => {
          setSubmitting(false);
          createAgency().then(res => {
            console.log(res)
          })
        }}
      >
        {({ isSubmitting, handleSubmit }) => (
          <form onSubmit={handleSubmit}>
            <label htmlFor="agency-name">Agency name</label>
            <Field
              id="agency-name"
              component="input"
              name="agency" />

            <label htmlFor="user-name">Your name</label>
            <Field
              id="user-name"
              component="input"
              name="name" />

            <label htmlFor="user-email">Your email</label>
            <Field
              id="user-email"
              component="input"
              name="email" />

            <label htmlFor="user-password">Your password</label>
            <Field
              id="user-password"
              component="input"
              type="password"
              name="password" />

            <button disabled={isSubmitting} type="submit">submit</button>
          </form>
        )}
      </Formik>
    </Layout>
  )
}

export default CreatePage
